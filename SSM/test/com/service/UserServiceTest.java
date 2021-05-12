package com.service;

import com.pojo.Page;
import com.pojo.User;
import com.service.user.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

public class UserServiceTest {
    private UserService bean;
    @Before
    public void init(){
        bean = new ClassPathXmlApplicationContext("spring-jdbc.xml")
                .getBean(UserService.class);
    }
    @Test
    public void testIsExistsUserPassword(){
        boolean rs = bean.isExistsUserPassword("12345675");
        System.out.println(rs);
    }
    @Test
    public void testChangePassword(){
        boolean rs = bean.changePassword(2, "5432197");
        System.out.println(rs);
    }

    @Test
    public void testAddOne(){
        User user = new User();
        user.setUserName("林家浩");
        boolean rs = bean.addOne(user);
        System.out.println(rs);
    }

    @Test
    public void testGetPageByUsernameAndRoleName(){
        Page<User> page = bean.getPageByUsernameAndRoleName(5, 5, "林家浩", 1);
        System.out.println(page.getBegin());
        System.out.println(page.getElementSize());
        System.out.println(page.getPageSize());
        System.out.println(page.getSumSize());
        page.getElements().forEach(System.out::println);
    }

    @Test
    public void testChange(){
        User user = new User();
        user.setId(18);
        user.setUserCode("linjiahao");
        user.setUserName("林记号");
        user.setUserPassword("55221134");
        user.setGender(1);
        user.setBirthday(new Date());
        user.setPhone("12345678911");
        user.setAddress("河南省漯河市邵陵区");
        user.setUserRole(3);
        user.setCreatedBy(1);
        user.setCreationDate(new Date());
        boolean rs = bean.change(user);
        System.out.println(rs);
    }
    @Test
    public void testRemoveById(){
        boolean rs = bean.removeById(18);
        System.out.println(rs);
    }

    @Test
    public void testGetById(){
        User user = bean.getById(15);
        System.out.println(user);
    }
}
