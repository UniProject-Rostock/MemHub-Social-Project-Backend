package loginpage.test.DAO;

import loginpage.test.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("userRepo")
public interface UserRepo extends JpaRepository<User, Integer> {

    @Query(value = "SELECT * from user u WHERE u.email = ? AND u.deleted = 0 ", nativeQuery = true)
    User findByEmail(String email);

    User findByUid(int uid);

    @Query(value = "SELECT * FROM user u INNER JOIN user_role ur ON ur.user_id = u.uid  WHERE ur.role_id = ? AND u.deleted = 0", nativeQuery = true)
    List<User> getOnlyUsers(int role_id);

    @Query(value = "SELECT * FROM user u INNER JOIN user_role ur ON ur.user_id = u.uid WHERE ur.role_id = ? AND u.deleted = 0", nativeQuery = true)
    List<User> getOnlyAdmins(int role_id);

    @Query(value = "SELECT * FROM loginpage.user_group as ug INNER JOIN loginpage.user as u ON ug.user_id = u.uid INNER JOIN loginpage.gruppe as g ON ug.gruppe_id = g.gruppe_id WHERE g.gruppe_id = ?", nativeQuery = true)
    List<User> getMembersOfGroup(int gid);
}
