--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40),
    apparent_magnitude numeric NOT NULL,
    constellation character varying(40),
    distance_in_mly numeric
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
    name character varying(40),
    planet_id integer NOT NULL,
    discovery_year integer,
    orbital_axis text NOT NULL,
    bigger_than_moon boolean NOT NULL
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
-- Name: nabula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nabula (
    nabula_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance numeric,
    discovery_year character varying(10)
);


ALTER TABLE public.nabula OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass numeric,
    radius numeric,
    discovery_year integer,
    star_id integer,
    bigger_than_earth boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    designation character varying(30),
    vmag numeric,
    galaxy_id integer NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, 'Sagittarius', 0);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 0.9, 'Dorado', 0.16);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 2.7, 'Tucna', 0.2);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 3.4, 'Andromeda', 2.5);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5.7, 'Triangulum', 2.9);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.84, 'Centaurus', 13.7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, '384,399', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 10, 1877, '9,380', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 10, 1877, '23,460', false);
INSERT INTO public.moon VALUES (4, 'Lo', 3, 1610, '421,800', true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1610, '671,100', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 1610, '1,070,400', true);
INSERT INTO public.moon VALUES (7, 'Mimas', 12, 1789, '185,540', false);
INSERT INTO public.moon VALUES (8, 'Doine', 12, 1684, '377,420', false);
INSERT INTO public.moon VALUES (9, 'Rhea', 12, 1672, '527,070', false);
INSERT INTO public.moon VALUES (10, 'Triton', 11, 1846, '345,800', false);
INSERT INTO public.moon VALUES (11, 'Nereid', 11, 1949, '5,513,820', true);
INSERT INTO public.moon VALUES (12, 'Naraid', 11, 1989, '48,224', false);
INSERT INTO public.moon VALUES (13, 'Thalassa', 11, 1989, '50,075', false);
INSERT INTO public.moon VALUES (14, 'Charon', 13, 1978, '19,591', false);
INSERT INTO public.moon VALUES (15, 'Nix', 13, 2005, '48,671', false);
INSERT INTO public.moon VALUES (16, 'Hydra', 13, 2005, '64,698', false);
INSERT INTO public.moon VALUES (17, 'Styx', 13, 2012, '42,393', false);
INSERT INTO public.moon VALUES (18, 'Titan', 12, 1655, '1,221,870', true);
INSERT INTO public.moon VALUES (19, 'Iapetus', 12, 1671, '3,560,840', true);
INSERT INTO public.moon VALUES (20, 'Despina', 11, 1989, '52,526', false);


--
-- Data for Name: nabula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nabula VALUES (1, 'Ghost of jupiter', 1.4, '1785');
INSERT INTO public.nabula VALUES (2, 'Blinking Planetary', 2.0, '1764');
INSERT INTO public.nabula VALUES (3, 'Dumbbell Nabula', 7.5, '1764');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, NULL, 8, false);
INSERT INTO public.planet VALUES (2, 'Mercury', 0.055, 0.38, NULL, 8, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 317.8, 10.973, NULL, 8, true);
INSERT INTO public.planet VALUES (4, 'Abol', 4.8, 4, NULL, 1, true);
INSERT INTO public.planet VALUES (5, 'Noifasui', 0.0174, 0, 2004, 3, false);
INSERT INTO public.planet VALUES (6, 'Asye', 0.542, 1.428, 2008, 4, false);
INSERT INTO public.planet VALUES (7, 'Krotoa', 0.57, 1.39, 2011, 5, true);
INSERT INTO public.planet VALUES (8, 'Hiisi', 0.267, 0.825, 2012, 6, false);
INSERT INTO public.planet VALUES (9, 'Venus', 1.3, 2.1, 0, 8, true);
INSERT INTO public.planet VALUES (10, 'Mars', 1.57, 1.39, 0, 8, true);
INSERT INTO public.planet VALUES (11, 'Neptune', 0.27, 0.25, 0, 8, false);
INSERT INTO public.planet VALUES (12, 'Saturn', 1.7, 1.91, 0, 8, true);
INSERT INTO public.planet VALUES (13, 'Pluto', 0.04, 0.12, NULL, 8, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Buna', 'HD 16175', 7.28, 4);
INSERT INTO public.star VALUES (2, 'Adhil', 'HR 390', 4.87, 4);
INSERT INTO public.star VALUES (3, 'Dofida', 'HD 117618', 7.17, 6);
INSERT INTO public.star VALUES (4, 'Nyamien', 'WASP 15', 10.91, 6);
INSERT INTO public.star VALUES (5, 'Naledi', 'WASP-62', 10.12, 2);
INSERT INTO public.star VALUES (6, 'Horna', 'HAT-P-38', 12.53, 5);
INSERT INTO public.star VALUES (7, 'Mothallah', 'HR 544', 3.42, 5);
INSERT INTO public.star VALUES (8, 'Sun', '', 0, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: nabula nabulae_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nabula
    ADD CONSTRAINT nabulae_name_key UNIQUE (name);


--
-- Name: nabula nabulae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nabula
    ADD CONSTRAINT nabulae_pkey PRIMARY KEY (nabula_id);


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

