package com.mystall.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mystall.system.entity.SysPayConfigDO;
import com.mystall.system.mapper.SysPayConfigMapper;
import com.mystall.system.service.ISysPayConfigService;
import org.springframework.stereotype.Service;

@Service
public class SysPayConfigServiceImpl extends ServiceImpl<SysPayConfigMapper, SysPayConfigDO> implements ISysPayConfigService {
}
