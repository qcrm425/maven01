package com.dao;

import com.pojo.Role;

import java.util.List;

public interface RoleDao {
    List<Role> queryAll();
    Role queryByRoleName(String roleName);
    List<String> queryAllRoleName();
}
