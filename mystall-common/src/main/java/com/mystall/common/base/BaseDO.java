package com.mystall.common.base;

import cn.hutool.core.date.DateUtil;
import com.mystall.common.utils.IdUtils;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class BaseDO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private Long crtUser;
    private Date crtTime;
    private Long updUser;
    private Date updTime;

    public void newInit(){
        newInit(false);
    }

    public void newInit(boolean initIdFlag){
        Date now = DateUtil.date();
        this.setCrtTime(now);
        this.setUpdTime(now);
        if (initIdFlag){
            this.id = IdUtils.getId();
        }
    }

    public void updateInit(){
        Date now= DateUtil.date();
        this.setUpdTime(now);

    }
}
