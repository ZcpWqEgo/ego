package com.xxxx.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.common.result.BaseResult;
import com.xxxx.common.utils.JsonUtil;
import com.xxxx.manager.mapper.CouponMapper;
import com.xxxx.manager.pojo.Coupon;
import com.xxxx.manager.pojo.CouponExample;
import com.xxxx.manager.pojo.Goods;
import com.xxxx.manager.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
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
        CouponExample example = new CouponExample();
        CouponExample.Criteria criteria=example.createCriteria();
        List<Coupon> list= couponMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(list)){
            //将查询结果设置至分页对象
            PageInfo<Coupon> pageInfo = new PageInfo<>(list);

            return list;
        }
        return null;
    }

    @Override
    public BaseResult selectCouponsListByPage(Integer pageNum, Integer pageSize) {
        BaseResult baseResult;
        //构建分页对象
        PageHelper.startPage(pageNum,pageSize);
        //创建查询对象
        CouponExample example = new CouponExample();
        CouponExample.Criteria criteria=example.createCriteria();
        List<Coupon> list= couponMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(list)){
            //将查询结果设置至分页对象
            PageInfo<Coupon> pageInfo = new PageInfo<>(list);

            return BaseResult.success(pageInfo);
        }
        return BaseResult.error();
    }

}
