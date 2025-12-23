package com.quockhanh.PrinceAirline.services;

import com.quockhanh.PrinceAirline.entities.Booking;
import com.quockhanh.PrinceAirline.entities.User;

public interface EmailNotificationService {

    void sendBookingTickerEmail(Booking booking);
    void sendWelcomeEmail(User user);

}
