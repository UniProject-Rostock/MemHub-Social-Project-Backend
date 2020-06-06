package loginpage.test.Controller;

import loginpage.test.DAO.BeitragRepo;
import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Entity.User;
import loginpage.test.Service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
public class AdminController {

    @Autowired
    @Qualifier("userRepo")
    UserRepo userRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    BeitragRepo beitragRepo;

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

        int id = 29;
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

    @Autowired
    EmailService emailService;

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
