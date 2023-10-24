-- City ( Name, Region )
--
-- Station ( Name, #Tracks, CityName, Region )
--
-- Train ( TrainNr, Length, StartStationName, EndStationName )
--
-- Connection ( FromStation, ToStation, TrainNr, Departure, Arrival)
--

create table city
(
    name   varchar(32),
    region varchar(64),
    primary key (name, region)
);

create table station
(
    name      varchar(64) primary key,
    tracks    int,
    city_name varchar(32),
    region    varchar(64),
    foreign key (city_name, region) references city (name, region)
);

create table train
(
    train_nr           bigserial primary key,
    length             int,
    start_station_name varchar(32) references station (name),
    end_station_name   varchar(32) references station (name)
);

create table connection
(
    from_station varchar(32) references station (name),
    to_station   varchar(32) references station (name),
    train_nr     bigint references train (train_nr),
    departure    timestamp,
    arrival      timestamp,
    unique (departure, from_station, train_nr),
    unique (arrival, to_station, train_nr),
    primary key (train_nr, departure, arrival)
);
