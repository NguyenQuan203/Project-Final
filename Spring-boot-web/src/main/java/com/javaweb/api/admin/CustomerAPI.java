package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerAPI {
    @Autowired
    CustomerService customerService;

    @Autowired
    TransactionService transactionService;

    @PostMapping
    public String addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        //xuống DB thêm data
        customerService.AddOrUpdateCustomer(customerDTO);
        return new String("Add Or Update Customer Success");
    }

    @DeleteMapping("/{ids}")
    public String deleteCustomer(@PathVariable List<Long> ids) {
        //xuống DB xóa data
        customerService.deleteCustomerById(ids);
        return new String("Delete Success!!");
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable("id") Long id) {
        ResponseDTO result = customerService.loadStaffs(id);
        return result;
    }

    @PutMapping
    public void UpdateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        //xuống DB thao tác
        customerService.updateAssignmentCustomer(assignmentCustomerDTO);
        System.out.println("ok");
    }

    @PostMapping("/transaction")
    public void AddOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO) {
        transactionService.AddOrUpdateTransaction(transactionDTO);
        System.out.println("ok");
    }
}
