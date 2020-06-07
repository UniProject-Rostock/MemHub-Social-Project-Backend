package loginpage.test.DAO;


import loginpage.test.Entity.Beitrag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BeitragRepo extends JpaRepository<Beitrag, Integer> {

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO user_beitrag(user_id, beitrag_id) VALUES(?,?)", nativeQuery = true)
    void insertUserBeitrag(int uid, int beitragId);


    @Query(value = "SELECT * FROM loginpage.beitrag as b INNER JOIN loginpage.user as u ON b.user_uid = u.uid WHERE u.uid = ?", nativeQuery = true)
    List<Beitrag> getAllPostsFromUser(int uid);
}
