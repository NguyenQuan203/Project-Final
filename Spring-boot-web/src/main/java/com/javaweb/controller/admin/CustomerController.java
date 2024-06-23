package com.javaweb.controller.admin;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.enums.districtCode;
import com.javaweb.enums.typeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.model.dto.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController(value="customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    private IUserService userService;

    @Autowired
    CustomerService customerService;

    @Autowired
    TransactionRepository transactionRepository;

    @GetMapping(value = "/admin/customer-list")
    public ModelAndView customerList(@ModelAttribute("modelSearch") CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("staffs", userService.getStaffs());
        mav.addObject("status", Status.getStatus());
        DisplayTagUtils.of(request, customerSearchRequest);
        CustomerSearchResponse result = new CustomerSearchResponse();
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffID(staffId + " ");
        }
        List<CustomerSearchResponse> customers = customerService.getAllCustomers(new PageRequest(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems()), customerSearchRequest);
        result.setListResult(customers);
        result.setTotalItems(customerService.countTotalItems(customerSearchRequest));
        mav.addObject("customers", result);
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView addCustomer(@ModelAttribute("buildingEdit") CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("status", Status.getStatus());
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView addCustomer(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findCustomerById(id);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("status", Status.getStatus());
        mav.addObject("buildingEdit", customerDTO);
        CustomerEntity x = customerService.findById(id);
        List<TransactionEntity> result1 = transactionRepository.findByCodeAndCustomer("CSKH", x);
        List<TransactionEntity> result2 = transactionRepository.findByCodeAndCustomer("DDX", x);
        mav.addObject("cus1", result1);
        mav.addObject("cus2", result2);
        return mav;
    }
}
