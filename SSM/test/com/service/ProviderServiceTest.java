package com.service;

import com.pojo.Provider;
import com.service.provider.ProviderService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class ProviderServiceTest {
    private ProviderService bean;

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-jdbc.xml");
        bean = ac.getBean(ProviderService.class);
    }

    @Test
    public void testGetAll(){
        List<Provider> all = bean.getAll();
        all.forEach(provider -> System.out.println(provider));
    }

    @Test
    public void testGetProCode(){
        boolean exists = bean.isExistsProCode("BJ_GYS001");
        System.out.println(exists);
    }
}
