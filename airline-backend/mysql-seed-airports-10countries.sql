-- PrinceAirline - Seed airports for 10 countries (3 airports per country)
-- IMPORTANT: This seed matches enums in code (no underscores):
-- Country: VIETNAM, USA, UK, JAPAN, KOREA, SINGAPORE, THAILAND, FRANCE, GERMANY, AUSTRALIA
-- City: HANOI, HOCHIMINH, DANANG, MIAMI, DALLAS, NEWYORK, LONDON, LEEDS, MANCHESTER,
--       TOKYO, OSAKA, NAGOYA, SEOUL, BUSAN, INCHEON, SINGAPORECITY, JURONG, TAMPINES,
--       BANGKOK, PHUKET, CHIANGMAI, PARIS, LYON, MARSEILLE, BERLIN, MUNICH, FRANKFURT,
--       SYDNEY, MELBOURNE, BRISBANE

USE flightdb;

INSERT INTO airports (name, city, country, iata_code) VALUES
-- VIETNAM (3)
('Noi Bai International Airport', 'HANOI', 'VIETNAM', 'HAN'),
('Tan Son Nhat International Airport', 'HOCHIMINH', 'VIETNAM', 'SGN'),
('Da Nang International Airport', 'DANANG', 'VIETNAM', 'DAD'),

-- USA (3)
('Miami International Airport', 'MIAMI', 'USA', 'MIA'),
('Dallas/Fort Worth International Airport', 'DALLAS', 'USA', 'DFW'),
('John F. Kennedy International Airport', 'NEWYORK', 'USA', 'JFK'),

-- UK (3)
('Heathrow Airport', 'LONDON', 'UK', 'LHR'),
('Leeds Bradford Airport', 'LEEDS', 'UK', 'LBA'),
('Manchester Airport', 'MANCHESTER', 'UK', 'MAN'),

-- JAPAN (3)
('Haneda Airport', 'TOKYO', 'JAPAN', 'HND'),
('Kansai International Airport', 'OSAKA', 'JAPAN', 'KIX'),
('Chubu Centrair International Airport', 'NAGOYA', 'JAPAN', 'NGO'),

-- KOREA (3)
('Gimpo International Airport', 'SEOUL', 'KOREA', 'GMP'),
('Gimhae International Airport', 'BUSAN', 'KOREA', 'PUS'),
('Incheon International Airport', 'INCHEON', 'KOREA', 'ICN'),

-- SINGAPORE (3)
('Changi Airport', 'SINGAPORECITY', 'SINGAPORE', 'SIN'),
('Jurong Regional Airport', 'JURONG', 'SINGAPORE', 'JRG'),
('Tampines Airfield', 'TAMPINES', 'SINGAPORE', 'TMP'),

-- THAILAND (3)
('Suvarnabhumi Airport', 'BANGKOK', 'THAILAND', 'BKK'),
('Phuket International Airport', 'PHUKET', 'THAILAND', 'HKT'),
('Chiang Mai International Airport', 'CHIANGMAI', 'THAILAND', 'CNX'),

-- FRANCE (3)
('Charles de Gaulle Airport', 'PARIS', 'FRANCE', 'CDG'),
('Lyon–Saint-Exupéry Airport', 'LYON', 'FRANCE', 'LYS'),
('Marseille Provence Airport', 'MARSEILLE', 'FRANCE', 'MRS'),

-- GERMANY (3)
('Berlin Brandenburg Airport', 'BERLIN', 'GERMANY', 'BER'),
('Munich Airport', 'MUNICH', 'GERMANY', 'MUC'),
('Frankfurt Airport', 'FRANKFURT', 'GERMANY', 'FRA'),

-- AUSTRALIA (3)
('Sydney Airport', 'SYDNEY', 'AUSTRALIA', 'SYD'),
('Melbourne Airport', 'MELBOURNE', 'AUSTRALIA', 'MEL'),
('Brisbane Airport', 'BRISBANE', 'AUSTRALIA', 'BNE')
AS new
ON DUPLICATE KEY UPDATE
  name = new.name,
  city = new.city,
  country = new.country,
  iata_code = new.iata_code;
