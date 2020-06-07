package loginpage.test.DAO;


import loginpage.test.Entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface NotificationRepo extends JpaRepository<Notification, Integer> {

    @Query(value = "SELECT * FROM loginpage.user_notification as un INNER JOIN loginpage.user as u ON un.user_id = u.uid INNER JOIN loginpage.notification as n ON un.notification_id = n.notification_id WHERE u.uid = ?", nativeQuery = true)
    List<Notification> getUserNotifications(int uid);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO loginpage.user_notification (user_id, notification_id, seen) VALUES (?, ?, 0);", nativeQuery = true)
    void addNotificationToUser(int uid, int notificationId);

}
