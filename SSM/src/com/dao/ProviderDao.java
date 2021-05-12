package com.dao;

import com.pojo.Provider;

import java.util.List;

public interface ProviderDao {
    List<Provider> queryAll();
    int add(Provider provider);
    String queryProCode(String proCode);
}
