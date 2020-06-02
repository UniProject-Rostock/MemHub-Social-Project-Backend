package loginpage.test.Controller;

import loginpage.test.DAO.RoleRepo;
import loginpage.test.DAO.UserRepo;
import loginpage.test.Security.PdfUserDetails;
import loginpage.test.Service.EmailService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class LoginController {

    @Autowired
    @Qualifier("userRepo")
    UserRepo userRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    @Qualifier("emailService")
    private EmailService emailService;

    private static final Logger log = LogManager.getLogger(loginpage.test.Controller.LoginController.class);

    @RequestMapping(value = {"/", "/login"})
    public String login() {

        return "login-ui/login.jsp";
    }

    @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
    public String loginError(Model model) {
        log.info("Login attempt failed");
        model.addAttribute("error", "true");

        return "login-ui/login.jsp";
    }


    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String registrationOnSuccess(Model model) {

        model.addAttribute("success", "true");

        return "login-ui/login.jsp";
    }

    @RequestMapping(value = "/blocked", method = RequestMethod.GET)
    public String blockedUserOnLogin(Model model) {

        model.addAttribute("blocked", "true");

        return "login-ui/login.jsp";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(SessionStatus session, Model model) {
        SecurityContextHolder.getContext().setAuthentication(null);
        session.setComplete();
        model.addAttribute("logout", "true");

        return "redirect:/login";
    }

    static int id = 0;

    @RequestMapping(value = "/postLogin", method = RequestMethod.POST)
    public String postLogin(Model model, HttpSession session, HttpServletRequest request) {
        log.info("postLogin()");
        UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        validatePrinciple(authentication.getPrincipal());
        loginpage.test.Entity.User loggedInUser = ((PdfUserDetails) authentication.getPrincipal()).getUserDetails();

        model.addAttribute("currentUser", loggedInUser.getEmail());
        session.setAttribute("uid", loggedInUser.getUid());

        System.out.println("Email: " + loggedInUser.getEmail());
        System.out.println("Authority: " + loggedInUser.getRoles().toString());

        id = loggedInUser.getUid();


        if (loggedInUser.getBlocked() == 1) {

            return "redirect:/blocked";
        } else {
            if (loggedInUser.getDeleted() == 1) {

                return "redirect:loginFailed";
            } else if (loggedInUser.getRoles().toString().contains("ROLE_USER")) {
                if (loggedInUser.getVisited() == 0) {

                    loggedInUser.setVisited(loggedInUser.getVisited() + 1);
                    userRepo.save(loggedInUser);

                    return "redirect:/willkommen?uid=" + loggedInUser.getUid();

                } else {
                    loggedInUser.setVisited(loggedInUser.getVisited() + 1);
                    userRepo.save(loggedInUser);
                    return "redirect:/profile?uid=" + loggedInUser.getUid();
                }
            } else {
                loggedInUser.setVisited(loggedInUser.getVisited() + 1);
                userRepo.save(loggedInUser);
                return "redirect:/admin-menu";
            }
        }
    }

    private void validatePrinciple(Object principal) {

        if (!(principal instanceof PdfUserDetails)) {

            throw new IllegalArgumentException("Principal can not be null!");

        }
    }
}