package com.quockhanh.PrinceAirline.repo;

import com.quockhanh.PrinceAirline.entities.EmailNotification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmailNotificationRepo extends JpaRepository<EmailNotification, Long> {
}
