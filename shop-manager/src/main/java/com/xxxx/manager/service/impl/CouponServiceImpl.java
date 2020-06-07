package com.xxxx.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.xxxx.manager.mapper.CouponMapper;
import com.xxxx.manager.pojo.Coupon;
import com.xxxx.manager.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.List;


public class CouponServiceImpl  implements CouponService {
    @Autowired
    private CouponMapper couponMapper;
    @Autowired
    private RedisTemplate redisTemplate;
    @Override
    public List<Coupon> selectCouponListByPage(Integer pageNum, Integer pageSize) {
        //构建分页对象
        PageHelper.startPage(pageNum,pageSize);
        //创建查询对象

        return  null;
    }

}
