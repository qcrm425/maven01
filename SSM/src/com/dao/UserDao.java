package com.dao;

import com.pojo.Page;
import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    String queryUserPassword(String userPassword);
    int modifyPassword(@Param("userId")Integer userId,@Param("password")String password);
    int modify(User user);
    int add(User user);
    List<User> queryByUsernameAndRoleId(@Param("begin")Integer begin,@Param("size")Integer size,@Param("username") String username, @Param("roleId")Integer roleId);
    int countByUsernameAndRoleId(@Param("username") String username, @Param("roleId")Integer roleId);
    int deleteById(Integer id);
    User queryById(Integer id);
    User queryByUsernameAndPassword(@Param("username")String username, @Param("password")String password);
}
