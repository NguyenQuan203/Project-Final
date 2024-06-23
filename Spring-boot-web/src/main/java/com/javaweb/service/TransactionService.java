package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;

public interface TransactionService {
    void AddOrUpdateTransaction(TransactionDTO transaction);
}
