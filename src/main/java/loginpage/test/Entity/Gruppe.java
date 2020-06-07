package loginpage.test.Entity;

import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@ToString
@Table(name = "gruppe")
@NoArgsConstructor
public class Gruppe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gruppe_id")
    private int groupId;

    @Column(name = "gruppe_name")
    private String groupName;

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

}
