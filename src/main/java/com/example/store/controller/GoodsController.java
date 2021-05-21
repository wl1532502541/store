package com.example.store.controller;

import com.example.store.dao.CategoryDao;
import com.example.store.dao.GoodsDao;
import com.example.store.dao.TradeDao;
import com.example.store.entity.Category;
import com.example.store.entity.Goods;
import com.example.store.entity.Trade;
import com.example.store.entity.User;
import com.example.store.myUtil.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller //控制器 用来返回页面 （如果是@RestController，返回的是json格式字符串）
@RequestMapping(value = "/goods")    //url地址为 域名/goods时处理信息
public class GoodsController {


    @Autowired
    private GoodsDao goodsDao;

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private TradeDao tradeDao;

    /*@RequestMapping(value = "/")
    private String goods(Model m){

        List<Category> categories=categoryDao.findAll();
        m.addAttribute()
    }
*/
    /*@RequestMapping(value = "/basketball")   //商品管理
    public String goods_basketball(Model m){
        List<Goods> goods =goodsDao.findAll();
        m.addAttribute("goods",goods);
        return "goods/basketball";
    }*/

    @RequestMapping(value="")
    public String goodsWithCategoryId(HttpServletRequest request,Model m){
        //传给前端所有商品分类 用于渲染导航栏
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);

        Long categoryId=Long.parseLong(request.getParameter("categoryId"));//接受前端传来的需要的分类ID
        m.addAttribute("categoryId",categoryId);//传回 下次分页要带这个参数
        m.addAttribute("curCategory",categoryDao.findById(categoryId).get().getName());
        /*int pageIndex=0;
        int pageSize=8;
        if(request.getParameter("pageIndex")!=null)pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
        if(request.getParameter("pageSize")!=null)Integer.parseInt(request.getParameter("pageSize"));
        Pageable pageable= PageRequest.of(pageIndex,pageSize);*/
        Pageable pageRequest= MyUtil.pageRequest(request);
        Page page=goodsDao.findAllByCategoryId(categoryId,pageRequest);
        List<Goods> goods=page.getContent();
        m.addAttribute("goods",goods);
        /*m.addAttribute("goods",)*/
        //传给前端总结果数
        Long itemsTotal=page.getTotalElements();
        m.addAttribute("itemsTotal",itemsTotal);
        //传给前端总页码数
        int pagesTotal=page.getTotalPages();
        m.addAttribute("pagesTotal",pagesTotal);
        //传给前端当前分页索引
        m.addAttribute("pageIndex",pageRequest.getPageNumber());
        /*m.addAttribute("pageIndex",pageIndex);*/
        return "goods/show";
    }

    @RequestMapping(value="/prebuy")
    public String prebuyWithGoodsId(HttpServletRequest request,Model m){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user==null){   //如果没登陆就重定向到登陆界面
            return "redirect:/user/login";
        }
        //传给前端所有商品分类 用于渲染导航栏
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);

        Long goodsId=Long.parseLong(request.getParameter("goodsId"));
        Goods goods=goodsDao.findById(goodsId).get();
        m.addAttribute("goods",goods);
        return "goods/prebuy";
    }

    @RequestMapping(value="/buy")
    public String buyWithGoodsId(HttpServletRequest request,Model m){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user==null){   //如果没登陆就重定向到登陆界面
            return "redirect:/user/login";
        }
        /*//传给前端所有商品分类 用于渲染导航栏
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);*/

        Long goodsId=Long.parseLong(request.getParameter("goodsId"));
        String address=request.getParameter("address");
        int goodsCount=Integer.parseInt(request.getParameter("goodsCount"));
        Long userId= user.getId();;
        Trade newTrade=new Trade(userId,goodsId,goodsCount,address,1);
        tradeDao.save(newTrade);
        Goods goods=goodsDao.findById(goodsId).get();
        m.addAttribute("goods",goods);
        return "redirect:/user/ucenter/trade";
    }

    @RequestMapping(value = "/cart")
    public String goods_cart_op(Model m,
                                HttpServletRequest request,
                                @Param(value="goodsId") Long goodsId,
                                @Param(value="op") String op){
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user==null){   //如果没登陆就重定向到登陆界面
            return "redirect:/user/login";
        }
        HashMap<Long,Integer> cartMap=null;
        List<Goods> cartGoods=new ArrayList<>();
        if(session.getAttribute("cartMap")==null){
            cartMap=new HashMap<>();
        }else{
            cartMap=(HashMap<Long, Integer>) session.getAttribute("cartMap");
        }
        switch (op){
            case "add":
                if(cartMap.get(goodsId)==null){
                    /*cartMap.put(Long.parseLong(goodsId),1);*/
                    cartMap.put(goodsId,1);
                }
                break;
            case "remove":
                if(cartMap.get(goodsId)!=null){
                    /*cartMap.remove(Long.parseLong(goodsId));*/
                    cartMap.remove(goodsId);
                }
                break;
        }
        cartMap.forEach((k,v)->{
            Goods goods=goodsDao.findById(k).get();
            cartGoods.add(goods);
        });
        session.setAttribute("cartGoods",cartGoods);
        session.setAttribute("cartMap",cartMap);

        return "redirect:/goods/prebuy?goodsId="+goodsId;
    }

    @RequestMapping(value="/search")
    public String goodsWithSearch(HttpServletRequest request,Model m){
        /*HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user==null){   //如果没登陆就重定向到登陆界面
            return "redirect:/user/login";
        }
        //传给前端所有商品分类 用于渲染导航栏
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);

        Long goodsId=Long.parseLong(request.getParameter("goodsId"));
        Goods goods=goodsDao.findById(goodsId).get();
        m.addAttribute("goods",goods);*/
        //传给前端所有商品分类 用于渲染导航栏
        List<Category> categories=categoryDao.findAll();
        m.addAttribute("categories",categories);

        String searchContent=request.getParameter("searchContent");
        m.addAttribute("searchContent",searchContent);
        if(searchContent==null||searchContent.equals("")){
            m.addAttribute("goods",null);
            //传给前端总结果数
            m.addAttribute("itemsTotal",0);
            //传给前端总页码数
            m.addAttribute("pagesTotal",0);
            //传给前端当前分页索引
            m.addAttribute("pageIndex",0);
        }else{
            Pageable pageRequest= MyUtil.pageRequest(request);
            Page page=goodsDao.findByNameAndCategoryName(searchContent, pageRequest);
            List goods=page.getContent();
            m.addAttribute("goods",goods);
            //传给前端总结果数
            Long itemsTotal=page.getTotalElements();
            m.addAttribute("itemsTotal",itemsTotal);
            //传给前端总页码数
            int pagesTotal=page.getTotalPages();
            m.addAttribute("pagesTotal",pagesTotal);
            //传给前端当前分页索引
            m.addAttribute("pageIndex",pageRequest.getPageNumber());
        }


        return "goods/search";
    }
}
