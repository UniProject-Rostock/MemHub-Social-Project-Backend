package loginpage.test.Controller;

import loginpage.test.DAO.*;
import loginpage.test.Entity.*;
import loginpage.test.Service.EmailService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
public class UserController {

    @Autowired
    @Qualifier("userRepo")
    UserRepo userRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    BeitragRepo beitragRepo;

    @Autowired
    GruppeRepo gruppeRepo;

    @Autowired
    NotificationRepo notificationRepo;

    @Autowired
    FreundschaftRepo freundschaftRepo;

    @Autowired
    EmailService emailService;

    int id = LoginController.id;

    @RequestMapping("/profile")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String getUserDetails(@RequestParam("uid") int uid, Model model) throws Exception {

        User user = userRepo.findByUid(uid);

        List<User> userList = new ArrayList<>();
        userList.add(user);

        model.addAttribute("user", userList);

        List<Beitrag> postsOfUser = beitragRepo.getAllPostsFromUser(uid);

        model.addAttribute("beitrag", postsOfUser);

        List<User> usersInfosInBeitrag = userRepo.getAllPostsFromUserInUser(uid);

        model.addAttribute("userBeitrag", usersInfosInBeitrag);

        System.out.println(postsOfUser);

        return "user-ui/user-menu.jsp";
    }

    @RequestMapping("/freund-profile")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String profileOfFriend(@RequestParam("fid") int fid, @RequestParam("uid") int uid, Model model) throws Exception {

        User user = userRepo.findByUid(fid);

        List<User> userList2 = new ArrayList<>();
        userList2.add(user);

        model.addAttribute("user", userList2);

        List<Beitrag> postsOfFriend = beitragRepo.getAllPostsFromUser(fid);

        model.addAttribute("beitrag", postsOfFriend);

        List<User> usersInfosInBeitrag = userRepo.getAllPostsFromUserInUser(fid);

        model.addAttribute("userBeitrag", usersInfosInBeitrag);

        return "user-ui/friend-profile.jsp";
    }

