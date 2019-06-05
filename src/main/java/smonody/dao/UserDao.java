package smonody.dao;

import smonody.pojo.User;

public interface UserDao {
    /*
    * 查询用户账号与密码
    * */
    User findUserByName(User user);

    /*
    * 记录数
    * */
//    Integer count();
}
