package com.xxxx.manager.controller;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.pojo.Coupon;
import com.xxxx.manager.service.CouponService;
import com.xxxx.manager.utils.TimeExchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("promotion")
public class CouponController {
    @Autowired
    private CouponService couponService;

    @RequestMapping("/coupon")
    public String coupon(Model model, @RequestParam(value = "pageNum", defaultValue = "1", required = true) Integer pageNum, @RequestParam(value = "pageSize", defaultValue = "10", required = true) Integer pageSize) {
//        model.addAttribute("couponList",goodsCategoryService.selectCategoryListForView());
        model.addAttribute("couponList", couponService.selectCouponListByPage(pageNum, pageSize));
        model.addAttribute("couponPage", couponService.selectCouponsListByPage(pageNum, 10));

        return "promotion/coupon";
    }

    //    @RequestMapping("/coupon_list")
//    @ResponseBody
//    public BaseResult couponList(@RequestParam(value="pageNum",defaultValue="1",required=true) Integer pageNum) {
//        return couponService.selectCouponsListByPage(pageNum,10);
//    }
    @RequestMapping("/add")
    public String coupon_add() {
//        model.addAttribute("couponList",goodsCategoryService.selectCategoryListForView());
        return "promotion/coupon-add";
    }

    @RequestMapping("/coupon_add")
    @ResponseBody
    public BaseResult couponinsert(String name, Integer money, Integer condition,Integer orderstatus, Integer createnum, String send_start_time, String send_end_time, String use_start_time, String use_end_time) {
//        model.addAttribute("couponList",goodsCategoryService.selectCategoryListForView());
        System.out.println("send_end_time：" + TimeExchange.StringToTimestamp(send_end_time));
        Coupon coupon = new Coupon();
        coupon.setName(name);
        coupon.setMoney(new BigDecimal(money));
        coupon.setCondition(new BigDecimal(condition));
        coupon.setType(orderstatus);
        coupon.setCreatenum(createnum);
        coupon.setUseNum(0);
        coupon.setSendNum(0);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());
        //设置当前时间为新增时间
        coupon.setAddTime(TimeExchange.StringToTimestamp(date));
        coupon.setSendStartTime(TimeExchange.StringToTimestamp(send_start_time));
        coupon.setSendEndTime(TimeExchange.StringToTimestamp(send_end_time));
        //如果类别不为面额模板，则拥有使用开始时间和使用结束时间
        if (orderstatus != 0) {
            coupon.setUseStartTime(TimeExchange.StringToTimestamp(use_start_time));
            coupon.setUseEndTime(TimeExchange.StringToTimestamp(use_end_time));
        }
        int i = couponService.insertTypeCoupon(coupon);
        if(i==1){
           return BaseResult.success();
        }
        return BaseResult.error();
    }

    @RequestMapping("/grantList")
    public String coupon_grantList(Integer id, Model model, @RequestParam(value = "pageNum", defaultValue = "1", required = true) Integer pageNum, @RequestParam(value = "pageSize", defaultValue = "20", required = true) Integer pageSize,String inputMobile,String inputEmail,String inputNickname) {
//        model.addAttribute("couponList",goodsCategoryService.selectCategoryListForView());
//        model.addAttribute("couponId",id);

        model.addAttribute("userPage",couponService.selectUserList(pageNum,pageSize,inputMobile,inputEmail,inputNickname));

        model.addAttribute("userList",couponService.selectUser(pageNum,pageSize,inputMobile,inputEmail,inputNickname));
        return "promotion/coupon-grant";
    }
}