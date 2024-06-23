package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");

    private final String name;

    TransactionType(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public static Map<String, String> transactionType(){
        Map<String, String> list = new LinkedHashMap<>();
        for(TransactionType item: TransactionType.values()){
            list.put(item.toString(), item.getName());
        }
        return list;
    }
}
