package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum typeCode {
    TANG_TRET("Tâng Trệt"),
    NGUYEN_CAN("Nguyên Căn"),
    NOI_THAT("Nội Thất");


    private final String typeCodeName;

    typeCode(String typeCodeName) {
        this.typeCodeName = typeCodeName;
    }

    public String getTypeCodeName() {
        return this.typeCodeName;
    }

    public static Map<String, String> getTypeCode(){
        Map<String, String> list = new LinkedHashMap<String, String>();
        for(typeCode item: typeCode.values()){
            list.put(item.toString(), item.getTypeCodeName());
        }
        return list;
    }
}
