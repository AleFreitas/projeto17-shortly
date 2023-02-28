--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-1.pgdg20.04+1)

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
-- Name: Sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Sessions" (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- Name: Sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Sessions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Sessions_id_seq" OWNED BY public."Sessions".id;


--
-- Name: ShortenedUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ShortenedUrls" (
    id integer NOT NULL,
    url text NOT NULL,
    "visitCount" integer NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- Name: ShortenedUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ShortenedUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ShortenedUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ShortenedUrls_id_seq" OWNED BY public."ShortenedUrls".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL,
    "visitCount" integer NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sessions" ALTER COLUMN id SET DEFAULT nextval('public."Sessions_id_seq"'::regclass);


--
-- Name: ShortenedUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ShortenedUrls" ALTER COLUMN id SET DEFAULT nextval('public."ShortenedUrls_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Sessions" VALUES (8, 'de4bddaf-648b-4168-9aae-f644614104e6', 4, '2023-02-27 15:04:16.022729');
INSERT INTO public."Sessions" VALUES (9, '1f735cca-77a0-482f-aee5-5fd561d1206f', 5, '2023-02-28 11:43:37.884215');


--
-- Data for Name: ShortenedUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ShortenedUrls" VALUES (4, 'http://sad', 0, 'hOGC5DfW7jikvdEFLr2Ln', 4, '2023-02-27 15:47:22.348411');
INSERT INTO public."ShortenedUrls" VALUES (3, 'https://pt.stackoverflow.com/questions/173221/como-checar-se-uma-string-est%C3%A1-vazia-em-javascript', 4, 'Ki_L2B88hlLGIaGDOqivg', 4, '2023-02-27 15:46:23.045108');
INSERT INTO public."ShortenedUrls" VALUES (5, 'http://sad', 0, 'sJbIaQeNkCHIRNkO5Ly6i', 5, '2023-02-28 11:44:00.212683');
INSERT INTO public."ShortenedUrls" VALUES (6, 'http://sad', 0, 'JWLZxTYjTXuiYkXR9AgTg', 5, '2023-02-28 11:44:04.959561');
INSERT INTO public."ShortenedUrls" VALUES (7, 'http://sad', 0, '_SbPaRcnY7cHiQ-mZopKd', 5, '2023-02-28 11:44:05.762683');
INSERT INTO public."ShortenedUrls" VALUES (8, 'http://sad', 0, 'AXgVwUB55keDtsmfmvUcd', 5, '2023-02-28 11:44:06.611143');
INSERT INTO public."ShortenedUrls" VALUES (9, 'http://sad', 0, 'GQNQHimrdy47c3oGCSwqW', 5, '2023-02-28 11:44:07.294448');
INSERT INTO public."ShortenedUrls" VALUES (10, 'http://sad', 0, 'WibGKG2H_qQD-ZWoIGvLv', 5, '2023-02-28 11:44:08.117701');
INSERT INTO public."ShortenedUrls" VALUES (11, 'http://sad', 0, 'NsMPbgk5JApC2PkhGtmQe', 5, '2023-02-28 11:44:08.300067');
INSERT INTO public."ShortenedUrls" VALUES (12, 'http://sad', 0, 'LULsErDj5CuK9t9TnFLDH', 5, '2023-02-28 11:44:13.941737');
INSERT INTO public."ShortenedUrls" VALUES (13, 'http://sad', 18, 'L7f5MU9JI-dC7uU1zq-Oq', 5, '2023-02-28 11:44:14.115395');


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Users" VALUES (4, 'João', 'joao@driven.com.br', '$2b$10$YqIuuc3xHZ1L4vvVHBk5IuS8VDM5BuNs3FC3Y73Cn6BbkfLzGH3NC', 4, '2023-02-26 14:09:44.749739');
INSERT INTO public."Users" VALUES (5, 'Alex', 'alex@driven.com.br', '$2b$10$.IjMWMciEGfDb2.rJCcS1O5h7tjy9jyXRzLUScieIgMYXmv4FjTTG', 18, '2023-02-28 11:43:27.178228');
INSERT INTO public."Users" VALUES (6, 'Beto', 'beto@driven.com.br', '$2b$10$EoqBHVHOOhYiGv.8QEZa.OEv/MoLClpMQZIr2sEHlfHSJEfiOGQ/C', 0, '2023-02-28 11:55:23.715169');
INSERT INTO public."Users" VALUES (7, 'user1', 'user1@driven.com.br', '$2b$10$egdZ/2o7mff30PNJ8YsW.eaB/9Vhs9582LVi9FiZLsEYOpp4bVRcG', 0, '2023-02-28 12:06:10.107138');
INSERT INTO public."Users" VALUES (8, 'user2', 'user2@driven.com.br', '$2b$10$C1JXGjQtE/4MeV0a6fuXx.wwXl8aAFi9N0U.I93CpgOLAHJORKpDO', 0, '2023-02-28 12:06:14.079718');
INSERT INTO public."Users" VALUES (9, 'user3', 'user3@driven.com.br', '$2b$10$WhmjWRijREfA2/ZKeHXGlOIxkifM8IAFlbdn8d75/h9Mn/qdoCs0K', 0, '2023-02-28 12:06:19.075165');
INSERT INTO public."Users" VALUES (10, 'user4', 'user4@driven.com.br', '$2b$10$YQ2PC743YKzpTT9WsVSj7.yDwJ61dJBi/.H.t5s8foMPLcDiG9oi2', 0, '2023-02-28 12:06:23.335453');
INSERT INTO public."Users" VALUES (11, 'user5', 'user5@driven.com.br', '$2b$10$fVnQ.fvHMvsACg5rF6.GTO08tFCh0AlIj2WuL.l9bqhrwK/gdrqN6', 0, '2023-02-28 12:06:27.276609');
INSERT INTO public."Users" VALUES (12, 'user6', 'user6@driven.com.br', '$2b$10$KT6PL8sjZYPmScRbPK75TOCu8O86ySBv1DwYF0onaZA/BSZrAhEPG', 0, '2023-02-28 12:06:31.898954');
INSERT INTO public."Users" VALUES (13, 'user7', 'user7@driven.com.br', '$2b$10$ZNV91g0zd1PoyUIvbwDvXeNSED438Dq3arcSjAy5e3IhZXYOj5Vc2', 0, '2023-02-28 12:06:35.62949');
INSERT INTO public."Users" VALUES (14, 'user8', 'user8@driven.com.br', '$2b$10$i2f5g6CstG61v/5GpRqshOwJsf0ihoY.WfhxM.VViBTuTbDHxAF.G', 0, '2023-02-28 12:06:39.211833');
INSERT INTO public."Users" VALUES (15, 'user9', 'user9@driven.com.br', '$2b$10$gwne1ahpdqxmEnaP9S4mUuenKIFOqkKu6NKgHs11EDdWTkB/hKCxi', 0, '2023-02-28 12:06:43.589801');
INSERT INTO public."Users" VALUES (16, 'user10', 'user10@driven.com.br', '$2b$10$xNzVIUtmDX3JUqt3AhL6XOh.HbluEvaoXiXZp4t72I/L0a4uY.Z0q', 0, '2023-02-28 12:06:48.793125');
INSERT INTO public."Users" VALUES (17, 'user11', 'user11@driven.com.br', '$2b$10$Co6/8a/tjJ/UlDWwPy24me1FzoxHoQZpNKJrzc0fbUYuBHnwJ1iMi', 0, '2023-02-28 12:06:52.540728');


--
-- Name: Sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Sessions_id_seq"', 9, true);


--
-- Name: ShortenedUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ShortenedUrls_id_seq"', 13, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_id_seq"', 17, true);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (id);


--
-- Name: Sessions Sessions_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_userId_key" UNIQUE ("userId");


--
-- Name: ShortenedUrls ShortenedUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ShortenedUrls"
    ADD CONSTRAINT "ShortenedUrls_pkey" PRIMARY KEY (id);


--
-- Name: ShortenedUrls ShortenedUrls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ShortenedUrls"
    ADD CONSTRAINT "ShortenedUrls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Sessions Sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id);


--
-- Name: ShortenedUrls ShortenedUrls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ShortenedUrls"
    ADD CONSTRAINT "ShortenedUrls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id);


--
-- PostgreSQL database dump complete
--

