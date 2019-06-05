package smonody.Test;

import org.junit.jupiter.api.Test;
import smonody.pojo.User;


public class Main {
    @Test
    public void test(){
        System.out.println("test");
        User user = new User();
        System.out.println(user.getId());
        System.out.println(user.getId() == null);
        System.out.println("test");
    }
}
