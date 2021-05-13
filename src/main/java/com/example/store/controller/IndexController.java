package com.example.store.controller;

import com.example.store.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.DateFormat;
import java.util.Date;

@Controller
public class IndexController {
    @RequestMapping("/")
    public String hello(Model m){
        User n=new User("asdss","asddsa");
        m.addAttribute("123",n);
        return "index";
    }
}
