package com.xxxx.manager.controller;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.pojo.Coupon;
import com.xxxx.manager.service.CouponService;
import com.xxxx.manager.service.impl.CouponServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("promotion")
public class CouponController {
    @Autowired
    private CouponService couponService;
    @RequestMapping("/coupon")
    public String coupon(Model model, @RequestParam(value="pageNum",defaultValue="1",required=true)  Integer pageNum,@RequestParam(value="pageSize",defaultValue="10",required=true)  Integer pageSize) {
//        model.addAttribute("couponList",goodsCategoryService.selectCategoryListForView());
        model.addAttribute("couponList",couponService.selectCouponListByPage(pageNum,pageSize));
        model.addAttribute("couponPage",couponService.selectCouponsListByPage(pageNum,10));

        return "promotion/coupon";
    }
    @RequestMapping("/coupon_list")
    @ResponseBody
    public BaseResult couponList(@RequestParam(value="pageNum",defaultValue="1",required=true) Integer pageNum) {
        return couponService.selectCouponsListByPage(pageNum,10);
    }

}
