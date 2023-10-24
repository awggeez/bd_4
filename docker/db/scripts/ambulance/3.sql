create table station
(
    stat_nr bigserial primary key,
    name    varchar(255)
);

create table stations_personal
(
    pers_nr bigserial primary key,
    name    varchar(255),
    stat_nr bigint references station (stat_nr)
);

create table doctor
(
    pers_nr bigint references stations_personal (pers_nr),
    area    varchar(255),
    rang    varchar(255)
);

create table caregivers
(
    pers_nr       bigint references stations_personal (pers_nr),
    qualification varchar(255)
);

create table room
(
    room_nr bigserial primary key,
    stat_nr bigint references station (stat_nr),
    beds    int
);


create table patient
(
    patient_nr bigserial primary key,
    name       varchar(255),
    disease    varchar(255),
    room_nr    bigint references room (room_nr),
    "from"     timestamp,
    "to"       timestamp
);

create table treats
(
    patient_nr bigint references patient (patient_nr),
    pers_nr    bigint references stations_personal (pers_nr)
)
-- StationsPersonal ( PersNr, Name, StatNr)
--
-- Station ( StatNr, Name)
--
-- Doctor ( PersNr, Name, StatNr, Area, Rang)
--
-- Caregivers ( PersNr, Name, StatNr, Qualification)
--
-- Patient ( PatientNr, Name, Disease, RoomNr, from, to)
--
-- Room ( StatNr, RoomNr, #Beds)
--
-- Treats ( PatientNr, PersNr)