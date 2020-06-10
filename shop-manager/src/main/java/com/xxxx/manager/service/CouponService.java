package com.xxxx.manager.service;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.pojo.Coupon;
import com.xxxx.manager.pojo.Goods;
import com.xxxx.manager.pojo.User;

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
    BaseResult selectCouponsListByPage(Integer pageNum, Integer pageSize);
    int insertTypeCoupon(Coupon coupon);
    BaseResult selectUserList(Integer pageNum, Integer pageSize,String inputMobile,String inputEmail,String inputNickname);
    List<User> selectUser(Integer pageNum, Integer pageSize,String inputMobile,String inputEmail,String inputNickname);
}
