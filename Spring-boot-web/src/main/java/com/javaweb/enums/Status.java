package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum Status {
    CHUA_XU_LY("Chưa xử lý"),
    DANG_XU_LY("Đang xử lý"),
    DA_XU_LY("Đã xử lý");


    private final String statusName;

    Status(String statusName) {
        this.statusName = statusName;
    }

    public String getStatusNameName() {
        return this.statusName;
    }

    public static Map<String, String> getStatus(){
        Map<String, String> list = new LinkedHashMap<String, String>();
        for(Status item: Status.values()){
            list.put(item.getStatusNameName(), item.statusName);
        }
        return list;
    }
}
