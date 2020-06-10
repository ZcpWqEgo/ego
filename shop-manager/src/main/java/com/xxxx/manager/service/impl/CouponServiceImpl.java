package com.xxxx.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.common.result.BaseResult;
import com.xxxx.common.utils.JsonUtil;
import com.xxxx.manager.mapper.CouponMapper;
import com.xxxx.manager.mapper.UserMapper;
import com.xxxx.manager.pojo.*;
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
    private UserMapper userMapper;
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

    @Override
    public int insertTypeCoupon(Coupon coupon) {
        return couponMapper.insert(coupon);
    }
    @Override
    public BaseResult selectUserList(Integer pageNum, Integer pageSize,String inputMobile,String inputEmail,String inputNickname) {
        //构建分页对象
        PageHelper.startPage(pageNum,pageSize);
        //创建查询对象
        UserExample userExample= new UserExample();

        UserExample.Criteria criteria = userExample.createCriteria();

        if(inputMobile==null||inputMobile.equals("")){
        }else {
            criteria.andMobileLike("%"+inputMobile+"%");
        }
        if(inputEmail==null||inputEmail.equals("")){
        }else {
            criteria.andEmailLike("%"+inputEmail+"%");
        }
        if(inputNickname==null||inputNickname.equals("")){
        }else {
            criteria.andNicknameLike("%"+inputNickname+"%");
        }
        List<User> list = userMapper.selectByExample(userExample);
        if (!CollectionUtils.isEmpty(list)){
            //将查询结果设置至分页对象
            PageInfo<User> pageInfo = new PageInfo<>(list);
            System.out.println("pageInfo"+pageInfo);
            return BaseResult.success(pageInfo);
        }
        return BaseResult.error();
    }

    @Override
    public List<User> selectUser(Integer pageNum, Integer pageSize,String inputMobile,String inputEmail,String inputNickname) {
        //构建分页对象
        PageHelper.startPage(pageNum,pageSize);
        //创建查询对象
        UserExample userExample= new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        if(inputMobile==null||inputMobile.equals("")){
        }else {
            criteria.andMobileLike("%"+inputMobile+"%");
        }
        if(inputEmail==null||inputEmail.equals("")){
        }else {
            criteria.andEmailLike("%"+inputEmail+"%");
        }
        if(inputNickname==null||inputNickname.equals("")){
        }else {
            criteria.andNicknameLike("%"+inputNickname+"%");
        }
        List<User> list = userMapper.selectByExample(userExample);
        if (!CollectionUtils.isEmpty(list)){
            System.out.println("list"+list);
            return list;
        }
        return null;
    }

}