    @RequestMapping("/notifications")
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResponseEntity sendNotifications(HttpServletRequest request) {

        int uid = Integer.parseInt(request.getParameter("uid"));

        List<Notification> notifications = notificationRepo.getUserNotifications(uid);
        List<String> result = new ArrayList<>();

        for (Notification notification : notifications) {
            result.add(notification.getInhalt());
        }

        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @RequestMapping("/friends")
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResponseEntity friends(HttpServletRequest request) {

        int uid = Integer.parseInt(request.getParameter("uid"));

        List<User> users = userRepo.findAll();
        List<String> result = new ArrayList<>();

        for (User user : users) {
            result.add(user.getVorname() + " " + user.getNachname());
            result.add(String.valueOf(user.getUid()));
        }

        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @RequestMapping("/gruppeEinladung")
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResponseEntity gruppeEinladen(HttpServletRequest request) {

        int uid = Integer.parseInt(request.getParameter("uid"));
        String groupName = request.getParameter("groupName");
        int friendId = Integer.parseInt(request.getParameter("friendId"));
        int gid = Integer.parseInt(request.getParameter("gid"));

        User user = userRepo.findByUid(uid);


        Notification notification = new Notification();
        notification.setHeader("Gruppenanfrage");
        notification.setInhalt(user.getVorname() + " " + user.getNachname() + " " + "hat Sie zu der Gruppe" + " " + groupName + " hinzugefuegt");
        notificationRepo.save(notification);

        notificationRepo.addNotificationToUser(friendId, notification.getId());

        gruppeRepo.addGroupToUser(friendId, gid);

        return ResponseEntity.status(HttpStatus.OK).body("gesendet");
    }

    @RequestMapping("/freundschaftSenden")
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResponseEntity freundschaftSenden(HttpServletRequest request) {

        int uid = Integer.parseInt(request.getParameter("uid"));
        int fid = Integer.parseInt(request.getParameter("fid"));


        User user = userRepo.findByUid(uid);

        User friend = userRepo.findByUid(fid);

        Notification notification = new Notification();
        notification.setHeader("Freundschaftsanfrage");
        notification.setInhalt(user.getVorname() + " " + user.getNachname() + " " + "hat Ihnen eine Freundschaftsanfrage gesendet");
        notificationRepo.save(notification);

        notificationRepo.addNotificationToUser(fid, notification.getId());

        Freundschaft freundschaft = new Freundschaft();
        freundschaft.setFreundId(fid);
        freundschaft.setUserId(uid);
        freundschaft.setStatus("Gesendet");
        freundschaftRepo.save(freundschaft);

        System.out.println("hell oldu");
        return ResponseEntity.status(HttpStatus.OK).body("gesendet");
    }

    @RequestMapping("/checkFreundschaftsStatus")
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResponseEntity checkFreundschaftsStatus(HttpServletRequest request) {

        int uid = Integer.parseInt(request.getParameter("uid"));
        int fid = Integer.parseInt(request.getParameter("fid"));


        Freundschaft freundschaft = freundschaftRepo.checkFreundschaftsStatus(uid, fid);

        String status = freundschaft.getStatus();

        String message = null;

        if (status.equals("Gesendet")) {
            message = "gesendet";
        } else if (status.equals("Angenommen")) {
            message = "angenommen";
        }

        return ResponseEntity.status(HttpStatus.OK).body(message);
    }


    @RequestMapping("/addUser")
    public String addUser(@RequestParam("vorname") String vorname,
                          @RequestParam("nachname") String nachname,
                          @RequestParam("email") String email,
                          @RequestParam("passwort1") String passwort,
                          @RequestParam("geburtsdatum") Date geburtsDatum,
                          @RequestParam("geschlecht") String geschlecht) {

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(passwort);

        User registeredUser = userRepo.findByEmail(email);
        Date date = new Date();

        System.out.println(registeredUser);
        if (registeredUser != null) {
            System.out.println("movcud user");
            registeredUser.setDeleted(0);
            registeredUser.setBlocked(0);
            registeredUser.setGeschlecht(geschlecht);
            registeredUser.setEmail(email);
            registeredUser.setNachname(nachname);
            registeredUser.setVorname(vorname);
            registeredUser.setPassword(hashedPassword);
            registeredUser.setGeburtsDatum(geburtsDatum);
            System.out.println("current date: " + date);
            registeredUser.setBeigetreten(date);
            userRepo.save(registeredUser);
        } else {
            System.out.println("movcud olmayan user");
            User user = new User(vorname, nachname, hashedPassword, email, geburtsDatum, geschlecht);
            user.setBlocked(0);
            user.setDeleted(0);
            user.setBeigetreten(date);
            userRepo.save(user);

            roleRepo.insertUserRole(user.getUid(), 2);
        }

        return "redirect:/success";
    }

    @RequestMapping("/editUser")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String editUser(@RequestParam("vorname") String vorname,
                           @RequestParam("nachname") String nachname,
                           @RequestParam("email") String email,
                           @RequestParam("beschreibung") String beschreibung,
                           @RequestParam("geschlecht") String geschlecht,
                           @RequestParam("wohnort") String wohnort,
                           @RequestParam("beziehungsstatus") String beziehunsstatus,
                           @RequestParam("uid") int uid) {


        User user = userRepo.findByUid(uid);

        user.setVorname(vorname);
        user.setNachname(nachname);
        user.setEmail(email);
        user.setBeschreibung(beschreibung);
        user.setGeschlecht(geschlecht);
        user.setBeziehungsstatus(beziehunsstatus);
        user.setWohnort(wohnort);

        userRepo.save(user);

        return "redirect:/profile?uid=" + uid;
    }

    @RequestMapping("/checkEmail")
    @ResponseBody
    public ResponseEntity checkEmail(HttpServletRequest request) {
        String email = request.getParameter("email");
        System.out.println(email);
        String message;
        User user = userRepo.findByEmail(email);
        if (user != null && user.getDeleted() == 0) {
            message = "Email is not available";
            System.out.println("Email is not available");
        } else {
            message = "Email is available";
            System.out.println("Email is available");
        }
        return ResponseEntity.status(HttpStatus.OK).body(message);
    }

    @RequestMapping("/kontaktiereUns")
    public String contactUsFromUserPage() {

        return "login-ui/contact-us_user.jsp";
    }

    @RequestMapping("/sendeNachricht")
    public String contactUsFromUser(@RequestParam("vorname") String vorname,
                                    @RequestParam("nachname") String nachname,
                                    @RequestParam("email") String email,
                                    @RequestParam("nachricht") String nachricht) {

        System.out.println(vorname);
        System.out.println(nachname);
        System.out.println(email);
        System.out.println(nachricht);

        return "redirect:/successContact";
    }

    @RequestMapping(value = "/successContact", method = RequestMethod.GET)
    public String registrationOnSuccess(Model model) {

        model.addAttribute("successContact", "true");

        return "login-ui/contact-us_user.jsp";
    }


    @RequestMapping("/deleteYourProfile")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String deleteProfilePage(@RequestParam("uid") int uid) {

        return "user-ui/delete-profile.jsp";
    }

    @RequestMapping("/userDeletesProfile")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String userDeletesProfile(@RequestParam("uid") int uid) {

        User user = userRepo.findByUid(uid);
        user.setDeleted(1);
        userRepo.save(user);

        return "redirect:/login";
    }

    @RequestMapping("/willkommen")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String welcomeUserPage(@RequestParam("uid") int uid) {

        return "user-ui/welcome-page.jsp";
    }

    @RequestMapping("/confirmWelcomeInfos")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String welcomeUserInfos(@RequestParam("uid") int uid,
                                   @RequestParam("wohnort") String wohnort,
                                   @RequestParam("beziehungsstatus") String beziehungsstatus,
                                   @RequestParam("beschreibung") String beschreibung) {

        User user = userRepo.findByUid(uid);

        user.setWohnort(wohnort);

        user.setBeziehungsstatus(beziehungsstatus);

        user.setBeschreibung(beschreibung);

        userRepo.save(user);

        return "redirect:/profile?uid=" + uid;
    }


    @RequestMapping("/startseite")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String startSeite(@RequestParam("uid") int uid, Model model) {

        User user = userRepo.findByUid(uid);


        List<Gruppe> gruppen = gruppeRepo.groupsOfUser(uid);
        model.addAttribute("gruppen", gruppen);

        List<User> usersInfosInBeitrag = userRepo.getAllPostsFromUserInUser(uid);

        model.addAttribute("beitrags", usersInfosInBeitrag);

        return "user-ui/startseite.jsp";
    }

    @RequestMapping("/identifyUser")
    @PreAuthorize("hasRole('ROLE_USER')")
    @ResponseBody
    public ResponseEntity identifyUser(HttpServletRequest request) {

        int uid = Integer.valueOf(request.getParameter("uid"));

        User user = userRepo.findByUid(uid);

        String fullName = user.getVorname() + " " + user.getNachname();

        return ResponseEntity.status(HttpStatus.OK).body(fullName);
    }

    @PostMapping("/forgotpassword")
    public String forgotPassword(@RequestParam("forgotemail") String email, HttpServletRequest request) {
        User user = userRepo.findByEmail(email);


        if (user != null) {
            user.setToken(RandomStringUtils.randomAlphanumeric(17).toUpperCase());
            userRepo.save(user);
            String appUrl = request.getScheme() + "://" + request.getServerName();
            SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
            passwordResetEmail.setTo(user.getEmail());
            System.out.println(user.getGeschlecht());
            System.out.println(user.getVorname());
            passwordResetEmail.setSubject("Passwort zurücksetzen - MemoHub");
            passwordResetEmail.setText("Guten Tag, wir haben gehört, dass Sie Ihr Passwort vergessen haben. Kein Problem! \n \nKlicken Sie bitte einfach auf den folgenden Link, um Ihr Passwort zurückzusetzen:\n" +
                    "http://localhost:8083/zuruecksetzen?uid=" + user.getUid() + "&token=" + user.getToken() + "\n \nWenn Sie den Link innerhalb von 3 Stunden nicht verwenden, wird der Link ablaufen. \n \n \nMit freundlichen Grüßen \nMemHub Team");
            emailService.sendEmail(passwordResetEmail);
        } else {
            System.out.println("not found");
        }
        return "redirect:/successEmailForgotPassword";
    }

    @GetMapping("/successEmailForgotPassword")
    public String successEmailForgotPassword(Model model) {

        model.addAttribute("successEmailForgotPassword", "true");

        return "login-ui/login.jsp";
    }

    @RequestMapping("/zuruecksetzen")
    public String passwortZuruecksetzenPage(@RequestParam("token") String token, @RequestParam("uid") int uid) {

        return "login-ui/reset-password.jsp";
    }

    @RequestMapping("/newPassword")
    public String passwortZuruecksetzen(@RequestParam("token") String token, @RequestParam("uid") int uid, @RequestParam("newPass") String passwort, Model model) {

        User user = userRepo.findByUid(uid);
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(passwort);

        if (user.getToken().equals(token)) {
            user.setToken("");
            user.setPassword(hashedPassword);
            userRepo.save(user);

        }
        model.addAttribute("passwordResetSuccess", "true");

        return "login-ui/login.jsp";
    }
}