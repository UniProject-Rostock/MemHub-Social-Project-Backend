package loginpage.test.DAO;

import loginpage.test.Entity.Kontakt;
import org.springframework.data.jpa.repository.JpaRepository;


public interface KontaktRepo extends JpaRepository<Kontakt, Integer> {

}
