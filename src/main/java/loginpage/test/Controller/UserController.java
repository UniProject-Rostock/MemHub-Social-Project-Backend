package loginpage.test.Controller;

import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

    @RequestMapping("/userDetails")
    public String getUserDetails(@RequestParam("uid") int uid, Model model) throws Exception {

        User user = userRepo.findByUid(uid);

        List<User> userList = new ArrayList<>();
        userList.add(user);

        System.out.println(user.getGeburtsDatum());

        model.addAttribute("user", userList);

        return "admin-ui/admin-menu.jsp";
    }

    @RequestMapping("/addUser")
    public String addUser(@RequestParam("vorname") String vorname,
                          @RequestParam("nachname") String nachname,
                          @RequestParam("email") String email,
                          @RequestParam("passwort1") String passwort,
                          @RequestParam("geburtsdatum") Date geburtsDatum,
                          @RequestParam("geschlecht") String geschlecht,
                          @RequestParam(value = "old-password", required = false) String oldPass,
                          @RequestParam(value = "new-password", required = false) String newPass) {

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(passwort);

        User user = new User(vorname, nachname, hashedPassword, email, geburtsDatum, geschlecht);

        userRepo.save(user);

        roleRepo.insertUserRole(user.getUid(), 2);

        return "redirect:/success";
    }

    @RequestMapping("/editUser")
    public String editUser(@RequestParam("vorname") String vorname,
                           @RequestParam("nachname") String nachname,
                           @RequestParam("email") String email,
                           @RequestParam("beschreibung") String beschreibung,
                           @RequestParam("geschlecht") String geschlecht,
                           @RequestParam("uid") int uid) {


        User user = userRepo.findByUid(uid);

        user.setVorname(vorname);
        user.setNachname(nachname);
        user.setEmail(email);
        user.setBeschreibung(beschreibung);
        user.setGeschlecht(geschlecht);

        userRepo.save(user);



        return "redirect:/userDetails?uid=" + uid;
    }

    @RequestMapping("/changePhoto")
    public String changePhoto(@RequestParam("uid") int uid) throws Exception {

        ClassPathResource backImgFile = new ClassPathResource("img/logo.png");
        byte[] arrayPic = new byte[(int) backImgFile.contentLength()];
        backImgFile.getInputStream().read(arrayPic);

        User user = userRepo.findByUid(uid);
        user.setPhoto(arrayPic);

        return "";
    }

    @RequestMapping("checkEmail/{email}")
    @ResponseBody
    public ResponseEntity checkEmail(@PathVariable("email") String email) {
        String message;
        if (userRepo.findByEmail(email) != null) {
            message = "Email is not available";
        } else {
            message = "Email available";
        }
        return ResponseEntity.status(HttpStatus.OK).body(message);
    }

}
