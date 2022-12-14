--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coords (
    id integer NOT NULL,
    latitude double precision NOT NULL,
    longtitude double precision NOT NULL,
    height bigint NOT NULL
);


ALTER TABLE public.coords OWNER TO postgres;

--
-- Name: coords_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coords_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coords_id_seq OWNER TO postgres;

--
-- Name: coords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coords_id_seq OWNED BY public.coords.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    name text,
    date_added bigint
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: pereval_added; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pereval_added (
    date_added timestamp without time zone,
    raw_data json,
    status text DEFAULT 'new'::text,
    beautytitle text,
    title text,
    other_titles text,
    connent text,
    add_time bigint,
    id integer NOT NULL,
    coord_id bigint,
    level_spring text,
    level_summer text,
    level_autumn text,
    level_winter text,
    CONSTRAINT pereval_added_status_check CHECK (((status = 'new'::text) OR (status = 'pending'::text) OR (status = 'accepted'::text) OR (status = 'rejected'::text)))
);


ALTER TABLE public.pereval_added OWNER TO postgres;

--
-- Name: pereval_added_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pereval_added_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pereval_added_id_seq OWNER TO postgres;

--
-- Name: pereval_added_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pereval_added_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pereval_added_id_seq1 OWNER TO postgres;

--
-- Name: pereval_added_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pereval_added_id_seq1 OWNED BY public.pereval_added.id;


--
-- Name: pereval_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pereval_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pereval_areas_id_seq OWNER TO postgres;

--
-- Name: pereval_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pereval_areas (
    id bigint DEFAULT nextval('public.pereval_areas_id_seq'::regclass) NOT NULL,
    id_parent bigint NOT NULL,
    title text
);


ALTER TABLE public.pereval_areas OWNER TO postgres;

--
-- Name: pereval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pereval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pereval_id_seq OWNER TO postgres;

--
-- Name: pereval_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pereval_images (
    id integer NOT NULL,
    pereval_id bigint,
    image_id bigint
);


ALTER TABLE public.pereval_images OWNER TO postgres;

--
-- Name: pereval_images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pereval_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pereval_images_id_seq OWNER TO postgres;

--
-- Name: pereval_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pereval_images_id_seq OWNED BY public.pereval_images.id;


--
-- Name: untitled_table_200_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.untitled_table_200_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.untitled_table_200_id_seq OWNER TO postgres;

--
-- Name: spr_activities_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spr_activities_types (
    id integer DEFAULT nextval('public.untitled_table_200_id_seq'::regclass) NOT NULL,
    title text
);


ALTER TABLE public.spr_activities_types OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: coords id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coords ALTER COLUMN id SET DEFAULT nextval('public.coords_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: pereval_added id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_added ALTER COLUMN id SET DEFAULT nextval('public.pereval_added_id_seq1'::regclass);


--
-- Name: pereval_images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_images ALTER COLUMN id SET DEFAULT nextval('public.pereval_images_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: coords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coords (id, latitude, longtitude, height) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, date_added) FROM stdin;
\.


--
-- Data for Name: pereval_added; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pereval_added (date_added, raw_data, status, beautytitle, title, other_titles, connent, add_time, id, coord_id, level_spring, level_summer, level_autumn, level_winter) FROM stdin;
\.


--
-- Data for Name: pereval_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pereval_areas (id, id_parent, title) FROM stdin;
0	0	?????????????? ??????????
1	0	????????????-????????
65	0	??????????
66	65	????????????-?????????????? ????????????
88	65	????????-?????????????? ????????????
92	65	?????????????????? ????????????
105	1	?????????????? ????????
106	1	???????????????????? ???????????? (?????????????? ???????????????? ???????????????? ??????????)
131	1	???????????????????? ???????????? ????????
133	1	???????????? ???????? ????????????, ?????????????????????????? ????????????
137	1	?????????????? ????????
147	1	??????????-???????? ?? ?????????????????? ????????
367	375	??????????????????
375	0	????????
384	0	??????????
386	65	???????????? ????????????????
387	65	???????????????????? ????????????
388	65	???????????? ????????????-??????????
389	65	???????????? ??????????-????????????
390	65	???????????? ???????????????? (????????????????)
391	65	?????????????????????? ????????????
392	65	???????????? ?????????? ??????????
393	65	???????????? ?????????????????????? ??????????
398	384	???????????????? ????????
399	384	?????????????????? ????????
402	384	?????????????????? ????????????
459	65	?????????????????? ????????????
\.


--
-- Data for Name: pereval_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pereval_images (id, pereval_id, image_id) FROM stdin;
\.


--
-- Data for Name: spr_activities_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spr_activities_types (id, title) FROM stdin;
1	????????????
2	????????
3	??????????????????
4	????????????????
5	????????
6	??????????
7	??????????????????
8	????????????????????
9	????????????????
10	??????????
11	????????????
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email) FROM stdin;
\.


--
-- Name: coords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coords_id_seq', 1, false);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- Name: pereval_added_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pereval_added_id_seq', 1, false);


--
-- Name: pereval_added_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pereval_added_id_seq1', 1, false);


--
-- Name: pereval_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pereval_areas_id_seq', 1, false);


--
-- Name: pereval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pereval_id_seq', 1, false);


--
-- Name: pereval_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pereval_images_id_seq', 1, false);


--
-- Name: untitled_table_200_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.untitled_table_200_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: coords coords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coords
    ADD CONSTRAINT coords_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: pereval_added pereval_added_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_added
    ADD CONSTRAINT pereval_added_pkey PRIMARY KEY (id);


--
-- Name: pereval_areas pereval_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_areas
    ADD CONSTRAINT pereval_areas_pkey PRIMARY KEY (id);


--
-- Name: pereval_images pereval_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_images
    ADD CONSTRAINT pereval_images_pkey PRIMARY KEY (id);


--
-- Name: spr_activities_types spr_activities_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spr_activities_types
    ADD CONSTRAINT spr_activities_types_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: pereval_added pereval_added_coord_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_added
    ADD CONSTRAINT pereval_added_coord_id_fkey FOREIGN KEY (coord_id) REFERENCES public.coords(id);


--
-- Name: pereval_images pereval_images_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_images
    ADD CONSTRAINT pereval_images_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.images(id);


--
-- Name: pereval_images pereval_images_pereval_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pereval_images
    ADD CONSTRAINT pereval_images_pereval_id_fkey FOREIGN KEY (pereval_id) REFERENCES public.pereval_added(id);


--
-- PostgreSQL database dump complete
--

