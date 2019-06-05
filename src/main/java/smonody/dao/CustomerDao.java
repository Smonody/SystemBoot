package smonody.dao;

import smonody.pojo.Customer;

import java.util.ArrayList;
import java.util.List;

public interface CustomerDao {
    /*
    * 根据id查询信息
    * */
    Customer findCustomerById(Integer id);
    /*
    * 查询所有客户信息
    * */
    ArrayList<Customer> findCustomerAll();
    /*
    * 修改客户信息
    * */
    Integer updateCustomer(Customer customer);
    /*
    * 添加客户信息
    * */
    Integer addCustomer(Customer customer);
    /*
    * 删除用户信息
    * */
    Integer deleteCustomer(Integer id);
    /*
    * 动态查询客户信息
    * */
    ArrayList<Customer> findCustomer(Customer customer);
}
