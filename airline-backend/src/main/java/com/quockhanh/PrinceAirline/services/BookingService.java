package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.dtos.BookingDTO;
import com.quockhanh.PrinceAirline.dtos.CreateBookingRequest;
import com.quockhanh.PrinceAirline.dtos.Response;
import com.quockhanh.PrinceAirline.enums.BookingStatus;

import java.util.List;

public interface BookingService {

    Response<?> createBooking(CreateBookingRequest createBookingRequest);
    Response<BookingDTO> getBookingById(Long id);
    Response<List<BookingDTO>> getAllBookings();
    Response<List<BookingDTO>> getMyBookings();
    Response<?> updateBookingStatus(Long id, BookingStatus status);
}
