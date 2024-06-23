package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class CustomerSearchResponse extends AbstractDTO {
    private Long id;
    private String name;
    private String phoneNumber;
    private String email;
    private String demand;
    private String status;
}
