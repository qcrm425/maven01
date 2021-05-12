package com.service.user;


import com.dao.RoleDao;
import com.dao.UserDao;
import com.pojo.Page;
import com.pojo.Role;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = java.lang.Exception.class)
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public boolean isExistsUserPassword(String userPassword) {
        return userDao.queryUserPassword(userPassword) != null ? true : false;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public boolean changePassword(Integer userId,String password) {
        return userDao.modifyPassword(userId,password) > 0 ? true : false;
    }

    @Override
    @Transactional
    public boolean change(User user) {
        return userDao.modify(user) > 0 ? true : false;
    }

    @Override
    @Transactional
    public boolean addOne(User user) {
        return userDao.add(user) > 0 ? true : false;
    }

    @Override
    @Transactional
    public boolean removeById(Integer id) {
        return userDao.deleteById(id) > 0 ? true : false;
    }

    @Override
    @Transactional
    public Page<User> getPageByUsernameAndRoleName(Integer begin,Integer size,String username, Integer roleId) {
        int count = userDao.countByUsernameAndRoleId(username, roleId);
        Page<User> page = new Page<>();
        page.setSumSize(count);
        page.setElementSize(size);
        page.setPageSize((count % size) == 0 ? count / size : (count / size) + 1);
        page.setBegin(begin);
        page.setElements(userDao.queryByUsernameAndRoleId((page.getBegin() - 1) * size, size, username, roleId));
        return page;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public User getById(Integer id) {
        return userDao.queryById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public User getByUsernameAndPassword(String username, String password) {
        return userDao.queryByUsernameAndPassword(username,password);
    }
}
