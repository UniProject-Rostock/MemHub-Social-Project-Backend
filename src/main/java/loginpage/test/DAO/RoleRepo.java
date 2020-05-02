package loginpage.test.DAO;

import loginpage.test.Entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface RoleRepo extends JpaRepository<Role, Integer> {


    @Modifying
    @Transactional
    @Query(value = "INSERT INTO user_role(user_id, role_id) VALUES(?,?)", nativeQuery = true)
    void insertUserRole(int uid, int roleId);


}
