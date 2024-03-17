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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellations_id integer NOT NULL,
    name character varying(20) NOT NULL,
    dist_from_earth_light_years numeric(5,1) NOT NULL
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellations.constellations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    apparent_magnitude numeric(3,1),
    is_naked_eye boolean NOT NULL,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    year_discovered integer,
    full_rotation_earth_days numeric(5,1),
    planet_id integer NOT NULL
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
    num_moons integer,
    fun_fact text,
    planet_type_id integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_in_constellation boolean,
    galaxy_id integer NOT NULL,
    constellations_id integer,
    star_type_id integer NOT NULL
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: constellations constellations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellations_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Orion', 1344.0);
INSERT INTO public.constellations VALUES (2, 'Cancer', 590.0);
INSERT INTO public.constellations VALUES (3, 'Andromeda', 2720.0);
INSERT INTO public.constellations VALUES (4, 'Canis Major', 8.6);
INSERT INTO public.constellations VALUES (5, 'Serpens', 24.6);
INSERT INTO public.constellations VALUES (6, 'Aries', 66.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -20.6, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3.1, true, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5.7, true, 1);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 7.9, false, 1);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', 16.2, false, 2);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 0.9, true, 3);
INSERT INTO public.galaxy VALUES (7, 'Spindle', 10.7, false, 4);
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 2.7, true, 3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'These galaxies resemble giant rotating pinwheels with a pancake-like disk of stars and a central bulge or tight concentration of stars.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'These galaxies have shapes that range from completely round to oval and usually contain little gas and dust and show very little organization or structure.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'These galaxies have unusual shapes like toothpicks, rings, or even little groupings of stars.');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'These galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation.');
INSERT INTO public.galaxy_type VALUES (5, 'Quasar', 'These are the most luminous type of active galaxy. They emit light across the electromagnetic spectrum, produce powerful particle jets, and can radiate thousands of times the energy emitted by a galaxy like the Milky Way.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 27.3, 3);
INSERT INTO public.moon VALUES (2, 'Dysnomia', 2005, 16.0, 10);
INSERT INTO public.moon VALUES (3, 'Hydra', 2005, 0.4, 9);
INSERT INTO public.moon VALUES (4, 'Kerberos', 2011, 5.3, 9);
INSERT INTO public.moon VALUES (5, 'Deimos', 1877, 1.3, 4);
INSERT INTO public.moon VALUES (6, 'Phobos', 1877, 0.3, 4);
INSERT INTO public.moon VALUES (7, 'Io', 1610, 1.8, 5);
INSERT INTO public.moon VALUES (8, 'Europa', 1610, 3.5, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 1655, 16.0, 6);
INSERT INTO public.moon VALUES (10, 'Atlas', 1980, 0.6, 6);
INSERT INTO public.moon VALUES (11, 'Epimetheus', 1966, 0.7, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 1787, 8.7, 7);
INSERT INTO public.moon VALUES (13, 'Cupid', 2003, 0.6, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1851, 4.1, 7);
INSERT INTO public.moon VALUES (15, 'Ophelia', 1986, 0.4, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 1846, 5.9, 8);
INSERT INTO public.moon VALUES (17, 'Hippocamp', 2013, 1.0, 8);
INSERT INTO public.moon VALUES (18, 'Sao', 2002, 2914.0, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 1978, 6.4, 9);
INSERT INTO public.moon VALUES (20, 'Nix', 2005, 24.9, 9);
INSERT INTO public.moon VALUES (21, 'Styx', 2012, 20.2, 9);
INSERT INTO public.moon VALUES (22, 'Ganymede', 1610, 7.2, 5);
INSERT INTO public.moon VALUES (23, 'Callisto', 1610, 17.0, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 'The smallest planet in our solar system and is only slightly larger than Earth''s Moon', 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 'The second planet from the Sun and is the hottest in our solar system', 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'The only world in our solar system with liquid water on the surface', 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'One of the easiest planets to spot in the night sky--it looks like a bright red point of light', 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 'Jupiter''s iconic Great Red Spot is a giant storm bigger than Earth that has raged for hundreds of years', 2, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 'The farthest planet from Earth discoverable by the unaided human eye', 2, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 'A very cold, windy planet surrounded by faint rings and more than two dozen small moons as it rotates at a nearly 90-degree angle from the plane of its orbit', 3, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 'The planet''s rich blue color comes from methane in its atmosphere, which absorbs red wavelengths of light, but allows blue ones to be reflected back into space', 3, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 'Was considered our ninth planet, but the International Astronomical Union reclassified Pluto as a dwarf planet in 2006', 4, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 'One of the largest dwarf planets that is the same size as Pluto but is three times farther from the Sun', 4, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', NULL, 'The largest object in the asteroid belt between Mars and Jupiter', 4, 1);
INSERT INTO public.planet VALUES (12, 'Spe', NULL, 'An exoplanet whose mass is 3.559 Jupiters', 2, 3);
INSERT INTO public.planet VALUES (13, 'Galileo', NULL, 'An exoplanet whose mass is 0.8306 Jupiters', 2, 6);
INSERT INTO public.planet VALUES (14, 'Janssen', NULL, 'An exoplanet whose molten surface is completely uninhabitable', 5, 6);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Planets with solid surfaces');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets mostly composed of helium and/or hydrogen');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Large planets mostly composed of oxygen, carbon, nitrogen, and sulfur');
INSERT INTO public.planet_type VALUES (4, 'Dwarf', 'Objects that orbit the Sun and are nearly round, but have not been able to clear their orbit of debris');
INSERT INTO public.planet_type VALUES (5, 'Super-Earth', 'Planets that are more massive than Earth yet lighter than ice giants and can be made of gas, rock, or a combination of both');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 1, NULL, 1);
INSERT INTO public.star VALUES (2, 'Mirach', true, 1, 3, 2);
INSERT INTO public.star VALUES (3, 'Veritate', true, 1, 3, 1);
INSERT INTO public.star VALUES (4, 'Sirius B', true, 1, 4, 3);
INSERT INTO public.star VALUES (5, 'Betelgeuse', true, 1, 1, 2);
INSERT INTO public.star VALUES (6, 'Copernicus', true, 1, 2, 1);
INSERT INTO public.star VALUES (7, 'Sirius A', true, 1, 4, 1);
INSERT INTO public.star VALUES (8, 'Gliese 710', true, 1, 5, 5);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Main Sequence', 'Any star that has a hot, dense core which fuses hydrogen into helium to produce energy');
INSERT INTO public.star_type VALUES (2, 'Red Giant', 'Created when a main sequence star less than eight times the Sun''s mass runs out of hydrogen in its core and starts to collapse');
INSERT INTO public.star_type VALUES (3, 'White Dwarf', 'The stellar remnant of a red giant that has shed all its atmosphere');
INSERT INTO public.star_type VALUES (4, 'Neutron', 'The stellar remnant that is formed when a main sequence star with between about eight and twenty times the Sun''s mass runs out of hydrogen');
INSERT INTO public.star_type VALUES (5, 'Red Dwarf', 'The smallest and coldest main sequence stars');
INSERT INTO public.star_type VALUES (6, 'Brown Dwarf', 'Brown dwarfs aren''t technically stars. They''re more massive than planets but not quite as massive as stars. They emit almost no visible light.');


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 6, true);


--
-- Name: constellations constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: planet_type uniquectm_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT uniquectm_const UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellations_id) REFERENCES public.constellations(constellations_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

