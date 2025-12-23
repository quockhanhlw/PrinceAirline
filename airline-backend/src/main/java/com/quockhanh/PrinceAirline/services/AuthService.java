package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.dtos.LoginRequest;
import com.quockhanh.PrinceAirline.dtos.LoginResponse;
import com.quockhanh.PrinceAirline.dtos.RegistrationRequest;
import com.quockhanh.PrinceAirline.dtos.Response;

public interface AuthService {

    Response<?> register(RegistrationRequest registrationRequest);
    Response<LoginResponse> login(LoginRequest loginRequest);
}
