package smonody.servies;

import smonody.pojo.Customer;

import java.util.ArrayList;

public interface CustomerService {
    public Customer findCustomerById(Integer id);
    public ArrayList<Customer> findCustomerAll();
    public Integer updateCustomer(Customer customer);
    public Integer addCustomer(Customer customer);
    public Integer deleteCustomer(Integer id);
    public ArrayList<Customer> findCustomer(Customer customer);
}
