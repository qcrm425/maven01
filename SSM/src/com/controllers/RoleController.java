package com.controllers;


import com.alibaba.fastjson.JSON;
import com.pojo.Role;
import com.service.Role.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/loadRole.do")
    @ResponseBody
    public String loadRole(){
        List<Role> list = roleService.getAll();
        String s = JSON.toJSONString(list);
        return s;
    }

}
