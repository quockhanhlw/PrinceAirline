package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.dtos.Response;
import com.quockhanh.PrinceAirline.dtos.UserDTO;
import com.quockhanh.PrinceAirline.entities.User;

import java.util.List;

public interface UserService {

    User currentUser();

    Response<?> updateMyAccount(UserDTO userDTO);

    Response<List<UserDTO>> getAllPilots();

    Response<UserDTO> getAccountDetails();
}
