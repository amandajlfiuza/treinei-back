--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    state_uf character varying(2) NOT NULL
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: gyms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gyms (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    street character varying(250) NOT NULL,
    number integer NOT NULL,
    city_id integer NOT NULL
);


--
-- Name: gyms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gyms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gyms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gyms_id_seq OWNED BY public.gyms.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    uf character varying(2) NOT NULL
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: training_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.training_types (
    id integer NOT NULL,
    trained_muscle_groups text[] NOT NULL,
    exercises text[] NOT NULL
);


--
-- Name: training_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.training_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: training_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.training_types_id_seq OWNED BY public.training_types.id;


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trainings (
    id integer NOT NULL,
    start_timestamp timestamp without time zone NOT NULL,
    end_timestamp timestamp without time zone DEFAULT now() NOT NULL,
    type_id integer NOT NULL,
    did_all_the_exercises boolean NOT NULL,
    gym_name character varying(50) NOT NULL
);


--
-- Name: trainings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trainings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trainings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trainings_id_seq OWNED BY public.trainings.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: gyms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gyms ALTER COLUMN id SET DEFAULT nextval('public.gyms_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: training_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_types ALTER COLUMN id SET DEFAULT nextval('public.training_types_id_seq'::regclass);


--
-- Name: trainings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings ALTER COLUMN id SET DEFAULT nextval('public.trainings_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities VALUES (1, 'Rio Branco', 'AC');
INSERT INTO public.cities VALUES (2, 'Maceió', 'AL');
INSERT INTO public.cities VALUES (3, 'Macapá', 'AP');
INSERT INTO public.cities VALUES (4, 'Manaus', 'AM');
INSERT INTO public.cities VALUES (5, 'Salvador', 'BA');
INSERT INTO public.cities VALUES (6, 'Fortaleza', 'CE');
INSERT INTO public.cities VALUES (7, 'Brasília', 'DF');
INSERT INTO public.cities VALUES (8, 'Vitória', 'ES');
INSERT INTO public.cities VALUES (9, 'Goiânia', 'GO');
INSERT INTO public.cities VALUES (10, 'São Luís', 'MA');
INSERT INTO public.cities VALUES (11, 'Cuiabá', 'MT');
INSERT INTO public.cities VALUES (12, 'Campo Grande', 'MS');
INSERT INTO public.cities VALUES (13, 'Belo Horizonte', 'MG');
INSERT INTO public.cities VALUES (14, 'Belém', 'PA');
INSERT INTO public.cities VALUES (15, 'João Pessoa', 'PB');
INSERT INTO public.cities VALUES (16, 'Curitiba', 'PR');
INSERT INTO public.cities VALUES (17, 'Recife', 'PE');
INSERT INTO public.cities VALUES (18, 'Teresina', 'PI');
INSERT INTO public.cities VALUES (19, 'Rio de Janeiro', 'RJ');
INSERT INTO public.cities VALUES (20, 'Natal', 'RN');
INSERT INTO public.cities VALUES (21, 'Porto Alegre', 'RS');
INSERT INTO public.cities VALUES (22, 'Porto Velho', 'RO');
INSERT INTO public.cities VALUES (23, 'Boa Vista', 'RR');
INSERT INTO public.cities VALUES (24, 'Florianópolis', 'SC');
INSERT INTO public.cities VALUES (25, 'São Paulo', 'SP');
INSERT INTO public.cities VALUES (26, 'Aracaju', 'SE');
INSERT INTO public.cities VALUES (27, 'Palmas', 'TO');


--
-- Data for Name: gyms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.gyms VALUES (1, 'Augusta', 'Rua Augusta', 1585, 25);
INSERT INTO public.gyms VALUES (2, 'Pátio Belém', 'Tv. Padre Eutiquio', 1078, 14);
INSERT INTO public.gyms VALUES (3, 'Candelária', 'Rodovia BR-101', 0, 20);


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states VALUES (1, 'Acre', 'AC');
INSERT INTO public.states VALUES (2, 'Alagoas', 'AL');
INSERT INTO public.states VALUES (3, 'Amapá', 'AP');
INSERT INTO public.states VALUES (4, 'Amazonas', 'AM');
INSERT INTO public.states VALUES (5, 'Bahia', 'BA');
INSERT INTO public.states VALUES (6, 'Ceará', 'CE');
INSERT INTO public.states VALUES (7, 'Distrito Federal', 'DF');
INSERT INTO public.states VALUES (8, 'Espírito Santo', 'ES');
INSERT INTO public.states VALUES (9, 'Goiás', 'GO');
INSERT INTO public.states VALUES (10, 'Maranhão', 'MA');
INSERT INTO public.states VALUES (11, 'Mato Grosso', 'MT');
INSERT INTO public.states VALUES (12, 'Mato Grosso do Sul', 'MS');
INSERT INTO public.states VALUES (13, 'Minas Gerais', 'MG');
INSERT INTO public.states VALUES (14, 'Pará', 'PA');
INSERT INTO public.states VALUES (15, 'Paraíba', 'PB');
INSERT INTO public.states VALUES (16, 'Paraná', 'PR');
INSERT INTO public.states VALUES (17, 'Pernambuco', 'PE');
INSERT INTO public.states VALUES (18, 'Piauí', 'PI');
INSERT INTO public.states VALUES (19, 'Rio de Janeiro', 'RJ');
INSERT INTO public.states VALUES (20, 'Rio Grande do Norte', 'RN');
INSERT INTO public.states VALUES (21, 'Rio Grande do Sul', 'RS');
INSERT INTO public.states VALUES (22, 'Rondônia', 'RO');
INSERT INTO public.states VALUES (23, 'Roraima', 'RR');
INSERT INTO public.states VALUES (24, 'Santa Catarina', 'SC');
INSERT INTO public.states VALUES (25, 'São Paulo', 'SP');
INSERT INTO public.states VALUES (26, 'Sergipe', 'SE');
INSERT INTO public.states VALUES (27, 'Tocantins', 'TO');


--
-- Data for Name: training_types; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: trainings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 27, true);


--
-- Name: gyms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.gyms_id_seq', 3, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 27, true);


--
-- Name: training_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.training_types_id_seq', 1, false);


--
-- Name: trainings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trainings_id_seq', 1, false);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: gyms gyms_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gyms
    ADD CONSTRAINT gyms_name_key UNIQUE (name);


--
-- Name: gyms gyms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gyms
    ADD CONSTRAINT gyms_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: states states_uf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_uf_key UNIQUE (uf);


--
-- Name: training_types training_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.training_types
    ADD CONSTRAINT training_types_pkey PRIMARY KEY (id);


--
-- Name: trainings trainings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_pkey PRIMARY KEY (id);


--
-- Name: cities cities_state_uf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_uf_fkey FOREIGN KEY (state_uf) REFERENCES public.states(uf);


--
-- Name: gyms gyms_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gyms
    ADD CONSTRAINT gyms_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: trainings trainings_gym_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_gym_name_fkey FOREIGN KEY (gym_name) REFERENCES public.gyms(name);


--
-- Name: trainings trainings_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trainings
    ADD CONSTRAINT trainings_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.training_types(id);


--
-- PostgreSQL database dump complete
--

