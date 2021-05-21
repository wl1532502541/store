package com.example.store.myUtil;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {
    public static Pageable pageRequest(HttpServletRequest request){
        int pageIndex=0;
        int pageSize=8;
        if(request.getParameter("pageIndex")!=null)pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
        if(request.getParameter("pageSize")!=null)Integer.parseInt(request.getParameter("pageSize"));
        Pageable pageRequest= PageRequest.of(pageIndex,pageSize);
        return pageRequest;
    }
}
