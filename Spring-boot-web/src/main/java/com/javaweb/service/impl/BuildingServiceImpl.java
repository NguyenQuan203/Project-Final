package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.service.RentAreaService;
import com.javaweb.utils.UploadFileUtils;
import javassist.NotFoundException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.javaweb.converter.BuildingConverter;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;
import java.util.stream.Stream;

@Service
public class BuildingServiceImpl  implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter bc;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private RentAreaService rentAreaService;


//    @Override
//    public List<BuildingSearchResponse> findBuilding(BuildingSearchRequest buildingSearchRequest) {
//        List<BuildingEntity> buildEntity = buildingRepository.findAll(buildingSearchRequest);
//        List<BuildingSearchResponse> result = new ArrayList<>();
//        for (BuildingEntity item : buildEntity) {
//            BuildingSearchResponse x = bc.toBuildingSearchResponse(item);
//            result.add(x);
//        }
//        return result;
//    }

    @Override
    public BuildingDTO findBuildingById(Long id) {
        BuildingEntity x = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = bc.toBuildingDTO(x);
        return buildingDTO;
    }

    @Override
    public BuildingEntity findID(Long id) {
        BuildingEntity x = buildingRepository.findById(id).get();
        return x;
    }

    @Override
    public void deleteById(Long id) {
        buildingRepository.deleteById(id);
    }

    @Transactional
    @Override
    public void deleteBuilding(List<Long> ids) {
        buildingRepository.deleteByIdIn(ids);
    }

    @Transactional
    @Override
    public void AddOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity x = bc.toBuildingEntity(buildingDTO);
        if(buildingDTO.getRentArea() != null){
            StringTokenizer st = new StringTokenizer(buildingDTO.getRentArea(), ",");
            List<RentAreaEntity> list = new ArrayList<>();
            while(st.hasMoreTokens()) {
                RentAreaEntity tmp = new RentAreaEntity();
                tmp.setValue(st.nextToken());
                tmp.setBuilding(x);
                list.add(tmp);
            }
            x.setRentArea(list);
        }
        if(buildingDTO.getId() != null) {
            BuildingEntity y = buildingRepository.findById(x.getId()).get();
            x.setUsers(y.getUsers());
            x.setImage(y.getImage());
        }
        saveThumbnail(buildingDTO, x);
        buildingRepository.save(x);
    }

    @Autowired
    private UserRepository userRepository;

    @Transactional
    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity x = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
        x.setUsers(userEntities);
        buildingRepository.save(x);
    }

    @Autowired
    private IUserService userService;

    @Override
    public ResponseDTO loadStaffs(Long id) {
        List<UserEntity> userEntities = userService.searchUsers(1, "STAFF");
        List<UserEntity> list = userRepository.findByStatusAndRoles_CodeAndBuildings_Id(1, "STAFF", id);
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

    @Override
    public List<BuildingSearchResponse> getAllBuildings(Pageable pageable, BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(pageable, buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity x : buildingEntities){
            BuildingSearchResponse y = bc.toBuildingSearchResponse(x);
            result.add(y);
        }
        return result;
    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest) {
        return buildingRepository.countTotalItem(buildingSearchRequest);
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            UploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }
}
