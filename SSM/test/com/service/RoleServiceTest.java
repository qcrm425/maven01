package com.service;

import com.pojo.Role;
import com.service.Role.RoleService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class RoleServiceTest {
    private RoleService bean;

    @Before
    public void init(){
        bean = new ClassPathXmlApplicationContext("spring-jdbc.xml").getBean(RoleService.class);
    }
    @Test
    public void testGetAll(){
        bean.getAll().forEach(System.out::println);
    }
}
