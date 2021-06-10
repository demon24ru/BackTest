--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(255),
    short_name character varying(255),
    business_entity character varying(255),
    contract jsonb,
    type character varying(255)[],
    status character varying(255),
    photos jsonb,
    address character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    patronymic character varying(255),
    phone character varying(255),
    email character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255),
    password character varying(255),
    salt character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
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
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, contact_id, name, short_name, business_entity, contract, type, status, photos, address, created_at, updated_at) FROM stdin;
14	7	ООО Фирма «Номер 14»	Номер 14	ООО	{"no": "no 14", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["67f84697.png"]	Адрес 14	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
15	7	ООО Фирма «Номер 15»	Номер 15	ООО	{"no": "no 15", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["a21eff35.png"]	Адрес 15	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
16	8	ООО Фирма «Номер 16»	Номер 16	ООО	{"no": "no 16", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["1de29f9d.png"]	Адрес 16	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
17	8	ООО Фирма «Номер 17»	Номер 17	ООО	{"no": "no 17", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["f57355c1.png"]	Адрес 17	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
18	9	ООО Фирма «Номер 18»	Номер 18	ООО	{"no": "no 18", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["9c0589d4.png"]	Адрес 18	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
1	1	ООО Фирма «Номер 1»	Номер 1	ООО	{"no": "no 1", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["629d7394.png"]	Адрес 1	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
2	1	ООО Фирма «Номер 2»	Номер 2	ООО	{"no": "no 2", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["26ccd82a.png"]	Адрес 2	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
3	1	ООО Фирма «Номер 3»	Номер 3	ООО	{"no": "no 3", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["f9ae32db.png"]	Адрес 3	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
4	2	ООО Фирма «Номер 4»	Номер 4	ООО	{"no": "no 4", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["715df442.png"]	Адрес 4	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
5	2	ООО Фирма «Номер 5»	Номер 5	ООО	{"no": "no 5", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["99d4ebbc.png"]	Адрес 5	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
6	3	ООО Фирма «Номер 6»	Номер 6	ООО	{"no": "no 6", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["1aa05b70.png"]	Адрес 6	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
7	3	ООО Фирма «Номер 7»	Номер 7	ООО	{"no": "no 7", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["fb01c8e0.png"]	Адрес 7	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
8	4	ООО Фирма «Номер 8»	Номер 8	ООО	{"no": "no 8", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["02dd7f8f.png"]	Адрес 8	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
9	4	ООО Фирма «Номер 9»	Номер 9	ООО	{"no": "no 9", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["1cc0be62.png"]	Адрес 9	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
10	5	ООО Фирма «Номер 10»	Номер 10	ООО	{"no": "no 10", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["a242c9f7.png"]	Адрес 10	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
11	5	ООО Фирма «Номер 11»	Номер 11	ООО	{"no": "no 11", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["a20dd75c.png"]	Адрес 11	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
12	6	ООО Фирма «Номер 12»	Номер 12	ООО	{"no": "no 12", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["75b28399.png"]	Адрес 12	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
13	6	ООО Фирма «Номер 13»	Номер 13	ООО	{"no": "no 13", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["65915767.png"]	Адрес 13	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
19	9	ООО Фирма «Номер 19»	Номер 19	ООО	{"no": "no 19", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["9825c277.png"]	Адрес 19	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
20	10	ООО Фирма «Номер 20»	Номер 20	ООО	{"no": "no 20", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["dfa640bf.png"]	Адрес 20	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
21	10	ООО Фирма «Номер 21»	Номер 21	ООО	{"no": "no 21", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["693e6b67.png"]	Адрес 21	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
22	11	ООО Фирма «Номер 22»	Номер 22	ООО	{"no": "no 22", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["b58d91ca.png"]	Адрес 22	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
23	11	ООО Фирма «Номер 23»	Номер 23	ООО	{"no": "no 23", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["444efc46.png"]	Адрес 23	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
24	12	ООО Фирма «Номер 24»	Номер 24	ООО	{"no": "no 24", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["b0c0e110.png"]	Адрес 24	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
25	12	ООО Фирма «Номер 25»	Номер 25	ООО	{"no": "no 25", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["1aab1c4b.png"]	Адрес 25	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
26	13	ООО Фирма «Номер 26»	Номер 26	ООО	{"no": "no 26", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["3d47d09c.png"]	Адрес 26	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
27	13	ООО Фирма «Номер 27»	Номер 27	ООО	{"no": "no 27", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["040efe5b.png"]	Адрес 27	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
28	14	ООО Фирма «Номер 28»	Номер 28	ООО	{"no": "no 28", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["93a4db1e.png"]	Адрес 28	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
29	14	ООО Фирма «Номер 29»	Номер 29	ООО	{"no": "no 29", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["bc92c0dd.png"]	Адрес 29	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
30	15	ООО Фирма «Номер 30»	Номер 30	ООО	{"no": "no 30", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["4f3ca5ad.png"]	Адрес 30	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
31	15	ООО Фирма «Номер 31»	Номер 31	ООО	{"no": "no 31", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["b613f328.png"]	Адрес 31	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
32	16	ООО Фирма «Номер 32»	Номер 32	ООО	{"no": "no 32", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["363be6bf.png"]	Адрес 32	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
33	16	ООО Фирма «Номер 33»	Номер 33	ООО	{"no": "no 33", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["2711d858.png"]	Адрес 33	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
34	17	ООО Фирма «Номер 34»	Номер 34	ООО	{"no": "no 34", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["25a2b47a.png"]	Адрес 34	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
35	17	ООО Фирма «Номер 35»	Номер 35	ООО	{"no": "no 35", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["a3722e0c.png"]	Адрес 35	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
36	18	ООО Фирма «Номер 36»	Номер 36	ООО	{"no": "no 36", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["1f2edbf1.png"]	Адрес 36	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
37	18	ООО Фирма «Номер 37»	Номер 37	ООО	{"no": "no 37", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["e63befde.png"]	Адрес 37	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
38	19	ООО Фирма «Номер 38»	Номер 38	ООО	{"no": "no 38", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["3def3c47.png"]	Адрес 38	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
39	19	ООО Фирма «Номер 39»	Номер 39	ООО	{"no": "no 39", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["3be5708e.png"]	Адрес 39	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
40	20	ООО Фирма «Номер 40»	Номер 40	ООО	{"no": "no 40", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["0cc2f7f9.png"]	Адрес 40	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
41	20	ООО Фирма «Номер 41»	Номер 41	ООО	{"no": "no 41", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["cd301212.png"]	Адрес 41	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
42	21	ООО Фирма «Номер 42»	Номер 42	ООО	{"no": "no 42", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["4154449a.png"]	Адрес 42	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
43	21	ООО Фирма «Номер 43»	Номер 43	ООО	{"no": "no 43", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["caf36318.png"]	Адрес 43	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
44	22	ООО Фирма «Номер 44»	Номер 44	ООО	{"no": "no 44", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["949de482.png"]	Адрес 44	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
45	22	ООО Фирма «Номер 45»	Номер 45	ООО	{"no": "no 45", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["4b20324a.png"]	Адрес 45	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
46	23	ООО Фирма «Номер 46»	Номер 46	ООО	{"no": "no 46", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["b380799f.png"]	Адрес 46	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
47	23	ООО Фирма «Номер 47»	Номер 47	ООО	{"no": "no 47", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["a0c340e0.png"]	Адрес 47	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
48	24	ООО Фирма «Номер 48»	Номер 48	ООО	{"no": "no 48", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["d04f8344.png"]	Адрес 48	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
49	24	ООО Фирма «Номер 49»	Номер 49	ООО	{"no": "no 49", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["15f2ddc1.png"]	Адрес 49	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
50	25	ООО Фирма «Номер 50»	Номер 50	ООО	{"no": "no 50", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["c31d8d78.png"]	Адрес 50	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
51	25	ООО Фирма «Номер 51»	Номер 51	ООО	{"no": "no 51", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["1b3b91d6.png"]	Адрес 51	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
52	26	ООО Фирма «Номер 52»	Номер 52	ООО	{"no": "no 52", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["c266e448.png"]	Адрес 52	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
53	26	ООО Фирма «Номер 53»	Номер 53	ООО	{"no": "no 53", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["e14bf41e.png"]	Адрес 53	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
54	27	ООО Фирма «Номер 54»	Номер 54	ООО	{"no": "no 54", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["bb790a65.png"]	Адрес 54	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
55	27	ООО Фирма «Номер 55»	Номер 55	ООО	{"no": "no 55", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["d1c8425b.png"]	Адрес 55	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
56	28	ООО Фирма «Номер 56»	Номер 56	ООО	{"no": "no 56", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["ca82971b.png"]	Адрес 56	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
57	28	ООО Фирма «Номер 57»	Номер 57	ООО	{"no": "no 57", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["0d4fb5d3.png"]	Адрес 57	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
58	29	ООО Фирма «Номер 58»	Номер 58	ООО	{"no": "no 58", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["ef41a419.png"]	Адрес 58	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
59	29	ООО Фирма «Номер 59»	Номер 59	ООО	{"no": "no 59", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["12e03213.png"]	Адрес 59	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
60	30	ООО Фирма «Номер 60»	Номер 60	ООО	{"no": "no 60", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["7140f183.png"]	Адрес 60	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
61	30	ООО Фирма «Номер 61»	Номер 61	ООО	{"no": "no 61", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["ff6371f4.png"]	Адрес 61	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
62	31	ООО Фирма «Номер 62»	Номер 62	ООО	{"no": "no 62", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["fab3cf34.png"]	Адрес 62	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
63	31	ООО Фирма «Номер 63»	Номер 63	ООО	{"no": "no 63", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["d2bb0bbd.png"]	Адрес 63	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
64	32	ООО Фирма «Номер 64»	Номер 64	ООО	{"no": "no 64", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["d4f99ebb.png"]	Адрес 64	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
65	32	ООО Фирма «Номер 65»	Номер 65	ООО	{"no": "no 65", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["53c9aa15.png"]	Адрес 65	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
66	33	ООО Фирма «Номер 66»	Номер 66	ООО	{"no": "no 66", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["79a27722.png"]	Адрес 66	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
67	33	ООО Фирма «Номер 67»	Номер 67	ООО	{"no": "no 67", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["da3600e7.png"]	Адрес 67	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
68	34	ООО Фирма «Номер 68»	Номер 68	ООО	{"no": "no 68", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["bd258e6b.png"]	Адрес 68	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
69	34	ООО Фирма «Номер 69»	Номер 69	ООО	{"no": "no 69", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["963b1270.png"]	Адрес 69	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
70	35	ООО Фирма «Номер 70»	Номер 70	ООО	{"no": "no 70", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["e0be9e39.png"]	Адрес 70	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
71	35	ООО Фирма «Номер 71»	Номер 71	ООО	{"no": "no 71", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["d6aefe7e.png"]	Адрес 71	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
72	36	ООО Фирма «Номер 72»	Номер 72	ООО	{"no": "no 72", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["1d1568e3.png"]	Адрес 72	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
73	36	ООО Фирма «Номер 73»	Номер 73	ООО	{"no": "no 73", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["89712d4e.png"]	Адрес 73	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
74	37	ООО Фирма «Номер 74»	Номер 74	ООО	{"no": "no 74", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["dbcc3ad7.png"]	Адрес 74	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
75	37	ООО Фирма «Номер 75»	Номер 75	ООО	{"no": "no 75", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["b551a126.png"]	Адрес 75	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
76	38	ООО Фирма «Номер 76»	Номер 76	ООО	{"no": "no 76", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["3bf0121a.png"]	Адрес 76	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
77	38	ООО Фирма «Номер 77»	Номер 77	ООО	{"no": "no 77", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["6bacc688.png"]	Адрес 77	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
78	39	ООО Фирма «Номер 78»	Номер 78	ООО	{"no": "no 78", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["ed03dce6.png"]	Адрес 78	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
79	39	ООО Фирма «Номер 79»	Номер 79	ООО	{"no": "no 79", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["c649e5fc.png"]	Адрес 79	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
80	40	ООО Фирма «Номер 80»	Номер 80	ООО	{"no": "no 80", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["fa884c4a.png"]	Адрес 80	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
81	40	ООО Фирма «Номер 81»	Номер 81	ООО	{"no": "no 81", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["d53d802f.png"]	Адрес 81	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
82	41	ООО Фирма «Номер 82»	Номер 82	ООО	{"no": "no 82", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["34a175c1.png"]	Адрес 82	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
83	41	ООО Фирма «Номер 83»	Номер 83	ООО	{"no": "no 83", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["d267b883.png"]	Адрес 83	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
84	42	ООО Фирма «Номер 84»	Номер 84	ООО	{"no": "no 84", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["98fa00fb.png"]	Адрес 84	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
85	42	ООО Фирма «Номер 85»	Номер 85	ООО	{"no": "no 85", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["ac122f90.png"]	Адрес 85	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
86	43	ООО Фирма «Номер 86»	Номер 86	ООО	{"no": "no 86", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["938bb617.png"]	Адрес 86	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
87	43	ООО Фирма «Номер 87»	Номер 87	ООО	{"no": "no 87", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["968f8042.png"]	Адрес 87	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
88	44	ООО Фирма «Номер 88»	Номер 88	ООО	{"no": "no 88", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["372bc69e.png"]	Адрес 88	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
89	44	ООО Фирма «Номер 89»	Номер 89	ООО	{"no": "no 89", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["85410b95.png"]	Адрес 89	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
90	45	ООО Фирма «Номер 90»	Номер 90	ООО	{"no": "no 90", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["1eddfd03.png"]	Адрес 90	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
91	45	ООО Фирма «Номер 91»	Номер 91	ООО	{"no": "no 91", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["a673f70a.png"]	Адрес 91	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
92	46	ООО Фирма «Номер 92»	Номер 92	ООО	{"no": "no 92", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["ca68aba1.png"]	Адрес 92	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
93	46	ООО Фирма «Номер 93»	Номер 93	ООО	{"no": "no 93", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["7dd59d63.png"]	Адрес 93	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
94	47	ООО Фирма «Номер 94»	Номер 94	ООО	{"no": "no 94", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["86b0d077.png"]	Адрес 94	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
95	47	ООО Фирма «Номер 95»	Номер 95	ООО	{"no": "no 95", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["5328cccb.png"]	Адрес 95	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
96	48	ООО Фирма «Номер 96»	Номер 96	ООО	{"no": "no 96", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["c5366a84.png"]	Адрес 96	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
97	48	ООО Фирма «Номер 97»	Номер 97	ООО	{"no": "no 97", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["b3dd0b36.png"]	Адрес 97	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
98	49	ООО Фирма «Номер 98»	Номер 98	ООО	{"no": "no 98", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	active	["e3c72655.png"]	Адрес 98	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
99	49	ООО Фирма «Номер 99»	Номер 99	ООО	{"no": "no 99", "issue_date": "2021-06-10T10:18:33.798Z"}	{agent,contractor}	inactive	["8b3c6a04.png"]	Адрес 99	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, first_name, last_name, patronymic, phone, email, created_at, updated_at) FROM stdin;
1	Фамилия1	Имя1	Отчество1	71	ru1@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
2	Фамилия2	Имя2	Отчество2	72	ru2@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
3	Фамилия3	Имя3	Отчество3	73	ru3@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
4	Фамилия4	Имя4	Отчество4	74	ru4@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
5	Фамилия5	Имя5	Отчество5	75	ru5@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
6	Фамилия6	Имя6	Отчество6	76	ru6@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
7	Фамилия7	Имя7	Отчество7	77	ru7@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
8	Фамилия8	Имя8	Отчество8	78	ru8@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
9	Фамилия9	Имя9	Отчество9	79	ru9@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
10	Фамилия10	Имя10	Отчество10	710	ru10@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
11	Фамилия11	Имя11	Отчество11	711	ru11@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
12	Фамилия12	Имя12	Отчество12	712	ru12@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
13	Фамилия13	Имя13	Отчество13	713	ru13@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
14	Фамилия14	Имя14	Отчество14	714	ru14@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
15	Фамилия15	Имя15	Отчество15	715	ru15@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
16	Фамилия16	Имя16	Отчество16	716	ru16@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
17	Фамилия17	Имя17	Отчество17	717	ru17@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
18	Фамилия18	Имя18	Отчество18	718	ru18@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
19	Фамилия19	Имя19	Отчество19	719	ru19@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
20	Фамилия20	Имя20	Отчество20	720	ru20@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
21	Фамилия21	Имя21	Отчество21	721	ru21@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
22	Фамилия22	Имя22	Отчество22	722	ru22@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
23	Фамилия23	Имя23	Отчество23	723	ru23@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
24	Фамилия24	Имя24	Отчество24	724	ru24@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
25	Фамилия25	Имя25	Отчество25	725	ru25@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
26	Фамилия26	Имя26	Отчество26	726	ru26@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
27	Фамилия27	Имя27	Отчество27	727	ru27@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
28	Фамилия28	Имя28	Отчество28	728	ru28@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
29	Фамилия29	Имя29	Отчество29	729	ru29@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
30	Фамилия30	Имя30	Отчество30	730	ru30@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
31	Фамилия31	Имя31	Отчество31	731	ru31@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
32	Фамилия32	Имя32	Отчество32	732	ru32@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
33	Фамилия33	Имя33	Отчество33	733	ru33@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
34	Фамилия34	Имя34	Отчество34	734	ru34@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
35	Фамилия35	Имя35	Отчество35	735	ru35@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
36	Фамилия36	Имя36	Отчество36	736	ru36@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
37	Фамилия37	Имя37	Отчество37	737	ru37@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
38	Фамилия38	Имя38	Отчество38	738	ru38@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
39	Фамилия39	Имя39	Отчество39	739	ru39@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
40	Фамилия40	Имя40	Отчество40	740	ru40@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
41	Фамилия41	Имя41	Отчество41	741	ru41@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
42	Фамилия42	Имя42	Отчество42	742	ru42@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
43	Фамилия43	Имя43	Отчество43	743	ru43@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
44	Фамилия44	Имя44	Отчество44	744	ru44@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
45	Фамилия45	Имя45	Отчество45	745	ru45@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
46	Фамилия46	Имя46	Отчество46	746	ru46@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
47	Фамилия47	Имя47	Отчество47	747	ru47@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
48	Фамилия48	Имя48	Отчество48	748	ru48@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
49	Фамилия49	Имя49	Отчество49	749	ru49@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
50	Фамилия50	Имя50	Отчество50	750	ru50@ru.ru	2021-06-10 17:18:33.798+07	2021-06-10 17:18:33.798+07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, password, salt, created_at, updated_at) FROM stdin;
1	User1	9492f246eea487c4243c19b1e122fe32f955e370b6df949253c5ee7e5bc2ec47	1e969a59	2021-06-10 17:18:33.787+07	2021-06-10 17:18:33.787+07
2	User2	be5026ecb969382dd398b8a4053b5908b91e7f37e63d8204c3147951472ab8ae	e5807883	2021-06-10 17:18:33.787+07	2021-06-10 17:18:33.787+07
3	User3	e9e6941a962be813e5eb373e860c24b130a7e496bc928bb1c0755b23a2274c5a	2cb93ade	2021-06-10 17:18:33.787+07	2021-06-10 17:18:33.787+07
4	User4	722cb82cb2f562cb349a27b33f6cc9b5b78375708ae7a19cf1243767f6d704d8	24558b92	2021-06-10 17:18:33.787+07	2021-06-10 17:18:33.787+07
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 22, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 42, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: companies companies_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(id);


--
-- PostgreSQL database dump complete
--

