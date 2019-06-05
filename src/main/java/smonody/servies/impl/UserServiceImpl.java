package smonody.servies.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import smonody.dao.UserDao;
import smonody.pojo.User;
import smonody.servies.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    /*
    * 注解注入UserDao
    * */
    @Autowired
    private UserDao userDao;
    //查询数据库中是否有用户
    public User findUserByName(User user) {

        return userDao.findUserByName(user);
    }

}
