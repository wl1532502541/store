package com.example.store.controller;

import com.example.store.dao.CategoryDao;
import com.example.store.entity.Category;
import com.example.store.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping("/")
    public String hello(Model m){
        /*User n=new User("asdss","asddsa");
        m.addAttribute("123",n);*/
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);
        return "index";
    }
}
