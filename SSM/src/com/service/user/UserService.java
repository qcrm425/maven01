package com.service.user;

import com.pojo.Page;
import com.pojo.User;

import java.util.List;

public interface UserService {
    boolean isExistsUserPassword(String userPassword);
    boolean changePassword(Integer userId,String password);
    boolean change(User user);
    boolean addOne(User user);
    boolean removeById(Integer id);
    Page<User> getPageByUsernameAndRoleName(Integer begin,Integer size,String username, Integer roleId);
    User getById(Integer id);
    User getByUsernameAndPassword(String username, String password);
}
