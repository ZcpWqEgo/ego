package com.xxxx.manager.service;

import com.xxxx.manager.pojo.Coupon;

import java.util.List;
/**
 * 优惠券接口
 * @author 吴强
 * @since 1.0.0
 * */
public interface CouponService {
    /**
     * 优惠券查询-查询所有优惠券
     * @param
     * @return
     */
    List<Coupon> selectCouponListByPage(Integer pageNum, Integer pageSize);
}
