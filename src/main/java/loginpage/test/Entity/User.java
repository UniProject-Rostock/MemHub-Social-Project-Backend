package loginpage.test.Entity;

import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.Set;

@NoArgsConstructor
@Entity
@Table(name = "user")
@ToString
public class User  implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uid")
    private int uid;

    @Column(name = "vorname")
    private String vorname;

    @Column(name = "nachname")
    private String nachname;

    @Column(name = "passwort")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "geburtsdatum")
    private Date geburtsDatum;

    @Column(name = "geschlecht")
    private String geschlecht;

    @Column(name = "beschreibung")
    private String beschreibung;

    @Column(name = "blocked")
    private int blocked;

    @Column(name = "deleted")
    private int deleted;

    @Column(name = "beziehungsstatus")
    private String beziehungsstatus;

    @Column(name = "wohnort")
    private String wohnort;

    @Column(name = "visited")
    private int visited;

    @Column(name = "beigetreten")
    private Date beigetreten;

    @Column(name = "token")
    private String token;

    @Lob
    @Column(name="photo")
    private byte[] photo;

    @ToString.Exclude
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @ToString.Exclude
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user", orphanRemoval = true)
    private Set<Beitrag> beitrags;

    @ToString.Exclude
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_notification", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "notification_id"))
    private Set<Notification> notifications;


    public User(String vorname, String nachname, String password, String email, Date geburtsDatum, String geschlecht) {
        this.vorname = vorname;
        this.nachname = nachname;
        this.password = password;
        this.email = email;
        this.geburtsDatum = geburtsDatum;
        this.geschlecht = geschlecht;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getNachname() {
        return nachname;
    }

    public void setNachname(String nachname) {
        this.nachname = nachname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getGeburtsDatum() {
        return geburtsDatum;
    }

    public void setGeburtsDatum(Date geburtsDatum) {
        this.geburtsDatum = geburtsDatum;
    }

    public String getGeschlecht() {
        return geschlecht;
    }

    public void setGeschlecht(String geschlecht) {
        this.geschlecht = geschlecht;
    }

    public int getBlocked() {
        return blocked;
    }

    public void setBlocked(int blocked) {
        this.blocked = blocked;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public String getBeziehungsstatus() {
        return beziehungsstatus;
    }

    public void setBeziehungsstatus(String beziehungsstatus) {
        this.beziehungsstatus = beziehungsstatus;
    }

    public String getWohnort() {
        return wohnort;
    }

    public void setWohnort(String wohnort) {
        this.wohnort = wohnort;
    }

    public int getVisited() {
        return visited;
    }

    public void setVisited(int visited) {
        this.visited = visited;
    }

    public Date getBeigetreten() {
        return beigetreten;
    }

    public void setBeigetreten(Date beigetreten) {
        this.beigetreten = beigetreten;
    }

    public Set<Beitrag> getBeitrags() {
        return beitrags;
    }

    public void setBeitrags(Set<Beitrag> beitrags) {
        this.beitrags = beitrags;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}