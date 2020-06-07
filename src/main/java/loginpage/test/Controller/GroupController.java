package loginpage.test.Controller;

import loginpage.test.DAO.GruppeRepo;
import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Entity.Gruppe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GroupController {

    @Autowired
    @Qualifier("userRepo")
    UserRepo userRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    GruppeRepo gruppeRepo;

    @RequestMapping("/gruppeErstellen")
    public String createGroupPage(@RequestParam("uid") int uid) {


        return "user-ui/create-group.jsp";
    }


    @RequestMapping("/addGroup")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String createGroup(@RequestParam("uid") int uid,
                              @RequestParam("group-name") String groupName, Model model) {

        Gruppe gruppe = new Gruppe();

        gruppe.setGroupName(groupName);
        gruppe.setUserId(uid);
        gruppeRepo.save(gruppe);

        model.addAttribute("successGruppeErstellt", "true");

        return "redirect:/startseite?uid=" + uid;
    }


}
