package smonody.servies.impl;

import smonody.dao.CustomerDao;
import smonody.pojo.Customer;
import smonody.servies.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    //注解注入CustomerDao
    @Autowired
    private CustomerDao customerDao;
    //查询客户
    public Customer findCustomerById(Integer id) {
        return customerDao.findCustomerById(id);
    }

    @Override
    public ArrayList<Customer> findCustomerAll() {
        return customerDao.findCustomerAll();
    }

    @Override
    public Integer updateCustomer(Customer customer) {
        return this.customerDao.updateCustomer(customer);
    }

    @Override
    public Integer addCustomer(Customer customer) {
        return this.customerDao.addCustomer(customer);
    }

    @Override
    public Integer deleteCustomer(Integer id) {
        return this.customerDao.deleteCustomer(id);
    }

    @Override
    public ArrayList<Customer> findCustomer(Customer customer) {
        return this.customerDao.findCustomer(customer);
    }
}
