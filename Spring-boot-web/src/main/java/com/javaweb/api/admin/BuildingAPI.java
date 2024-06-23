package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    BuildingService buildingService;

    @PostMapping
    public String addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        //xuống DB thêm data
        buildingService.AddOrUpdateBuilding(buildingDTO);
        return new String("Add Or Update Building Success");
    }

    @DeleteMapping("/{ids}")
    public String deleteBuilding(@PathVariable List<Long> ids) {
        //xuống DB xóa data
        buildingService.deleteBuilding(ids);
        return new String("Delete Success!!");
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable("id") Long id) {
        ResponseDTO result = buildingService.loadStaffs(id);
        return result;
    }

    @PutMapping
    public void UpdateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        //xuống DB thao tác
        buildingService.updateAssignmentBuilding(assignmentBuildingDTO);
        System.out.println("ok");
    }
}
