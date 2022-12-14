--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: projects; Type: TABLE; Schema: public; Owner: kaikohlsdorf
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO kaikohlsdorf;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: kaikohlsdorf
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO kaikohlsdorf;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kaikohlsdorf
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: kaikohlsdorf
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO kaikohlsdorf;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: kaikohlsdorf
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO kaikohlsdorf;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kaikohlsdorf
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: kaikohlsdorf
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: kaikohlsdorf
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: kaikohlsdorf
--

COPY public.projects (id, title) FROM stdin;
4	
5	
6	
7	jjj
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: kaikohlsdorf
--

COPY public.volunteers (id, name, project_id) FROM stdin;
1		2
14	ddd	7
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kaikohlsdorf
--

SELECT pg_catalog.setval('public.projects_id_seq', 7, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kaikohlsdorf
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 14, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: kaikohlsdorf
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: kaikohlsdorf
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

