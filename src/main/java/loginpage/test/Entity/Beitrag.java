package loginpage.test.Entity;


import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "beitrag")
@NoArgsConstructor
@ToString
public class Beitrag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "beitrag_id")
    private int beitrag_id;

    @Column(name = "beitrag_inhalt")
    private String beitragsInhalt;

    @Column(name = "beitrag_sicherheit")
    private String beitragSicherheit;

    @Column(name = "beitrag_zeit")
    private Date beitragZeit;

    public int getBeitrag_id() {
        return beitrag_id;
    }

    public void setBeitrag_id(int beitrag_id) {
        this.beitrag_id = beitrag_id;
    }

    public String getBeitragsInhalt() {
        return beitragsInhalt;
    }

    public void setBeitragsInhalt(String beitragsInhalt) {
        this.beitragsInhalt = beitragsInhalt;
    }

    public String getBeitragSicherheit() {
        return beitragSicherheit;
    }

    public void setBeitragSicherheit(String beitragSicherheit) {
        this.beitragSicherheit = beitragSicherheit;
    }

    public Date getBeitragZeit() {
        return beitragZeit;
    }

    public void setBeitragZeit(Date beitragZeit) {
        this.beitragZeit = beitragZeit;
    }

}
