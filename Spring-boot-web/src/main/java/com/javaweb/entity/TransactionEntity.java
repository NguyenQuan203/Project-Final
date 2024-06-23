package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name="transaction")
public class TransactionEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="code")
    private String code;

    @Column(name="note")
    private String transactionDetail;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customer;
}
