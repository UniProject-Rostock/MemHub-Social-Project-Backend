import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Test {

    public static void main(String[] args) {

        System.out.println(new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime()));

    }
}
