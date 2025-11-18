--
-- PostgreSQL database dump
--

\restrict UAPZkIc3cuH8keZjF4zqaUotuTEfGQitgxmJx01aARHpLwqeTJTC386zSiIk7Kq

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: hr_user
--

CREATE TABLE public.employees (
    employee_id character varying(64) NOT NULL,
    full_name text,
    email public.citext NOT NULL
);


ALTER TABLE public.employees OWNER TO hr_user;

--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: hr_user
--

COPY public.employees (employee_id, full_name, email) FROM stdin;
E1002	Harshitha Attanti	harshitha.attanti1@gmail.com
E1001	Manohar Korikana	korikanamanohar2@gmail.com
E1003	Manohar K	korikanamanohar6@gmail.com
\.


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: hr_user
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: hr_user
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- PostgreSQL database dump complete
--

\unrestrict UAPZkIc3cuH8keZjF4zqaUotuTEfGQitgxmJx01aARHpLwqeTJTC386zSiIk7Kq

