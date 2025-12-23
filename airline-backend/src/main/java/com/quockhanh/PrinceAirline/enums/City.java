package com.quockhanh.PrinceAirline.enums;

import lombok.Getter;

@Getter
public enum City {

    //Vietnam
    HANOI(Country.VIETNAM),
    HO_CHI_MINH(Country.VIETNAM),
    DA_NANG(Country.VIETNAM),

    // USA
    MIAMI(Country.USA),
    DALLAS(Country.USA),
    NEWYORK(Country.USA),

    // UK
    LONDON(Country.UK),
    LEEDS(Country.UK),
    MANCHESTER(Country.UK),

    // JAPAN
    TOKYO(Country.JAPAN),
    OSAKA(Country.JAPAN),
    NAGOYA(Country.JAPAN),

    // KOREA
    SEOUL(Country.KOREA),
    BUSAN(Country.KOREA),
    INCHEON(Country.KOREA),

    // SINGAPORE
    SINGAPORECITY(Country.SINGAPORE),
    JURONG(Country.SINGAPORE),
    TAMPINES(Country.SINGAPORE),

    // THAILAND
    BANGKOK(Country.THAILAND),
    PHUKET(Country.THAILAND),
    CHIANGMAI(Country.THAILAND),

    // FRANCE
    PARIS(Country.FRANCE),
    LYON(Country.FRANCE),
    MARSEILLE(Country.FRANCE),

    // GERMANY
    BERLIN(Country.GERMANY),
    MUNICH(Country.GERMANY),
    FRANKFURT(Country.GERMANY),

    // AUSTRALIA
    SYDNEY(Country.AUSTRALIA),
    MELBOURNE(Country.AUSTRALIA),
    BRISBANE(Country.AUSTRALIA);


    private final Country country;

    City(Country country) {
        this.country = country;
    }

}
