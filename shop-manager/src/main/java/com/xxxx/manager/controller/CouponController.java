package com.xxxx.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("promotion")
public class CouponController {
    @RequestMapping("/coupon")
    public String categoryList(Model model) {
//        model.addAttribute("couponList",goodsCategoryService.selectCategoryListForView());
        return "promotion/coupon";
    }

}
