package loginpage.test.DAO;

import loginpage.test.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userRepo")
public interface UserRepo extends JpaRepository<User, Integer> {

    User findByEmail(String email);

    User findByUid(int uid);

}
