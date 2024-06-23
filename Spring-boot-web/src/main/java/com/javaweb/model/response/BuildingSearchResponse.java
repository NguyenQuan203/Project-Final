package com.javaweb.model.response;


import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BuildingSearchResponse extends AbstractDTO {
	private Long id;
	private String name;
	private String address;
	private String numberOfBasement;
	private String managerName;
	private String managerPhone;
	private String floorArea;
	private String rentArea;
    private String emptyArea;
    private String rentPrice;
    private String serviceFee;
    private String brokerageFee;



}
