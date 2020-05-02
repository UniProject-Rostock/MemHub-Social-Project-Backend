package loginpage.test.Security;


import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

class UserDetailsServiceImpl implements UserDetailsService {

    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    @Qualifier("userRepo")
    private loginpage.test.DAO.UserRepo userRepository;

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        loginpage.test.Entity.User user = userRepository.findByEmail(username);

        if (user == null) {
            throw new UsernameNotFoundException("loginpage.test.Entity.User not found.");
        }

        log.info(username);

        return new PdfUserDetails(user);

    }
}

