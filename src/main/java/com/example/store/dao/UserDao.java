package com.example.store.dao;

import com.example.store.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User,Long> {
    User findByName(String name);

    User findByNameAndPassword(String name,String password);
}
