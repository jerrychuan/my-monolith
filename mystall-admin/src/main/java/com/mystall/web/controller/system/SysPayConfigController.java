package com.mystall.web.controller.system;

import com.mystall.system.entity.SysPayConfigDO;
import com.mystall.system.service.ISysPayConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sys/sysPayConfig")
public class SysPayConfigController {

    @Autowired
    private ISysPayConfigService iSysPayConfigService;

    /**
     * 查询学生信息
     * @param id
     * @return
     */
    @GetMapping("getInfo/{id}")
    public SysPayConfigDO getSysPayConfigDO(@PathVariable String id){
        System.out.println(1);
        return iSysPayConfigService.getById(id);
    }

    /**
     * 插入学生信息
     * @param SysPayConfigDO
     */
    @RequestMapping("/insert")
    public void insertInfo(SysPayConfigDO SysPayConfigDO){

        SysPayConfigDO info = new SysPayConfigDO();
        info.newInit();
        iSysPayConfigService.save(info);
    }

    /**
     * 查询全部学生信息
     * @return
     */
    @RequestMapping("/selectAll")
    public List<SysPayConfigDO> selectAll(){
        return iSysPayConfigService.list();
    }

    /**
     * 根据id更新学生表信息
     * @param SysPayConfigDO
     */
    @RequestMapping("/update")
    public void updateById(SysPayConfigDO SysPayConfigDO){

        SysPayConfigDO info = new SysPayConfigDO();
        info.setId(SysPayConfigDO.getId());
        iSysPayConfigService.updateById(info);
    }

    /**
     * 根据id删除学生信息
     * @param id
     */
    @RequestMapping("/delete")
    public void deleteById(String id){
        iSysPayConfigService.removeById(id);
    }

}
