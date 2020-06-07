package loginpage.test.DAO;

import loginpage.test.Entity.Gruppe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GruppeRepo extends JpaRepository<Gruppe, Integer> {


    @Query(value = "SELECT * FROM loginpage.gruppe as g WHERE g.user_id =?", nativeQuery = true)
    List<Gruppe> groupsOfUser(int uid);

}
