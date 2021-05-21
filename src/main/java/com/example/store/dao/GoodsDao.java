package com.example.store.dao;

import com.example.store.entity.Goods;
import com.example.store.entity.Trade;
import com.example.store.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsDao extends JpaRepository<Goods,Long>, JpaSpecificationExecutor<Goods> {
    Page<Goods> findAllByCategoryId(Long categoryId, Pageable pageable);

    @Query(value="SELECT * FROM goods JOIN category ON goods.category_id=category.id WHERE goods.name LIKE CONCAT('%',?1,'%') OR category.name LIKE CONCAT('%',?1,'%')",nativeQuery = true)
    Page<Goods> findByNameAndCategoryName(String searchContent, Pageable pageable);
}
