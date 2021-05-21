package com.example.store.controller;

import com.example.store.dao.CategoryDao;
import com.example.store.dao.GoodsDao;
import com.example.store.dao.TradeDao;
import com.example.store.entity.Category;
import com.example.store.entity.Goods;
import com.example.store.entity.Trade;
import com.example.store.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

@Controller //控制器 用来返回页面 （如果是@RestController，返回的是json格式字符串）
@RequestMapping(value = "/admin")    //url地址为 域名/admin时处理信息
public class AdminController {

    @Autowired
    private TradeDao tradeDao;

    @Autowired
    private GoodsDao goodsDao;

    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping(value = "/goods")   //商品管理
    public String admin_goods(HttpServletRequest request,Model m){
        User user=(User)request.getSession().getAttribute("user");
        if(user==null||user.getIsAdmin()==false){   //如果没登陆或者权限不够就重定向回主页
            return "redirect:/";
        }
        //分页
        int pageIndex=0;//默认索引
        int pageSize=10;//默认页大小
        if(request.getParameter("pageIndex")!=null)pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
        if(request.getParameter("pageSize")!=null)Integer.parseInt(request.getParameter("pageSize"));
        Pageable pageable= PageRequest.of(pageIndex,pageSize);
        m.addAttribute("pageIndex",pageIndex);//返回前端当前分页索引
        List<Goods> goods= goodsDao.findAll(pageable).getContent();
        m.addAttribute("goods",goods);
        Long goodsTotal=goodsDao.findAll(pageable).getTotalElements();
        int pagesTotal=goodsDao.findAll(pageable).getTotalPages();
        //传给前端总页码数和总结果数
        m.addAttribute("pagesTotal",pagesTotal);
        m.addAttribute("goodsTotal",goodsTotal);


        //传给前端所有商品分类
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);
        return "admin/goods";

    }

    @PostMapping(value = "/goods/add")
    public String admin_goods_add(@Param(value="name")String name,
                                  @Param(value="categoryId")Long id,
                                  @Param(value = "price")double price,
                                  @Param(value="leftCount")int leftCount){
        return "redirect:/admin/goods";
    }

    @RequestMapping(value = "/goods/addCount")
    public String admin_goods_addCount(@Param(value = "id") Long id){
        Goods good =goodsDao.findById(id).get();
        int count=good.getLeftCount();
        good.setLeftCount(count+100);
        goodsDao.save(good);
        return "redirect:/admin/goods";
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
    @RequestMapping(value = "/trade/cancel")
    public String admin_trade_cancel(@RequestParam(value = "id") Long  id){   //接收要取消的订单的id
        Trade trade=tradeDao.findById(id).get();
        trade.setState(4);      //把状态设为取消
        tradeDao.save(trade);   //jpa的save在主键存在时会merge，当update使用
        return "redirect:/admin/trade";
    }

    @RequestMapping(value = "/trade/send")
    public String admin_trade_send(@RequestParam(value = "id") Long  id){   //接收要发货的订单的id
        Trade trade=tradeDao.findById(id).get();
        trade.setState(2);      //把状态设为配送中
        tradeDao.save(trade);   //jpa的save在主键存在时会merge，当update使用
        return "redirect:/admin/trade";
    }

    @RequestMapping(value = "/category")
    public String admin_category(HttpServletRequest request,Model m){
        //分页
        int pageIndex=0;//默认索引
        int pageSize=10;//默认页大小
        if(request.getParameter("pageIndex")!=null)pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
        if(request.getParameter("pageSize")!=null)Integer.parseInt(request.getParameter("pageSize"));
        Pageable pageable= PageRequest.of(pageIndex,pageSize);
        //查询结果
        Page page=categoryDao.findAll(pageable);
        //传给前端商品分类
        List<Category> categories=page.getContent();
        m.addAttribute("categories",categories);
        //传给前端总结果数
        Long itemsTotal=page.getTotalElements();
        m.addAttribute("itemsTotal",itemsTotal);
        //传给前端总页码数
        int pagesTotal=page.getTotalPages();
        m.addAttribute("pagesTotal",pagesTotal);
        //传给前端当前分页索引
        m.addAttribute("pageIndex",pageIndex);
        return "admin/category";
    }

    @RequestMapping(value = "/category/add")
    public String admin_category_add(Model m,@Param(value="name") String name){
        Category category=categoryDao.findByName(name);
        if(category==null){
            categoryDao.save(new Category(name));
        }
        return "redirect:/admin/category";
    }


}
