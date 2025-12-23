package com.quockhanh.PrinceAirline.controller;

import com.quockhanh.PrinceAirline.dtos.RegistrationRequest;
import com.quockhanh.PrinceAirline.dtos.Response;
import com.quockhanh.PrinceAirline.dtos.UserDTO;
import com.quockhanh.PrinceAirline.services.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor

public class UserController {
    private final UserService userService;


    @PutMapping
    public ResponseEntity<Response<?>> updateMyAccount(@RequestBody UserDTO userDTO){
        return ResponseEntity.ok(userService.updateMyAccount(userDTO));
    }

    @GetMapping("/pilots")
    @PreAuthorize("hasAnyAuthority('ADMIN', 'PILOT')")
    public ResponseEntity<Response<List<UserDTO>>> getAllPilots(){
        return ResponseEntity.ok(userService.getAllPilots());
    }

    @GetMapping("/me")
    public ResponseEntity<Response<UserDTO>> getAccountDetails(){
        return ResponseEntity.ok(userService.getAccountDetails());
    }
}
