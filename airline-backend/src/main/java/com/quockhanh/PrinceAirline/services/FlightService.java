package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.dtos.CreateFlightRequest;
import com.quockhanh.PrinceAirline.dtos.FlightDTO;
import com.quockhanh.PrinceAirline.dtos.Response;
import com.quockhanh.PrinceAirline.enums.City;
import com.quockhanh.PrinceAirline.enums.Country;
import com.quockhanh.PrinceAirline.enums.FlightStatus;

import java.time.LocalDate;
import java.util.List;

public interface FlightService {

    Response<?> createFlight(CreateFlightRequest createFlightRequest);
    Response<FlightDTO> getFlightById(Long id);
    Response<List<FlightDTO>> getAllFlights();
    Response<?> updateFlight(CreateFlightRequest createFlightRequest);
    Response<List<FlightDTO>> searchFlight(String departurePortIata, String arrivalPortIata, FlightStatus status, LocalDate departureDate);
    Response<List<City>> getAllCities();
    Response<List<Country>> getAllCountries();

}
