package com.quockhanh.PrinceAirline.dtos;

import com.quockhanh.PrinceAirline.enums.PassengerType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PassengerDTO {

    private Long id;

    @NotBlank(message = "First Name cannot be blank")
    private String firstName;

    @NotBlank(message = "Last Name cannot be blank")
    private String lastName;

    private String passportNumber;

    @NotNull(message = "Passenger Type cannot be null")
    private PassengerType type;

    private String seatNumber;

    private String specialRequests;

}