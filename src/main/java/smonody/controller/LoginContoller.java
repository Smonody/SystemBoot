package smonody.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import smonody.pojo.Customer;
import smonody.pojo.User;
import smonody.servies.UserService;

import javax.jms.Session;
import javax.json.Json;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import java.util.Map;

@Controller
public class LoginContoller {
    @Autowired
    private UserService userService;
    /*
    * todo 登录页面
    * */
    @GetMapping(value = "/login")
    public String login(){
        return "/static/login.jsp";
    }
    /*
    * todo 用户登陆
    * */
    @PostMapping("/login")
    /*如果请求数据为json，使用@RequestBody接收请求*/
    public String adminLogin(Model model,User user, HttpSession session){
        System.out.println(user.getUserName());
        System.out.println(user.getPassWord());
        user = userService.findUserByName(user);
        if(user != null){
            session.setAttribute("USER_SESSION",user);
            return "redirect:findCustomerAll";
        }else{
            model.addAttribute("msg","密码或账号错误");
            return "/static/login.jsp";
        }
    }
    /*
     * todo 用户登陆测试
     * */
    @PostMapping("/logintest")
    public String adminLogintest(Model model,@RequestBody Map user){
        System.out.println(user);
        return "/static/login.jsp";
    }
    /*
    * todo 用户向主页跳转
    * */
    @RequestMapping("/sucess")
    public String sucess(){
        return "/static/sucess.jsp";
    }
    /*
    * todo 退出登录
    * */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清除Session
        User user = (User)session.getAttribute("USER_SESSION");
        System.out.println(user.getUserName());
        session.invalidate();
        //重定向到登录页面的跳转方法
        return "redirect:login";
    }

}
