package com.example.store;

import com.example.store.dao.UserDao;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@SpringBootTest
@Import(UserDao.class)
class StoreApplicationTests {

    @Test
    void contextLoads() {
    }

}
