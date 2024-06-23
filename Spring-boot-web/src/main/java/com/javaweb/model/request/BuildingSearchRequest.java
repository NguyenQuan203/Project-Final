package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;

import java.util.List;

public class BuildingSearchRequest extends AbstractDTO {
    private String name;
    private String floorArea;
    private String district;
    private String ward;
    private String street;
    private String numberOfBasement;
    private String direction;
    private String level;
    private String wordArea;
    private String arrivalArea;
    private String rentalPriceFrom;
    private String rentalPriceCome;
    private String managerName;
    private String managerPhone;
    private String staffID;
    private List<String> rentType;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(String floorArea) {
        this.floorArea = floorArea;
    }

    public String getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(String numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }

    public List<String> getRentType() {
        return rentType;
    }

    public void setRentType(List<String> rentType) {
        this.rentType = rentType;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }

    public String getRentalPriceFrom() {
        return rentalPriceFrom;
    }

    public void setRentalPriceFrom(String rentalPriceFrom) {
        this.rentalPriceFrom = rentalPriceFrom;
    }

    public String getRentalPriceCome() {
        return rentalPriceCome;
    }

    public void setRentalPriceCome(String rentalPriceCome) {
        this.rentalPriceCome = rentalPriceCome;
    }

    public String getWordArea() {
        return wordArea;
    }

    public void setWordArea(String wordArea) {
        this.wordArea = wordArea;
    }

    public String getArrivalArea() {
        return arrivalArea;
    }

    public void setArrivalArea(String arrivalArea) {
        this.arrivalArea = arrivalArea;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
