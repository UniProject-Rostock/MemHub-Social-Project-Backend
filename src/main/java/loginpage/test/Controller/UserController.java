package loginpage.test.Controller;

import loginpage.test.DAO.BeitragRepo;
import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Entity.Beitrag;
import loginpage.test.Entity.User;
import loginpage.test.Service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

    int id = LoginController.id;

    @RequestMapping("/profile")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String getUserDetails(@RequestParam("uid") int uid, Model model) throws Exception {

        User user = userRepo.findByUid(uid);

        List<User> userList = new ArrayList<>();
        userList.add(user);

        System.out.println(user.getGeburtsDatum());

        model.addAttribute("user", userList);

        return "user-ui/user-menu.jsp";
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

    @RequestMapping("/users")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String getAllUsers(Model model) {


        List<User> users = userRepo.getOnlyUsers(2);
        model.addAttribute("users", users);

        return "admin-ui/user-table.jsp";
    }

    @RequestMapping("/blockUser")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String blockUserPage(@RequestParam("uid") int uid) {

        return "admin-ui/block-user.jsp";
    }

    @RequestMapping("/block")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String blockUser(@RequestParam("uid") int uid) {

        User user = userRepo.findByUid(uid);

        System.out.println(uid);

        user.setBlocked(1);
        userRepo.save(user);

        return "redirect:/users";
    }

    @RequestMapping("/unblockUser")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String unblockUserPage(@RequestParam("uid") int uid) {

        return "admin-ui/unblock-user.jsp";
    }

    @RequestMapping("/unblock")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String unblockUser(@RequestParam("uid") int uid) {

        User user = userRepo.findByUid(uid);

        System.out.println(uid);

        user.setBlocked(0);
        userRepo.save(user);

        return "redirect:/users";
    }

    @RequestMapping("/admin-menu")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String showAdminMenuPage(Model model) {

        User user = userRepo.findByUid(id);

        List<User> userList = new ArrayList<>();
        userList.add(user);

        model.addAttribute("user", userList);

        System.out.println(user);

        return "admin-ui/admin-menu.jsp";
    }


    @RequestMapping("/contactUser")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String contactUserPage(@RequestParam("uid") int uid) {


        return "admin-ui/contact-user.jsp";
    }


    @RequestMapping(value = "/deleteAdmin", method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteAdminPage(@RequestParam("uid") int uid) {

        return "admin-ui/delete-admin.jsp";
    }

    @RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteAdmin(@RequestParam("uid") int uid) {

        User user = userRepo.findByUid(uid);

        user.setDeleted(1);

        userRepo.save(user);

        return "redirect:/administrators";
    }

    @RequestMapping("/addAdmin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String addAdminPage() {

        return "admin-ui/add-admin.jsp";
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


    @RequestMapping("/administrators")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String showAdministrators(Model model) {

        List<User> admins = userRepo.getOnlyAdmins(1);

        model.addAttribute("admins", admins);


        return "admin-ui/administrators-table.jsp";
    }

    @RequestMapping("/newAdmin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String addAdmin(@RequestParam("vorname") String vorname,
                           @RequestParam("nachname") String nachname,
                           @RequestParam("email") String email,
                           @RequestParam("passwort1") String passwort,
                           @RequestParam("geburtsdatum") Date geburtsDatum,
                           @RequestParam("geschlecht") String geschlecht) {

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(passwort);

        User user = new User(vorname, nachname, hashedPassword, email, geburtsDatum, geschlecht);
        user.setBlocked(0);
        userRepo.save(user);

        roleRepo.insertUserRole(user.getUid(), 1);

        return "redirect:/administrators";
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
    public String startSeite(@RequestParam("uid") int uid) {

        return "user-ui/startseite.jsp";
    }


    @RequestMapping("/sharePost")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String sharePost(@RequestParam("uid") int uid,
                            @RequestParam("inhalt") String inhalt) {

        Beitrag beitrag = new Beitrag();
        beitrag.setBeitragsInhalt(inhalt);
        beitragRepo.save(beitrag);

        beitragRepo.insertUserBeitrag(uid, beitrag.getBeitrag_id());

        return "redirect:/startseite?uid=" + uid;
    }

    @Autowired
    EmailService emailService;

    @PostMapping("/forgotpassword")
    public String forgotPassword(@RequestParam("forgotemail") String email, HttpServletRequest request) {
        User user = userRepo.findByEmail(email);
        if (user != null) {
            String appUrl = request.getScheme() + "://" + request.getServerName();
            SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
            passwordResetEmail.setTo(user.getEmail());
            System.out.println(user.getGeschlecht());
            System.out.println(user.getVorname());
            passwordResetEmail.setSubject("Passwort zurücksetzen - MemoHub");
            passwordResetEmail.setText("Guten Tag, wir haben gehört, dass Sie Ihr Passwort vergessen haben. Kein Problem! \n \nKlicken Sie bitte einfach auf den folgenden Link, um Ihr Passwort zurückzusetzen:\n" + appUrl
                    + "/zurücksetzen?token=" + "123445" + "\n \nWenn Sie den Link innerhalb von 3 Stunden nicht verwenden, wird der Link ablaufen. \n \n \nMit freundlichen Grüßen \nMemHub Team");
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

    @RequestMapping("/adminContactsUser")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String adminContactsUser(@RequestParam("uid") int uid, @RequestParam("emailInhalt") String inhalt, HttpServletRequest request) {

        User user = userRepo.findByUid(uid);

        if (user != null) {
            SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
            passwordResetEmail.setTo(user.getEmail());
            passwordResetEmail.setSubject("MemoHub Kontakt Team");
            passwordResetEmail.setText(inhalt);
            emailService.sendEmail(passwordResetEmail);
        } else {
            System.out.println("not found");
        }

        return "redirect:/users";
    }
}