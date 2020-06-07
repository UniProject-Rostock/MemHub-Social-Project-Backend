package loginpage.test.Entity;


import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "beitrag")
@NoArgsConstructor
@ToString
public class Beitrag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "beitrag_id")
    public int beitrag_id;

    @Column(name = "beitrag_inhalt")
    public String beitragsInhalt;

    @Column(name = "beitrag_sicherheit")
    public String beitragSicherheit;

    @Column(name = "beitrag_zeit")
    public Date beitragZeit;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.LAZY)
    public User user;

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
