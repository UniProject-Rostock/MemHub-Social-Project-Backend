package loginpage.test.Controller;

import loginpage.test.DAO.GruppeRepo;
import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Entity.Gruppe;
import loginpage.test.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

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
    @PreAuthorize("hasRole('ROLE_USER')")
    public String createGroupPage(@RequestParam("uid") int uid) {

        return "user-ui/create-group.jsp";
    }

    @RequestMapping("/addFriendsToGroup")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String addFriendsPage(@RequestParam("uid") int uid,
                                 @RequestParam("group-name") String groupName, Model model) {

        Gruppe gruppe = new Gruppe();

        gruppe.setGroupName(groupName);
        gruppeRepo.save(gruppe);


        gruppeRepo.addGroupToUser(uid, gruppe.getGroupId());

        List<Integer> gidList = new ArrayList<>();
        gidList.add(gruppe.getGroupId());

        model.addAttribute("gid", gidList);

        return "user-ui/add-friends-to-group.jsp";
    }

    @RequestMapping("/addGroup")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String createGroup(@RequestParam("uid") int uid,
                              @RequestParam("gid") int gid, Model model) {

        List<User> members = userRepo.getMembersOfGroup(gid);

        model.addAttribute("members", members);

        return "redirect:/group?gid=" + gid + "&uid=" + uid;
    }

    @RequestMapping("/group")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String groupPage(@RequestParam("gid") int gid, @RequestParam("uid") int uid, Model model) {

        User user = userRepo.findByUid(uid);

        List<Gruppe> gruppen = gruppeRepo.groupsOfUser(uid);

        model.addAttribute("gruppen", gruppen);

        List<User> members = userRepo.getMembersOfGroup(gid);

        model.addAttribute("members", members);

        return "user-ui/group-page.jsp";
    }
}