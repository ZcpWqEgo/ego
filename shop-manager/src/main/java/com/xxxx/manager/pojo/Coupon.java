package com.xxxx.manager.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author zhoubin 
 * @create 2020-06-07
 * @since 1.0.0
 */
public class Coupon implements Serializable {
    /**
     * 表id
     */
    private Integer id;

    /**
     * 优惠券名字
     */
    private String name;

    /**
     * 发放类型 0面额模板1 按用户发放 2 注册 3 邀请 4 线下发放
     */
    private Byte type;

    /**
     * 优惠券金额
     */
    private BigDecimal money;

    /**
     * 使用条件
     */
    private BigDecimal condition;

    /**
     * 发放数量
     */
    private Integer createnum;

    /**
     * 已领取数量
     */
    private Integer sendNum;

    /**
     * 已使用数量
     */
    private Integer useNum;

    /**
     * 发放开始时间
     */
    private Integer sendStartTime;

    /**
     * 发放结束时间
     */
    private Integer sendEndTime;

    /**
     * 使用开始时间
     */
    private Integer useStartTime;

    /**
     * 使用结束时间
     */
    private Integer useEndTime;

    /**
     * 添加时间
     */
    private Integer addTime;

    /**
     * t_coupon
     */
    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getCondition() {
        return condition;
    }

    public void setCondition(BigDecimal condition) {
        this.condition = condition;
    }

    public Integer getCreatenum() {
        return createnum;
    }

    public void setCreatenum(Integer createnum) {
        this.createnum = createnum;
    }

    public Integer getSendNum() {
        return sendNum;
    }

    public void setSendNum(Integer sendNum) {
        this.sendNum = sendNum;
    }

    public Integer getUseNum() {
        return useNum;
    }

    public void setUseNum(Integer useNum) {
        this.useNum = useNum;
    }

    public Integer getSendStartTime() {
        return sendStartTime;
    }

    public void setSendStartTime(Integer sendStartTime) {
        this.sendStartTime = sendStartTime;
    }

    public Integer getSendEndTime() {
        return sendEndTime;
    }

    public void setSendEndTime(Integer sendEndTime) {
        this.sendEndTime = sendEndTime;
    }

    public Integer getUseStartTime() {
        return useStartTime;
    }

    public void setUseStartTime(Integer useStartTime) {
        this.useStartTime = useStartTime;
    }

    public Integer getUseEndTime() {
        return useEndTime;
    }

    public void setUseEndTime(Integer useEndTime) {
        this.useEndTime = useEndTime;
    }

    public Integer getAddTime() {
        return addTime;
    }

    public void setAddTime(Integer addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", type=").append(type);
        sb.append(", money=").append(money);
        sb.append(", condition=").append(condition);
        sb.append(", createnum=").append(createnum);
        sb.append(", sendNum=").append(sendNum);
        sb.append(", useNum=").append(useNum);
        sb.append(", sendStartTime=").append(sendStartTime);
        sb.append(", sendEndTime=").append(sendEndTime);
        sb.append(", useStartTime=").append(useStartTime);
        sb.append(", useEndTime=").append(useEndTime);
        sb.append(", addTime=").append(addTime);
        sb.append("]");
        return sb.toString();
    }
}