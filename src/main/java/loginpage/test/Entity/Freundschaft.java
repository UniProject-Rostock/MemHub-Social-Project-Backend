package loginpage.test.Entity;

import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "freundschaft")
@ToString
@NoArgsConstructor
public class Freundschaft {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "freundschaft_id")
    private int freundchaftId;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "friend_id")
    private int freundId;

    @Column(name = "status")
    private String status;

    public int getFreundchaftId() {
        return freundchaftId;
    }

    public void setFreundchaftId(int freundchaftId) {
        this.freundchaftId = freundchaftId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFreundId() {
        return freundId;
    }

    public void setFreundId(int freundId) {
        this.freundId = freundId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
