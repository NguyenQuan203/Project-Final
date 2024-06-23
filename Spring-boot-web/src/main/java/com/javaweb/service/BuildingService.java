package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
//    List<BuildingSearchResponse> findBuilding(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO findBuildingById(Long id);
    BuildingEntity findID(Long id);
    void deleteById(Long id);
    void deleteBuilding(List<Long> ids);
    void AddOrUpdateBuilding(BuildingDTO buildingDTO);
    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    ResponseDTO loadStaffs(Long id);
    List<BuildingSearchResponse> getAllBuildings(Pageable pageable, BuildingSearchRequest buildingSearchRequest);
    int countTotalItems(BuildingSearchRequest buildingSearchRequest);
}
