package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    RentAreaRepository rentAreaRepository;

    @Override
    public void deleteRentAreaByBuildingID(BuildingEntity buildingEntity) {
        List<RentAreaEntity> list = rentAreaRepository.findByBuilding(buildingEntity);
        for(RentAreaEntity rentAreaEntity : list){
            rentAreaRepository.deleteById(rentAreaEntity.getId());
        }
    }

    @Transactional
    @Override
    public void deleteRentAreaByBuildingIDs(List<BuildingEntity> buildingEntityList) {
        rentAreaRepository.deleteByBuildingIn(buildingEntityList);
    }
}
