package loginpage.test.Controller;

import loginpage.test.DAO.BeitragRepo;
import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Entity.Beitrag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


@Controller
public class BeitragController {

    @Autowired
    @Qualifier("userRepo")
    UserRepo userRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    BeitragRepo beitragRepo;

    @RequestMapping("/sharePost")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String sharePost(@RequestParam("uid") int uid,
                            @RequestParam("inhalt") String inhalt) {

        Date date = new Date();

        Beitrag beitrag = new Beitrag();
        beitrag.setBeitragsInhalt(inhalt);
        beitrag.setBeitragZeit(date);
        beitragRepo.save(beitrag);

        beitragRepo.insertUserBeitrag(uid, beitrag.getBeitrag_id());

        return "redirect:/startseite?uid=" + uid;
    }

    @RequestMapping("/deletePost")
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResponseEntity deletePost(HttpServletRequest request) {


        return ResponseEntity.status(HttpStatus.OK).body("");
    }
}