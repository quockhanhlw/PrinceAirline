package com.quockhanh.PrinceAirline.repo;

import com.quockhanh.PrinceAirline.entities.Passenger;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PassengerRepo extends JpaRepository<Passenger, Long> {
}
