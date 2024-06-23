package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    List<CustomerSearchResponse> getAllCustomers(Pageable pageable, CustomerSearchRequest customerSearchRequest);
    int countTotalItems(CustomerSearchRequest customerSearchRequest);
    ResponseDTO loadStaffs(Long id);
    void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
    void AddOrUpdateCustomer(CustomerDTO customerDTO);
    CustomerDTO findCustomerById(Long id);
    CustomerEntity findById(Long id);
    void deleteCustomerById(List<Long> ids);
}
