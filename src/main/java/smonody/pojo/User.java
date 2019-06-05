package smonody.pojo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Integer id = null;
    private String userName;
    private String passWord;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                '}';
    }
}
