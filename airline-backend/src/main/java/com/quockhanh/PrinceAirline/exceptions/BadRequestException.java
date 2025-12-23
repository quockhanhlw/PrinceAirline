package com.quockhanh.PrinceAirline.exceptions;

public class BadRequestException extends RuntimeException {

    public BadRequestException(String ex){
        super(ex);
    }
}
