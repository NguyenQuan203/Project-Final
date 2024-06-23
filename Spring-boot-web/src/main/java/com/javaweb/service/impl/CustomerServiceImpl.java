package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public List<CustomerSearchResponse> getAllCustomers(Pageable pageable, CustomerSearchRequest customerSearchRequest) {
        List<CustomerEntity> buildingEntities = customerRepository.findAll(pageable, customerSearchRequest);
        List<CustomerSearchResponse> result = new ArrayList<>();
        for(CustomerEntity x : buildingEntities){
            CustomerSearchResponse y = modelMapper.map(x, CustomerSearchResponse.class);
            result.add(y);
        }
        return result;
    }

    @Override
    public int countTotalItems(CustomerSearchRequest customerSearchRequest) {
        return customerRepository.countTotalItem(customerSearchRequest);
    }


    @Autowired
    private IUserService userService;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    @Override
    public ResponseDTO loadStaffs(Long id) {
        List<UserEntity> userEntities = userService.searchUsers(1, "STAFF");
        List<UserEntity> list = userRepository.findByStatusAndRoles_CodeAndCustomers_Id(1, "STAFF", id);
        List<StaffResponseDTO> staffs = new ArrayList<>();
        for(UserEntity it : userEntities){
            StaffResponseDTO staff1 = new StaffResponseDTO();
            if(list.contains(it)){
                staff1.setStaffId(it.getId());
                staff1.setFullName(it.getFullName());
                staff1.setChecked("checked");
            }
            else{
                staff1.setStaffId(it.getId());
                staff1.setFullName(it.getFullName());
                staff1.setChecked("");
            }
            staffs.add(staff1);
        }
        ResponseDTO result = new ResponseDTO();
        result.setData(staffs);
        result.setMessage("Success");
        return result;
    }

    @Transactional
    @Override
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity x = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        x.setListUser(userEntities);
        customerRepository.save(x);
    }

    @Transactional
    @Override
    public void AddOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity x = modelMapper.map(customerDTO, CustomerEntity.class);
        if(customerDTO.getId() != null){
            CustomerEntity y = customerRepository.findById(customerDTO.getId()).get();
            x.setListUser(y.getListUser());
            x.setTransactions(y.getTransactions());
            x.setCreatedDate(y.getCreatedDate());
            x.setCreatedBy(y.getCreatedBy());
        }
        x.setActive("1");
        customerRepository.save(x);
    }

    @Override
    public CustomerDTO findCustomerById(Long id) {
        CustomerEntity x = customerRepository.findById(id).get();
        return modelMapper.map(x, CustomerDTO.class);
    }

    @Override
    public CustomerEntity findById(Long id) {
        return customerRepository.findById(id).get();
    }

    @Override
    public void deleteCustomerById(List<Long> ids) {
        List<CustomerEntity> result = customerRepository.findAllById(ids);
        for(CustomerEntity x : result){
            x.setActive("0");
            customerRepository.save(x);
        }
    }
}
