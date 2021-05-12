package com.service.Role;

import com.pojo.Role;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface RoleService {
    List<Role> getAll();
    List<String> getAllRoleName();
    Role getByRoleName(String roleName);
}
