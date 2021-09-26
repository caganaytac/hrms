-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.cities
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(20) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.confirmed_corporates
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 6 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    corporate_id integer NOT NULL,
    employee_id integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.confirmed_job_adverts
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 6 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    job_advert_id bigint NOT NULL,
    employee_id integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.corporates
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    website character varying(255) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    confirmed boolean NOT NULL,
    active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE public.corporates_to_confirm
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    corporate_id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    website character varying(255) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE public.employees
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    individual_id integer NOT NULL,
    credit_score smallint NOT NULL,
    start_date date NOT NULL,
    finish_date date,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.faculties
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(40) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.favorite_job_adverts
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 6 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    job_advert_id bigint NOT NULL,
    individual_id integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.github_accounts
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    account_address character varying(500) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.individual_educations
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    individual_id integer NOT NULL,
    school_faculty_id integer NOT NULL,
    status_id smallint NOT NULL,
    graduate_year smallint,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.individual_job_experiences
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    individual_id integer NOT NULL,
    job_position_id smallint NOT NULL,
    company_name character varying(255) NOT NULL,
    start_date smallint NOT NULL,
    finish_date smallint,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.individual_job_positions
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    job_position_id smallint NOT NULL,
    individual_id integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.individual_languages
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    language_id smallint NOT NULL,
    individual_id integer NOT NULL,
    level smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.individual_technologies
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    individual_id integer NOT NULL,
    technology_id smallint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.individuals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    national_identity character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_adverts
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 6 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    corporate_id integer NOT NULL,
    job_position_id smallint NOT NULL,
    city_id smallint NOT NULL,
    work_area_id smallint NOT NULL,
    work_time_id smallint NOT NULL,
    min_salary numeric,
    max_salary numeric,
    open_position smallint NOT NULL,
    deadline date NOT NULL,
    description character varying(300) NOT NULL,
    status boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_positions
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(255) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.languages
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(20) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.linkedin_accounts
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    account_address character varying(500) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.phone_numbers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    phone_number character(15) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.school_faculties
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    faculty_id smallint NOT NULL,
    school_id integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.schools
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.statuses
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(20) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.technologies
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(50) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.user_biographies
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    user_id integer NOT NULL,
    biography character varying(150) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.user_photos
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    user_id integer NOT NULL,
    public_id character varying NOT NULL,
    url character varying NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    confirmed boolean NOT NULL,
    active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE public.work_areas
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(20) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.work_times
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(20) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.confirmed_corporates
    ADD FOREIGN KEY (corporate_id)
    REFERENCES public.corporates (id)
    NOT VALID;


ALTER TABLE public.confirmed_corporates
    ADD FOREIGN KEY (employee_id)
    REFERENCES public.employees (id)
    NOT VALID;


ALTER TABLE public.confirmed_job_adverts
    ADD FOREIGN KEY (employee_id)
    REFERENCES public.employees (id)
    NOT VALID;


ALTER TABLE public.confirmed_job_adverts
    ADD FOREIGN KEY (job_advert_id)
    REFERENCES public.job_adverts (id)
    NOT VALID;


ALTER TABLE public.corporates
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.corporates_to_confirm
    ADD FOREIGN KEY (corporate_id)
    REFERENCES public.corporates (id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.favorite_job_adverts
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.favorite_job_adverts
    ADD FOREIGN KEY (job_advert_id)
    REFERENCES public.job_adverts (id)
    NOT VALID;


ALTER TABLE public.github_accounts
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.individual_educations
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.individual_educations
    ADD FOREIGN KEY (school_faculty_id)
    REFERENCES public.school_faculties (id)
    NOT VALID;


ALTER TABLE public.individual_educations
    ADD FOREIGN KEY (status_id)
    REFERENCES public.statuses (id)
    NOT VALID;


ALTER TABLE public.individual_job_experiences
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.individual_job_experiences
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.individual_job_positions
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.individual_job_positions
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.individual_languages
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.individual_languages
    ADD FOREIGN KEY (language_id)
    REFERENCES public.languages (id)
    NOT VALID;


ALTER TABLE public.individual_technologies
    ADD FOREIGN KEY (individual_id)
    REFERENCES public.individuals (id)
    NOT VALID;


ALTER TABLE public.individual_technologies
    ADD FOREIGN KEY (technology_id)
    REFERENCES public.technologies (id)
    NOT VALID;


ALTER TABLE public.individuals
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (city_id)
    REFERENCES public.cities (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (corporate_id)
    REFERENCES public.corporates (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (work_area_id)
    REFERENCES public.work_areas (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (work_time_id)
    REFERENCES public.work_times (id)
    NOT VALID;


ALTER TABLE public.linkedin_accounts
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.phone_numbers
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.school_faculties
    ADD FOREIGN KEY (faculty_id)
    REFERENCES public.faculties (id)
    NOT VALID;


ALTER TABLE public.school_faculties
    ADD FOREIGN KEY (school_id)
    REFERENCES public.schools (id)
    NOT VALID;


ALTER TABLE public.user_biographies
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.user_photos
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;

END;