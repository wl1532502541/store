package com.example.store.controller;

import com.example.store.dao.GoodsDao;
import com.example.store.dao.TradeDao;
import com.example.store.dao.UserDao;
import com.example.store.entity.Goods;
import com.example.store.entity.Trade;
import com.example.store.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller //控制器 用来返回页面 （如果是@RestController，返回的是json格式字符串）
@RequestMapping(value = "/user")    //url地址为 域名/user时处理信息
public class UserController {

    @Autowired                  //自动装配一个类的实例
    private UserDao userDao;

    @Autowired
    private TradeDao tradeDao;

    @Autowired
    private GoodsDao goodsDao;

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

    @RequestMapping(value = "/ucenter/trade/cancel")
    public String ucenter_trade_cancel(@RequestParam(value = "id") Long  id){   //接收要取消的订单的id
        Trade trade=tradeDao.findById(id).get();
        trade.setState(4);      //把状态设为取消
        tradeDao.save(trade);   //jpa的save在主键存在时会merge，当update使用
        return "redirect:/user/ucenter/trade";
    }

    @RequestMapping(value = "/trade/got")
    public String admin_trade_send(@RequestParam(value = "id") Long  id){   //接收要确认完成的订单的id
        Trade trade=tradeDao.findById(id).get();
        trade.setState(3);      //把状态设为已完成（已收到货）
        tradeDao.save(trade);   //jpa的save在主键存在时会merge，当update使用
        return "redirect:/admin/trade";
    }

    @RequestMapping(value="/ucenter/infor")
    public String ucenter_infor(HttpServletRequest request){
        return "user/ucenter/infor";
    }

    @RequestMapping(value = "/cart")
    public String cart(Model m,HttpServletRequest request){
        //算出购物车中商品总价
        double totalPrice=0;
        HttpSession session=request.getSession();
        HashMap<Long,Integer> cartMap=(HashMap<Long, Integer>) session.getAttribute("cartMap");
        /*List<Goods> cartGoods=(List<Goods>) session.getAttribute("cartGoods");*/
        if(cartMap!=null){
            for(Map.Entry<Long,Integer> entry:cartMap.entrySet() ){
                double price=goodsDao.findById(entry.getKey()).get().getPrice();
                totalPrice=totalPrice+price*entry.getValue();
            }
        }
        m.addAttribute("totalPrice",totalPrice);

        return "/user/cart";
    }

    @RequestMapping(value = "/cart/op")
    public String cart_op(HttpServletRequest request,Model m){
        HttpSession session=request.getSession();
        HashMap<Long,Integer> cartMap=(HashMap<Long, Integer>) session.getAttribute("cartMap");
        //接收购物车增减删操作
        String op=request.getParameter("op");
        Long goodsId=Long.parseLong(request.getParameter("goodsId"));
        List<Goods> cartGoods=new ArrayList<>();
        if(op!=null){
            switch (op){
                case "more":
                    cartMap.put(goodsId,cartMap.get(goodsId)+1);
                    break;
                case "less":
                    int count=cartMap.get(goodsId);
                    if(count>1){
                        cartMap.put(goodsId,cartMap.get(goodsId)-1);
                    }else{
                        cartMap.remove(goodsId);
                    }
                    break;
                case "move":
                    cartMap.remove(goodsId);
                    break;
            }
        }
        cartMap.forEach((k,v)->{
            Goods goods=goodsDao.findById(k).get();
            cartGoods.add(goods);
        });
        session.setAttribute("cartGoods",cartGoods);
        session.setAttribute("cartMap",cartMap);
        return "redirect:/user/cart";
    }

    @RequestMapping(value = "/buyFromCart")
    public String buyFromCart(@Param(value="address") String address,
                              HttpServletRequest request){
        //从购物车取出商品id和数量
        HttpSession session=request.getSession();
        HashMap<Long,Integer> cartMap=(HashMap<Long, Integer>) session.getAttribute("cartMap");
        List<Goods> cartGoods=(List<Goods>) session.getAttribute("cartGoods");
        User user=(User)session.getAttribute("user");
        //对每个商品下订单
        for(Map.Entry<Long,Integer> entry:cartMap.entrySet() ){
            Trade newTrade=new Trade(user.getId(),entry.getKey(), entry.getValue(),address,1);
            tradeDao.save(newTrade);
        }
        //清空购物车
        session.setAttribute("cartMap",null);
        session.setAttribute("cartGoods",new ArrayList<>());
        return "redirect:/user/ucenter/trade";
    }
}
