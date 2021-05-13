package com.example.store.controller;

import com.example.store.dao.TradeDao;
import com.example.store.entity.Trade;
import com.example.store.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller //控制器 用来返回页面 （如果是@RestController，返回的是json格式字符串）
@RequestMapping(value = "/admin")    //url地址为 域名/admin时处理信息
public class AdminController {

    @Autowired
    private TradeDao tradeDao;

    @RequestMapping(value = "/goods")   //商品管理
    public String admin_goods(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        if(user==null||user.getIsAdmin()==false){   //如果没登陆或者权限不够就重定向回主页
            return "redirect:/";
        }
        return "admin/goods";
    }

    @RequestMapping(value = "/trade")   //订单管理
    public String admin_trade(HttpServletRequest request,Model m){
        User user=(User)request.getSession().getAttribute("user");
        if(user==null||user.getIsAdmin()==false){   //如果没登陆或者权限不够就重定向回主页
            return "redirect:/";
        }
        List<Trade> trades = tradeDao.findAll();
        /*if(trades==null)m.addAttribute("test","-1");
        else m.addAttribute("test",trades.size());*/
        m.addAttribute("trades", trades);
        return "admin/trade";
    }
    @RequestMapping(value = "/trade/canceltrade")
    public String admin_trade_cancel(@RequestParam(value = "id") Long  id){   //接收要取消的订单的id
        Trade trade=tradeDao.findById(id).get();
        trade.setState(4);      //把状态设为取消
        tradeDao.save(trade);   //jpa的save在主键存在时会merge，当update使用
        return "redirect:/admin/trade";
    }
}
