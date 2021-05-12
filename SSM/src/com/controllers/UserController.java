package com.controllers;

import com.alibaba.fastjson.JSON;
import com.dao.UserDao;
import com.pojo.Page;
import com.pojo.User;
import com.service.provider.ProviderService;
import com.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/changeUser.do")
    @ResponseBody
    public String changeUser(User user){
        boolean rs = userService.change(user);
        return rs ? "ok" : "sorry";
    }

    @RequestMapping("/limitQuery.do")
    @ResponseBody
    public String limitQuery(Integer begin,Integer size,String user,Integer roleId,Model model){
//        System.out.println(begin + "," + size + "," + user + "," + roleId);
        Page<User> page = userService.getPageByUsernameAndRoleName(begin, size, user, roleId);
        String temp = JSON.toJSONString(page);
//        System.out.println(temp);
        return temp;
    }


    @RequestMapping("/queryUserById.do")
    public String queryById(@RequestParam String id, Model model){
        User user = userService.getById(Integer.parseInt(id));
        System.out.println(user);
        if(user != null){
            model.addAttribute("info",user);
            return "selfPage.jsp";
        }else{
            model.addAttribute("error","id错误");
            return "queryUserPage.jsp";
        }
    }

    @RequestMapping("/deleteUser.do")
    @ResponseBody
    public String deleteUser(@RequestParam String username,@RequestParam String password){
        User user = userService.getByUsernameAndPassword(username, password);
        if(user != null){
            boolean rs = userService.removeById(user.getId());
            if(rs){
                return "ok";
            }else{
                return "sorry";
            }
        }else{
            return "sorry";
        }
    }


    @RequestMapping("/addUser.do")
    @ResponseBody
    public String addUser(User user,@RequestParam(value="a_idPicPath",required=false) MultipartFile file,
                          HttpServletRequest request) throws Exception {
        System.out.println("进来了");
        //获取项目实际路径
        String realPath = request.getServletContext().getRealPath("/img/");
        //保存图片
        file.transferTo(new File(realPath + File.separator + file.getOriginalFilename()));
        //给user的idPicPath赋值
        user.setIdPicPath("/img/" + file.getOriginalFilename());
        boolean rs = userService.addOne(user);
        return rs ? "ok" : "sorry";
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(@RequestParam String username, @RequestParam String password, HttpServletRequest request){
        User user = userService.getByUsernameAndPassword(username,password);
        request.getSession().setAttribute("user",user);
        if(user != null){
            return "true";
        }else{
            return "false";
        }
    }
    @RequestMapping("/reLogin.do")
    public String reLogin(HttpServletRequest request){
//        注销登录信息
        request.getSession().setAttribute("user",null);
//        重定向到登录页面
        return "redirect:login.jsp";
    }
    @RequestMapping("/checkUserPassword.do")
    @ResponseBody
    public String checkUserPassword(@RequestParam String old,HttpServletRequest request){
        String username = ((User)(request.getSession().getAttribute("user"))).getUserName();
        System.out.println("username:" + username);
        User user = userService.getByUsernameAndPassword(username, old);
        if(user != null){
            return "exists";
        }else{
            return "notExists";
        }
    }

    @RequestMapping("/changeUserPassword.do")
    @ResponseBody
    public String changeUserPassword(@RequestParam String newPassword,HttpServletRequest request){
        Integer userId = ((User)(request.getSession().getAttribute("user"))).getId();
        System.out.println("userId:" + userId);
        boolean rs = userService.changePassword(userId, newPassword);
        if(rs){
            return "ok";
        }else{
            return "sorry";
        }
    }
}
