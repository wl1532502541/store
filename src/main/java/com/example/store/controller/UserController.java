package com.example.store.controller;

import com.example.store.dao.TradeDao;
import com.example.store.dao.UserDao;
import com.example.store.entity.Trade;
import com.example.store.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller //控制器 用来返回页面 （如果是@RestController，返回的是json格式字符串）
@RequestMapping(value = "/user")    //url地址为 域名/user时处理信息
public class UserController {

    @Autowired                  //自动装配一个类的实例
    private UserDao userDao;

    @Autowired
    private TradeDao tradeDao;

    @RequestMapping(value = "/login")   //url地址为 域名/user/login时
    public String login(){
        return "user/login";        //返回jsp目录下user/login.jsp页面
    }

    @PostMapping(value = "/login/handleSubmit")  //接收到表单action里的此url请求时
    public String handlelogin(HttpServletRequest request){
        String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        User user= userDao.findByNameAndPassword(userName,password);
        if(user!=null){
            request.getSession().setAttribute("user",user);
            return "redirect:/";
        }else{
            /*request.setAttribute("errorMsg","登陆失败");
            request.getSession().setAttribute("errorMsg","登陆失败");*/
            return "redirect:/user/login?errorMsg=1";
        }
    }


    @RequestMapping(value = "/register")
    public String register(){
        return "user/register";
    }

    @PostMapping(value = "/register/handleSubmit")
    public String handleregister(HttpServletRequest request){
        String name=(String)request.getParameter("userName");
        String password=(String)request.getParameter("password1");
        User user = userDao.findByName(name);
        if(user==null){
            User newuser = new User(name,password);
            userDao.save(newuser);
            request.getSession().setAttribute("user",newuser);
        }else{
            /*request.getSession().setAttribute("errorMsg","注册失败，该用户名已被占用");*/
            return "redirect:/user/register?errorMsg=2";
        }
        return "redirect:/";
    }

    @RequestMapping(value="/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/";
    }

    /*@RequestMapping(value = "/ucenter/**")    *//* **的作用：匹配多层路径*//*
    public String ucenter(){
        return "user/ucenter";
    }*/

    @RequestMapping(value="/ucenter/index")
    public String ucenter_index(HttpServletRequest request){
        return "user/ucenter/index";
    }

    @RequestMapping(value = "/ucenter/trade")
    public String ucenter_trade(Model m,HttpServletRequest request){
        //List<Trade> trades = tradeDao.findAll();
        HttpSession session=request.getSession();
        if(session.getAttribute("user")==null){
            return "redirect:/";
        }
        List<Trade> trades = tradeDao.findAllByUserId( ( (User)(session.getAttribute("user")) ).getId() );
        if(trades==null)m.addAttribute("test","-1");
        else m.addAttribute("test",trades.size());
        m.addAttribute("trades", trades);
        return "user/ucenter/trade";
    }

    @RequestMapping(value = "/ucenter/trade/canceltrade")
    public String ucenter_trade_cancel(@RequestParam(value = "id") Long  id){   //接收要取消的订单的id
        Trade trade=tradeDao.findById(id).get();
        trade.setState(4);      //把状态设为取消
        tradeDao.save(trade);   //jpa的save在主键存在时会merge，当update使用
        return "redirect:/user/ucenter/trade";
    }

    @RequestMapping(value="/ucenter/infor")
    public String ucenter_infor(HttpServletRequest request){
        return "user/ucenter/infor";
    }

    @RequestMapping(value = "/cart")
    public String cart(){
        return "/user/cart";
    }
}
