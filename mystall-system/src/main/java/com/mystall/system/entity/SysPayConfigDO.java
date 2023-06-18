package com.mystall.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.mystall.common.base.BaseDO;
import lombok.Data;

import java.io.Serializable;

/**
 * 支付配置
 * @author fuchuan
 */
@Data
@TableName("sys_pay_config")
public class SysPayConfigDO extends BaseDO implements Serializable {
    private static final long serialVersionUID = 1L;

}
