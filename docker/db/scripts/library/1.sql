create table publisher
(
    pub_name varchar(255) unique,
    pub_kind varchar(255),
    primary key (pub_name, pub_kind)
);

create table book
(
    isbn      varchar(255) primary key,
    title     varchar(255),
    author    varchar(255),
    pub_year  int,
    pages_num int,
    pub_name  varchar(255) references publisher (pub_name)
);

create table category
(
    name varchar(255) primary key,
    parent_cat    varchar(255) references category (name)

);

create table copy
(
    copy_number serial unique,
    shelf       int,
    position    int,
    isbn        varchar(255) references book (isbn),
    primary key (isbn, copy_number),
    unique (shelf, position)
);

create table reader
(
    id         bigserial primary key,
    last_name  varchar(255),
    first_name varchar(255),
    address    varchar(255),
    birth_date timestamp
);

create table borrowing
(
    reader_num  bigint references reader (id),
    isbn        varchar(255) references book (isbn),
    copy_num    int references copy (copy_number),
    return_date timestamp,
    primary key (reader_num, isbn, copy_num)
);

create table book_cat
(
    isbn       varchar(255) references book (isbn),
    cat_name varchar(255) references category (name),
    primary key (isbn, cat_name)
);