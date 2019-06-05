package smonody.controller;

import org.apache.ibatis.reflection.ReflectionException;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.web.bind.annotation.*;
import smonody.pojo.Customer;
import smonody.pojo.User;
import smonody.servies.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import smonody.servies.UserService;

import javax.ws.rs.POST;
import java.lang.reflect.Array;
import java.util.ArrayList;

@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    /*
    * todo 根据id查询客户详情
    * */
    @RequestMapping("/findCustomerById")
    public String findCustomerById(Integer id, Model model){
        Customer customer =  customerService.findCustomerById(id);
        System.out.println(id);
         model.addAttribute("customer",customer);
         System.out.println(customer);
         //返回客户信息展示页面
        return "static/customer.jsp";
    }
    /*
    * todo 查询所有用户
    * */
    @RequestMapping("/findCustomerAll")
    public String findCustomerAll(Model model){
       /* model.addAttribute("customer",customer);*/
        ArrayList<Customer> customer = customerService.findCustomerAll();
        model.addAttribute("customer",customer);
        for(Customer c : customer){
            System.out.println(c);
        }
        //返回客户信息展示页面
        return "static/customerAll.jsp";
    }

    /**
     *todo 通过RestFul风格请求页面
     */
    @GetMapping("/user/{id}")
    @ResponseBody
    public Customer selectCustomer(@PathVariable("id") String id){
        //查看数据接收
        System.out.println(id);
        Customer customer = new Customer();
        //模拟根据id查询用户对象数据
        if(id.equals("1")){
            System.out.println("进入");
            customer.setCusName("test1");
        }else{
            System.out.println("没进入");
        }

        return customer;
    }
    /*
    * todo restful风格POST提交
    * */
    @ResponseBody
    @PostMapping("/user")
    public User restfulPost(User user){
        //查看数据接收
        System.out.println(user.getUserName());
        System.out.println(user.getPassWord());
        //查询数据库中的用户
        user = userService.findUserByName(user);
        if(user != null){
            System.out.println("成功");
        }else{
            System.out.println("失败");
        }
        return user;
    }
    /*
    * todo 修改客户信息
    * */
    @GetMapping("/updateCustomer")
    public String updateCustomer(Model model,Customer customer){
        System.out.println(customer);
        try{
            Integer count = customerService.updateCustomer(customer);
            System.out.println(count);
        }catch (BadSqlGrammarException e){
            System.err.println("输入数据格式错误");
            if(customer.getId() != null){
                System.err.println("只输入了Id或输入的Id不正确，请检查后再输入");
            }
        }catch (ReflectionException e){
            System.err.println("反射异常");
        }

        return "redirect:findCustomerAll";
    }
    /*
     * todo 添加客户信息
     * */
    @GetMapping("/addCustomer")
    public String addCustomer(Model model,Customer customer){
        System.out.println(customer);
        try {
            Integer count = customerService.addCustomer(customer);
            System.out.println(count);
        }catch (DuplicateKeyException e){
            e.printStackTrace();
        }
        return "redirect:findCustomerAll";
    }
    /*
     * todo 删除客户信息
     * */
    @GetMapping("/deleteCustomer")
    public String deleteCustomer(Model model,Integer id){
        System.out.println(id);
        try {
            Integer count = customerService.deleteCustomer(id);
            System.out.println(count);
            if(count == 0){
                /*model.addAttribute("msg","没有id为"+id+"的用户");*/
                /*model.addAttribute("msg","密码或账号错误");*/
            }
        }catch (DuplicateKeyException e){
            e.printStackTrace();
        }
        return "redirect:findCustomerAll";
    }
    /*
    * todo restful动态查询客户
    * */
    @ResponseBody
    @PostMapping("/findCustomerTest")
    public ArrayList<Customer> findCustomerTest(Customer customer){
        System.out.println(customer);
        ArrayList<Customer> select = null;
        try{
            select = customerService.findCustomer(customer);

        }catch (Exception e){
            e.getMessage();
        }
        System.out.println(select);
        return select;
    }
    /*
     * todo 动态查询客户
     * */
    @GetMapping("/findCustomer")
    public String findCustomer(Model model,Customer customer){
        System.out.println(customer);
        try{
            ArrayList<Customer> select = customerService.findCustomer(customer);
            model.addAttribute("select",select);
            for(Customer c: select){
                System.out.println(c);
            }
        }catch (Exception e){
            e.getMessage();
        }
        return "static/findCustomer.jsp";
    }
    /*todo 放行处理*/
    @PostMapping("/action")
    @ResponseBody
    public Customer action(Customer customer){
        System.out.println(customer);
        return customer;
    }

}
