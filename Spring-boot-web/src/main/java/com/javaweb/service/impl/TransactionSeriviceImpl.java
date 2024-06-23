package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TransactionSeriviceImpl implements TransactionService {
    @Autowired
    TransactionRepository transactionRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Transactional
    @Override
    public void AddOrUpdateTransaction(TransactionDTO transaction) {
        TransactionEntity transactionEntity = modelMapper.map(transaction, TransactionEntity.class);
        if(transaction.getId() != null){
            TransactionEntity x = transactionRepository.findById(transaction.getId()).get();
            transactionEntity.setCustomer(x.getCustomer());
            transactionEntity.setCode(x.getCode());
            transactionEntity.setCreatedDate(x.getCreatedDate());
            transactionEntity.setCreatedBy(x.getCreatedBy());
        }
        transactionRepository.save(transactionEntity);
    }
}
