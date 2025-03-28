--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    number_of_planets integer,
    number_of_stars integer,
    age_in_million_years numeric(18,1),
    description text,
    has_life boolean,
    has_planets boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    index integer,
    number_of_gases integer,
    age_in_million_years numeric(18,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    number_of_moons integer,
    number_of_suns integer,
    age_in_million_years numeric(18,1),
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    number_of_moons integer,
    number_of_planets integer,
    age_in_million_years numeric(18,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', NULL, NULL, 123.8, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Adromeda', NULL, NULL, 343.5, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward', NULL, NULL, 67.5, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Blinking', NULL, NULL, 89.5, NULL, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Cigar', NULL, NULL, 456.3, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Comet', NULL, NULL, 234.6, NULL, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (25, 'Phobos', NULL, NULL, 9.5, NULL, false, NULL, 13);
INSERT INTO public.moon VALUES (26, 'Deimos', NULL, NULL, 3.3, NULL, true, NULL, 14);
INSERT INTO public.moon VALUES (27, 'Europa', NULL, NULL, 34.6, NULL, true, NULL, 22);
INSERT INTO public.moon VALUES (28, 'Calisto', NULL, NULL, 5.6, NULL, false, NULL, 13);
INSERT INTO public.moon VALUES (29, 'Elara', NULL, NULL, 3.6, NULL, true, NULL, 15);
INSERT INTO public.moon VALUES (30, 'Carme', NULL, NULL, 8.8, NULL, true, NULL, 16);
INSERT INTO public.moon VALUES (31, 'Sinope', NULL, NULL, 3.5, NULL, true, NULL, 14);
INSERT INTO public.moon VALUES (32, 'Anake', NULL, NULL, 2.5, NULL, false, NULL, 16);
INSERT INTO public.moon VALUES (33, 'Lythrax', NULL, NULL, 9.3, NULL, false, NULL, 22);
INSERT INTO public.moon VALUES (34, 'Crystal', NULL, NULL, 4.5, NULL, true, NULL, 19);
INSERT INTO public.moon VALUES (35, 'Erix', NULL, NULL, 4.6, NULL, true, NULL, 17);
INSERT INTO public.moon VALUES (36, 'Himla', NULL, NULL, 6.5, NULL, true, NULL, 14);
INSERT INTO public.moon VALUES (37, 'Calto', NULL, NULL, 9.5, NULL, false, NULL, 15);
INSERT INTO public.moon VALUES (38, 'Fomos', NULL, NULL, 3.3, NULL, true, NULL, 23);
INSERT INTO public.moon VALUES (39, 'Opa', NULL, NULL, 34.6, NULL, true, NULL, 24);
INSERT INTO public.moon VALUES (40, 'Neo', NULL, NULL, 5.6, NULL, false, NULL, 13);
INSERT INTO public.moon VALUES (41, 'Lara', NULL, NULL, 3.6, NULL, true, NULL, 19);
INSERT INTO public.moon VALUES (42, 'Arme', NULL, NULL, 8.8, NULL, true, NULL, 20);
INSERT INTO public.moon VALUES (43, 'Kope', NULL, NULL, 3.5, NULL, true, NULL, 24);
INSERT INTO public.moon VALUES (44, 'Hake', NULL, NULL, 2.5, NULL, false, NULL, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', NULL, NULL, 9.5, NULL, NULL, false, 2);
INSERT INTO public.planet VALUES (14, 'Mars', NULL, NULL, 3.3, NULL, NULL, true, 4);
INSERT INTO public.planet VALUES (15, 'Uranus', NULL, NULL, 34.6, NULL, NULL, true, 1);
INSERT INTO public.planet VALUES (16, 'Venus', NULL, NULL, 5.6, NULL, NULL, false, 3);
INSERT INTO public.planet VALUES (17, 'Jupiter', NULL, NULL, 3.6, NULL, NULL, true, 5);
INSERT INTO public.planet VALUES (18, 'Neptune', NULL, NULL, 8.8, NULL, NULL, true, 6);
INSERT INTO public.planet VALUES (19, 'Earth', NULL, NULL, 3.5, NULL, NULL, true, 3);
INSERT INTO public.planet VALUES (20, 'Saturn', NULL, NULL, 2.5, NULL, NULL, false, 6);
INSERT INTO public.planet VALUES (21, 'Pluto', NULL, NULL, 9.3, NULL, NULL, false, 2);
INSERT INTO public.planet VALUES (22, 'Ceres', NULL, NULL, 4.5, NULL, NULL, true, 4);
INSERT INTO public.planet VALUES (23, 'Eris', NULL, NULL, 4.6, NULL, NULL, true, 2);
INSERT INTO public.planet VALUES (24, 'Genue', NULL, NULL, 6.5, NULL, NULL, true, 1);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (2, 'Super Jupiter', 'dfht fhdr erje');
INSERT INTO public.planet_types VALUES (3, 'Giant Planet', 'dgfte dhte djsuj');
INSERT INTO public.planet_types VALUES (4, 'Sub Earth', 'wsegsk fdfike swed ');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Taurus', NULL, NULL, 6.8, NULL, NULL, true, 1);
INSERT INTO public.star VALUES (5, 'Scorpius', NULL, NULL, 23.6, NULL, NULL, true, 2);
INSERT INTO public.star VALUES (3, 'Leo', NULL, NULL, 5.6, NULL, NULL, true, 3);
INSERT INTO public.star VALUES (1, 'Lynx', NULL, NULL, 9.5, NULL, NULL, false, 6);
INSERT INTO public.star VALUES (2, 'Crux', NULL, NULL, 6.3, NULL, NULL, true, 4);
INSERT INTO public.star VALUES (4, 'Cancer', NULL, NULL, 4.6, NULL, NULL, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 44, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_key UNIQUE (name);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

