package com.example.store.entity;

import com.example.store.dao.UserDao;
import lombok.Data;
import org.hibernate.annotations.Proxy;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
public class Trade {


    public Trade(){}

    public Trade(Long userId,Long goodsId,int goodsCount,String address,int state){
        this.user=new User();
        this.user.setId(userId);
        this.goods=new Goods();
        this.goods.setId(goodsId);
        this.goodsCount=goodsCount;
        this.address=address;
        this.state=state;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //private Long userId;//买家Id

    /*@ManyToOne(fetch = FetchType.LAZY)//配置懒加载*/
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    //private Long goodsId;//商品Id

    /*@ManyToOne(fetch = FetchType.LAZY)//配置懒加载*/
    @ManyToOne
    @JoinColumn(name = "goods_id")
    private Goods goods;

    /*@Column()
    private Date createAt;*/

    private int goodsCount;//商品数量

    private String address;//收货地址

    //private int state;//订单状态 0:新建 1:已核对 2:已发货 3:已送货 4:完成 5:取消
    private int state;//订单状态 1:待发货 2:配送中 3:已完成 4:已取消

    /*public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public int getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(int goodsCount) {
        this.goodsCount = goodsCount;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }*/
}
