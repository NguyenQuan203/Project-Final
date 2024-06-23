package com.javaweb.controller.admin;



import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.enums.typeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    IUserService userService;

    @Autowired
    BuildingService buildingService;

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute("modelSearch") BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("staffs", userService.getStaffs());
        mav.addObject("districts", districtCode.district());
        mav.addObject("typeCodes", typeCode.getTypeCode());
        DisplayTagUtils.of(request, buildingSearchRequest);
        BuildingSearchResponse result = new BuildingSearchResponse();
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            buildingSearchRequest.setStaffID(staffId + " ");
        }
        List<BuildingSearchResponse> buildings = buildingService.getAllBuildings(new PageRequest(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()), buildingSearchRequest);
        result.setListResult(buildings);
        result.setTotalItems(buildingService.countTotalItems(buildingSearchRequest));
        mav.addObject("buildings", result);
        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView addBuilding(@ModelAttribute("buildingEdit")BuildingDTO buildingDTO) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", districtCode.district());
        mav.addObject("typeCodes", typeCode.getTypeCode());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView addBuilding(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //findByBuildingId
        BuildingDTO buildingDTO = buildingService.findBuildingById(id);
        mav.addObject("districts", districtCode.district());
        mav.addObject("typeCodes", typeCode.getTypeCode());
        mav.addObject("buildingEdit", buildingDTO);
        return mav;
    }
}
