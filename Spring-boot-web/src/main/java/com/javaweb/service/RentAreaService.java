package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;

import java.util.List;

public interface RentAreaService {
    void deleteRentAreaByBuildingID(BuildingEntity buildingEntity );
    void deleteRentAreaByBuildingIDs(List<BuildingEntity> buildingEntityList);
}
