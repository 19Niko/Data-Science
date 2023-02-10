create database Tenent;
use Tenent;

create table Profiles (
profile_id int(11) auto_increment not null,
first_name varchar(255),
last_name varchar(255),
email varchar(255) NOt null,
phone varchar(255) not null,
city varchar(255),
pan_card varchar(255),
created_at date Not null,
gender varchar(255) Not null,
referral_code varchar(255),
marital_status varchar(255),
primary key (profile_id));

create table Referrals (
ref_id int(11) auto_increment not null,
referrer_id int(11) not null,
referrer_bonus_amount float,
referral_valid tinyint(1) constraint check_referral check (referral_valid>=0 and referral_valid<=1),
valid_from date,
valid_till date,
primary key (ref_id),
Foreign key(referrer_id)
references Profiles(profile_id));

create table Houses(
house_id int(11) auto_increment not null,
house_type varchar(225),
bhk_details varchar(255) ,
bed_count int(11) Not null,
furnishing_type varchar(255),
Beds_vacant int(11) not null,
primary key (house_id));

create table Tenancy_histories(
id int(11) auto_increment not null,
profile_id int(11) not null,
house_id int(11) not null ,
move_in_date date not null,
move_out_date date,
rent int(11) Not null,
Bed_type varchar(255),
move_out_reason varchar(255),
primary key (id),
Foreign key(profile_id)
references Profiles(profile_id),
Foreign key(house_id)
references Houses(house_id));

create table Addresses (
ad_id int(11) auto_increment not null,
name varchar(255),
description text,
pincode int(11),
city varchar(255),
house_id int(11) not null,
primary key (ad_id),
Foreign key(house_id)
references Houses(house_id));

create table Employment_details(
id int(11) auto_increment not null,
profile_id int(11) not null,
latest_employer varchar(255),
official_mail_id varchar(255),
yrs_experience int(11),
Occupational_category varchar(255),
primary key (id),
foreign key (profile_id)
references Profiles(profile_id));

select * from Profiles