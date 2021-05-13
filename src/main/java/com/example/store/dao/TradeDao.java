package com.example.store.dao;

import com.example.store.entity.Trade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TradeDao extends JpaRepository<Trade,Long> {
    List<Trade> findAllByUserId(Long userId);
}
