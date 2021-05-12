package com.service.Role;

import com.dao.RoleDao;
import com.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = java.lang.Exception.class)
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Role> getAll() {
        return roleDao.queryAll();
    }

    @Override
    public List<String> getAllRoleName() {
        return roleDao.queryAllRoleName();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Role getByRoleName(String roleName) {
        return roleDao.queryByRoleName(roleName);
    }
}
