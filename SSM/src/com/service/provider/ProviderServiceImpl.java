package com.service.provider;


import com.dao.ProviderDao;
import com.pojo.Provider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = java.lang.Exception.class)
public class ProviderServiceImpl implements ProviderService {
    @Autowired
    private ProviderDao providerDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Provider> getAll() {
        return providerDao.queryAll();
    }

    @Override
    @Transactional
    public int addOne(Provider provider) {
        return providerDao.add(provider);
    }

    @Override
    public boolean isExistsProCode(String proCode) {
        return providerDao.queryProCode(proCode) != null;
    }
}
