package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.dtos.AirportDTO;
import com.quockhanh.PrinceAirline.dtos.Response;

import java.util.List;

public interface AirportService {

    Response<?> createAirport(AirportDTO airportDTO);

    Response<?> updateAirport(AirportDTO airportDTO);

    Response<List<AirportDTO>> getAllAirports();

    Response<AirportDTO> getAirportById(Long id);

}
