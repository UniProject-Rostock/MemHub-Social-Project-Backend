package loginpage.test.Security;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.stream.Collectors;

public class PdfUserDetails implements UserDetails {

    private loginpage.test.Entity.User user;

    public PdfUserDetails(loginpage.test.Entity.User user) {
        this.user = user;

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return user.getRoles().stream().map(authority -> new SimpleGrantedAuthority(authority.getRole())).collect(Collectors.toList());
    }

    public int getId() {
        return user.getUid();

    }

    @Override
    public String getPassword() {

        return user.getPassword();

    }

    @Override
    public String getUsername() {
        return user.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;

    }

    @Override
    public boolean isCredentialsNonExpired() {

        return true;

    }

    @Override
    public boolean isEnabled() {

        return true;

    }

    public loginpage.test.Entity.User getUserDetails() {
        return user;

    }

}
