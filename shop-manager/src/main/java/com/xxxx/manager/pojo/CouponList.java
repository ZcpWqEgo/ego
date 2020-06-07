package com.xxxx.manager.pojo;

import java.io.Serializable;

/**
 * @author zhoubin 
 * @since 1.0.0
 */
public class CouponList implements Serializable {
    /**
     * 表id
     */
    private Integer id;

    /**
     * 优惠券 对应coupon表id
     */
    private Integer cid;

    /**
     * 发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放
     */
    private Byte type;

    /**
     * 用户id
     */
    private Integer uid;

    /**
     * 订单id
     */
    private Integer orderId;

    /**
     * 使用时间
     */
    private Integer useTime;

    /**
     * 优惠券兑换码
     */
    private String code;

    /**
     * 发放时间
     */
    private Integer sendTime;

    /**
     * t_coupon_list
     */
    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUseTime() {
        return useTime;
    }

    public void setUseTime(Integer useTime) {
        this.useTime = useTime;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Integer getSendTime() {
        return sendTime;
    }

    public void setSendTime(Integer sendTime) {
        this.sendTime = sendTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", cid=").append(cid);
        sb.append(", type=").append(type);
        sb.append(", uid=").append(uid);
        sb.append(", orderId=").append(orderId);
        sb.append(", useTime=").append(useTime);
        sb.append(", code=").append(code);
        sb.append(", sendTime=").append(sendTime);
        sb.append("]");
        return sb.toString();
    }
}