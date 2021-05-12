package com.service.provider;

import com.pojo.Provider;

import java.util.List;


public interface ProviderService {
    List<Provider> getAll();
    int addOne(Provider provider);
    boolean isExistsProCode(String proCode);
}
