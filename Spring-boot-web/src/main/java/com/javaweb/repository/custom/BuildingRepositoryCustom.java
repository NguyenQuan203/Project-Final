package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
//    List<BuildingEntity> findAll( BuildingSearchRequest buildingSearchRequest);
    List<BuildingEntity> findAll(Pageable pageable, BuildingSearchRequest buildingSearchRequest);
    int countTotalItem(BuildingSearchRequest buildingSearchRequest);
}
