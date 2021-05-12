package com.dao;

import com.pojo.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserDaoTest {
    private UserDao bean;
    @Before
    public void init(){
        bean = new ClassPathXmlApplicationContext("spring-jdbc.xml").getBean(UserDao.class);
    }

    @Test
    public void testQueryByUsernameAndRoleId(){
        List<User> list = bean.queryByUsernameAndRoleId(0, 10, "系统管理员", 3);
        list.forEach(System.out::println);
    }
}
