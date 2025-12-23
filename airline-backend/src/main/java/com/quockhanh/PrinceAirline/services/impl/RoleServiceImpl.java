package com.quockhanh.PrinceAirline.services.impl;

import com.quockhanh.PrinceAirline.dtos.Response;
import com.quockhanh.PrinceAirline.dtos.RoleDTO;
import com.quockhanh.PrinceAirline.entities.Role;
import com.quockhanh.PrinceAirline.exceptions.NotFoundException;
import com.quockhanh.PrinceAirline.repo.RoleRepo;
import com.quockhanh.PrinceAirline.services.RoleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {



    private final RoleRepo roleRepo;
    private final ModelMapper modelMapper;

    @Override
    public Response<?> createRole(RoleDTO roleDTO) {

        log.info("Inside createRole()");

        Role role = modelMapper.map(roleDTO, Role.class);

        role.setName(role.getName().toUpperCase());

        roleRepo.save(role);

        return Response.builder()
                .statusCode(HttpStatus.OK.value())
                .message("Role Created Successfully")
                .build();
    }

    @Override
    public Response<?> updateRole(RoleDTO roleDTO) {
        log.info("Inside updateRole()");

        Long id = roleDTO.getId();

        Role existingRole = roleRepo.findById(id)
                .orElseThrow(()-> new NotFoundException("Role not found"));

        existingRole.setName(roleDTO.getName().toUpperCase());
        roleRepo.save(existingRole);

        return Response.builder()
                .statusCode(HttpStatus.OK.value())
                .message("Role updated Successfully")
                .build();

    }

    @Override
    public Response<List<RoleDTO>> getAllRoles() {
        log.info("Inside getAllRoles()");
        List<RoleDTO> roles = roleRepo.findAll().stream()
                .map(role -> modelMapper.map(role, RoleDTO.class))
                .toList();

        return Response.<List<RoleDTO>>builder()
                .statusCode(HttpStatus.OK.value())
                .message(roles.isEmpty() ? "No Roles Found" : "Roles Retreived Successfully")
                .data(roles)
                .build();
    }
}
