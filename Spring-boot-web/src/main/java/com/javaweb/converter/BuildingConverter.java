package com.javaweb.converter;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.stream.Collectors;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.stereotype.Component;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import java.lang.reflect.Field;

import java.util.Map;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item){
        BuildingSearchResponse x = modelMapper.map(item, BuildingSearchResponse.class);
        x.setAddress(item.getStreet() + ", " + item.getWard() + ", " + districtCode.district().get(item.getDistrict()));
        String rentArea = item.getRentArea().stream().map(it -> it.getValue()).collect(Collectors.joining(","));
        x.setRentArea(rentArea);
        return x;
    }

    public BuildingDTO toBuildingDTO(BuildingEntity item){
        BuildingDTO x = modelMapper.map(item, BuildingDTO.class);
        String rentArea = item.getRentArea().stream().map(it -> it.getValue()).collect(Collectors.joining(","));
        x.setRentArea(rentArea);
        StringTokenizer st = new StringTokenizer(item.getType(), ",");
        List<String> y = new ArrayList<String>();
        while(st.hasMoreTokens()){
            y.add(st.nextToken());
        }
        x.setRentType(y);
        return x;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO item){
        BuildingEntity x = modelMapper.map(item, BuildingEntity.class);
        String rentType = item.getRentType().stream().map(it -> "" + it + "").collect(Collectors.joining(","));
        x.setType(rentType);
        return x;
    }
}
