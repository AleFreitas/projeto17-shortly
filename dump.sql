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


--
-- Data for Name: ShortenedUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ShortenedUrls" VALUES (4, 'http://sad', 0, 'hOGC5DfW7jikvdEFLr2Ln', 4, '2023-02-27 15:47:22.348411');
INSERT INTO public."ShortenedUrls" VALUES (3, 'https://pt.stackoverflow.com/questions/173221/como-checar-se-uma-string-est%C3%A1-vazia-em-javascript', 4, 'Ki_L2B88hlLGIaGDOqivg', 4, '2023-02-27 15:46:23.045108');


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Users" VALUES (4, 'João', 'joao@driven.com.br', '$2b$10$YqIuuc3xHZ1L4vvVHBk5IuS8VDM5BuNs3FC3Y73Cn6BbkfLzGH3NC', 4, '2023-02-26 14:09:44.749739');


--
-- Name: Sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Sessions_id_seq"', 8, true);


--
-- Name: ShortenedUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ShortenedUrls_id_seq"', 4, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_id_seq"', 4, true);


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

