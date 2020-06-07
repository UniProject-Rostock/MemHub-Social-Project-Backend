package loginpage.test.DAO;

import loginpage.test.Entity.Gruppe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface GruppeRepo extends JpaRepository<Gruppe, Integer> {

    @Query(value = "SELECT * FROM loginpage.user_group as ug INNER JOIN loginpage.user as u ON ug.user_id = u.uid INNER JOIN loginpage.gruppe as g ON ug.gruppe_id = g.gruppe_id WHERE u.uid = ?", nativeQuery = true)
    List<Gruppe> groupsOfUser(int uid);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO loginpage.user_group (user_id, gruppe_id) VALUES (?, ?);", nativeQuery = true)
    void addGroupToUser(int uid, int gid);

}
