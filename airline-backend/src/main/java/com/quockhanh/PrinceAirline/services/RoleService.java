package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.dtos.Response;
import com.quockhanh.PrinceAirline.dtos.RoleDTO;

import java.util.List;

public interface RoleService {
    Response<?> createRole(RoleDTO roleDTO);
    Response<?> updateRole(RoleDTO roleDTO);
    Response<List<RoleDTO>> getAllRoles();
}
