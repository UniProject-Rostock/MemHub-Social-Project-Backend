package loginpage.test.DAO;

import loginpage.test.Entity.Freundschaft;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface FreundschaftRepo extends JpaRepository<Freundschaft, Integer> {

    @Query(value = "SELECT * FROM loginpage.freundschaft as f WHERE f.user_id = ? AND f.friend_id = ?", nativeQuery = true)
    Freundschaft checkFreundschaftsStatus(int uid, int fid);
}
