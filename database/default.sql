--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chat; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.chat (
    "chatId" integer NOT NULL,
    "senderId" integer NOT NULL,
    "receiverId" integer NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.chat OWNER TO dev;

--
-- Name: chat_chatId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."chat_chatId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chat_chatId_seq" OWNER TO dev;

--
-- Name: chat_chatId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."chat_chatId_seq" OWNED BY public.chat."chatId";


--
-- Name: chat_receiverId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."chat_receiverId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chat_receiverId_seq" OWNER TO dev;

--
-- Name: chat_receiverId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."chat_receiverId_seq" OWNED BY public.chat."receiverId";


--
-- Name: chat_senderId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."chat_senderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chat_senderId_seq" OWNER TO dev;

--
-- Name: chat_senderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."chat_senderId_seq" OWNED BY public.chat."senderId";


--
-- Name: habit; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.habit (
    "habitId" integer NOT NULL,
    "habitName" character varying(255) NOT NULL,
    "habitDescription" text NOT NULL,
    "createdBy" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.habit OWNER TO dev;

--
-- Name: habit_createdBy_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."habit_createdBy_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."habit_createdBy_seq" OWNER TO dev;

--
-- Name: habit_createdBy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."habit_createdBy_seq" OWNED BY public.habit."createdBy";


--
-- Name: habit_habitId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."habit_habitId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."habit_habitId_seq" OWNER TO dev;

--
-- Name: habit_habitId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."habit_habitId_seq" OWNED BY public.habit."habitId";


--
-- Name: routine; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.routine (
    "routineId" integer NOT NULL,
    "routineName" character varying(255) NOT NULL,
    "routineDescription" text NOT NULL,
    "createdBy" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.routine OWNER TO dev;

--
-- Name: routineHabit; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public."routineHabit" (
    "routineId" integer NOT NULL,
    "habitId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."routineHabit" OWNER TO dev;

--
-- Name: routineHabit_habitId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."routineHabit_habitId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."routineHabit_habitId_seq" OWNER TO dev;

--
-- Name: routineHabit_habitId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."routineHabit_habitId_seq" OWNED BY public."routineHabit"."habitId";


--
-- Name: routineHabit_routineId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."routineHabit_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."routineHabit_routineId_seq" OWNER TO dev;

--
-- Name: routineHabit_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."routineHabit_routineId_seq" OWNED BY public."routineHabit"."routineId";


--
-- Name: routine_createdBy_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."routine_createdBy_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."routine_createdBy_seq" OWNER TO dev;

--
-- Name: routine_createdBy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."routine_createdBy_seq" OWNED BY public.routine."createdBy";


--
-- Name: routine_routineId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."routine_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."routine_routineId_seq" OWNER TO dev;

--
-- Name: routine_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."routine_routineId_seq" OWNED BY public.routine."routineId";


--
-- Name: user; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public."user" (
    "userId" integer NOT NULL,
    "userName" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "userPwd" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."user" OWNER TO dev;

--
-- Name: userHabit; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public."userHabit" (
    "userId" integer NOT NULL,
    "routineId" integer NOT NULL,
    "habitId" integer NOT NULL,
    "timesCompleted" integer DEFAULT 0 NOT NULL,
    "lastCompleted" time without time zone NOT NULL,
    frequency integer NOT NULL,
    "nextCompletion" date NOT NULL,
    duration character varying(255) NOT NULL,
    "congratsMessage" text NOT NULL,
    "motivationalMessage" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."userHabit" OWNER TO dev;

--
-- Name: userHabit_habitId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."userHabit_habitId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userHabit_habitId_seq" OWNER TO dev;

--
-- Name: userHabit_habitId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."userHabit_habitId_seq" OWNED BY public."userHabit"."habitId";


--
-- Name: userHabit_routineId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."userHabit_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userHabit_routineId_seq" OWNER TO dev;

--
-- Name: userHabit_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."userHabit_routineId_seq" OWNED BY public."userHabit"."routineId";


--
-- Name: userHabit_userId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."userHabit_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userHabit_userId_seq" OWNER TO dev;

--
-- Name: userHabit_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."userHabit_userId_seq" OWNED BY public."userHabit"."userId";


--
-- Name: userRoutine; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public."userRoutine" (
    "receiverId" integer NOT NULL,
    "senderId" integer NOT NULL,
    "routineId" integer NOT NULL,
    "routineName" character varying(255) NOT NULL,
    "accepted?" boolean,
    "requestMessage" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."userRoutine" OWNER TO dev;

--
-- Name: userRoutine_receiverId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."userRoutine_receiverId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userRoutine_receiverId_seq" OWNER TO dev;

--
-- Name: userRoutine_receiverId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."userRoutine_receiverId_seq" OWNED BY public."userRoutine"."receiverId";


--
-- Name: userRoutine_routineId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."userRoutine_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userRoutine_routineId_seq" OWNER TO dev;

--
-- Name: userRoutine_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."userRoutine_routineId_seq" OWNED BY public."userRoutine"."routineId";


--
-- Name: userRoutine_senderId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."userRoutine_senderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userRoutine_senderId_seq" OWNER TO dev;

--
-- Name: userRoutine_senderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."userRoutine_senderId_seq" OWNED BY public."userRoutine"."senderId";


--
-- Name: user_userId_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public."user_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."user_userId_seq" OWNER TO dev;

--
-- Name: user_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public."user_userId_seq" OWNED BY public."user"."userId";


--
-- Name: chat chatId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.chat ALTER COLUMN "chatId" SET DEFAULT nextval('public."chat_chatId_seq"'::regclass);


--
-- Name: chat senderId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.chat ALTER COLUMN "senderId" SET DEFAULT nextval('public."chat_senderId_seq"'::regclass);


--
-- Name: chat receiverId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.chat ALTER COLUMN "receiverId" SET DEFAULT nextval('public."chat_receiverId_seq"'::regclass);


--
-- Name: habit habitId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.habit ALTER COLUMN "habitId" SET DEFAULT nextval('public."habit_habitId_seq"'::regclass);


--
-- Name: habit createdBy; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.habit ALTER COLUMN "createdBy" SET DEFAULT nextval('public."habit_createdBy_seq"'::regclass);


--
-- Name: routine routineId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.routine ALTER COLUMN "routineId" SET DEFAULT nextval('public."routine_routineId_seq"'::regclass);


--
-- Name: routine createdBy; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.routine ALTER COLUMN "createdBy" SET DEFAULT nextval('public."routine_createdBy_seq"'::regclass);


--
-- Name: routineHabit routineId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."routineHabit" ALTER COLUMN "routineId" SET DEFAULT nextval('public."routineHabit_routineId_seq"'::regclass);


--
-- Name: routineHabit habitId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."routineHabit" ALTER COLUMN "habitId" SET DEFAULT nextval('public."routineHabit_habitId_seq"'::regclass);


--
-- Name: user userId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."user" ALTER COLUMN "userId" SET DEFAULT nextval('public."user_userId_seq"'::regclass);


--
-- Name: userHabit userId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userHabit" ALTER COLUMN "userId" SET DEFAULT nextval('public."userHabit_userId_seq"'::regclass);


--
-- Name: userHabit routineId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userHabit" ALTER COLUMN "routineId" SET DEFAULT nextval('public."userHabit_routineId_seq"'::regclass);


--
-- Name: userHabit habitId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userHabit" ALTER COLUMN "habitId" SET DEFAULT nextval('public."userHabit_habitId_seq"'::regclass);


--
-- Name: userRoutine receiverId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userRoutine" ALTER COLUMN "receiverId" SET DEFAULT nextval('public."userRoutine_receiverId_seq"'::regclass);


--
-- Name: userRoutine senderId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userRoutine" ALTER COLUMN "senderId" SET DEFAULT nextval('public."userRoutine_senderId_seq"'::regclass);


--
-- Name: userRoutine routineId; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userRoutine" ALTER COLUMN "routineId" SET DEFAULT nextval('public."userRoutine_routineId_seq"'::regclass);


--
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.chat ("chatId", "senderId", "receiverId", message, "createdAt") FROM stdin;
\.


--
-- Data for Name: habit; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.habit ("habitId", "habitName", "habitDescription", "createdBy", "createdAt") FROM stdin;
10	Go on a walk	Unneeded column	23	2020-01-30 12:42:55.708986-08
11	Drink water first thing in the morning	Unneeded column	23	2020-01-30 12:44:38.509189-08
12	Meditate	Unneeded column	23	2020-01-30 12:44:48.212998-08
13	Practice Mindfulness	Unneeded column	23	2020-01-30 12:44:59.305082-08
14	Listen to a podcast	Unneeded column	23	2020-01-30 12:46:37.807951-08
15	Take a new route to work	Unneeded column	23	2020-01-30 12:46:43.181837-08
16	Create art	Unneeded column	23	2020-01-30 12:46:56.604652-08
17	Go to a meetup event	Unneeded column	23	2020-01-30 12:47:01.161244-08
18	Hang out with a family member or friend	Unneeded column	23	2020-01-30 12:47:11.047646-08
19	Clean for an hour	Unneeded column	23	2020-01-30 12:47:20.966526-08
20	Pray	Unneeded column	23	2020-01-30 12:47:29.904975-08
21	Take a short nap	Unneeded column	23	2020-01-30 12:47:40.709281-08
22	Volunteer for a good case	Unneeded column	23	2020-01-30 12:47:52.261621-08
23	Cook a meal	Unneeded column	23	2020-01-30 12:48:00.453777-08
24	Get 15 minutes of sun	Unneeded column	23	2020-01-30 12:48:11.43122-08
\.


--
-- Data for Name: routine; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public.routine ("routineId", "routineName", "routineDescription", "createdBy", "createdAt") FROM stdin;
20	Default Routines	will be deleted soon	23	2020-01-30 12:42:11.793582-08
\.


--
-- Data for Name: routineHabit; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public."routineHabit" ("routineId", "habitId", "createdAt") FROM stdin;
20	10	2020-01-30 12:42:55.725108-08
20	11	2020-01-30 12:44:38.518936-08
20	12	2020-01-30 12:44:48.226683-08
20	13	2020-01-30 12:44:59.313787-08
20	14	2020-01-30 12:46:37.820077-08
20	15	2020-01-30 12:46:43.186273-08
20	16	2020-01-30 12:46:56.613083-08
20	17	2020-01-30 12:47:01.166145-08
20	18	2020-01-30 12:47:11.051149-08
20	19	2020-01-30 12:47:20.980146-08
20	20	2020-01-30 12:47:29.917068-08
20	21	2020-01-30 12:47:40.71779-08
20	22	2020-01-30 12:47:52.270028-08
20	23	2020-01-30 12:48:00.46833-08
20	24	2020-01-30 12:48:11.440059-08
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public."user" ("userId", "userName", email, "userPwd", "createdAt") FROM stdin;
1	bob	bob@imail.com	bob123	2020-01-22 11:49:27.832874-08
2	dob	dob@imail.com	dob456	2020-01-22 11:49:27.832874-08
10	1	1	$2b$10$phIYxGQUUWHzUlqCbbC1/uTiQR39WDhMyOcY3HlDYth81nCX8i9kK	2020-01-25 17:21:56.669378-08
11	12	12	$2b$10$TDz0MHLbAZAC9mFdiOX5MOVzt45WOBOZhEYQywAc4ZV4sR2ufC1he	2020-01-25 17:25:00.276974-08
13	123	123	$2b$10$100n2T1GqZcecjGlR.zX.e6D4z7tib8VQhRthGOuhJcdyacYIPpDm	2020-01-25 17:26:11.186191-08
15	12112	12	$2b$10$nh9pO4K/8epHbSMJa6mTR.UnRvu8z0tKKjAZo7fow7.ZGNUXsekv2	2020-01-25 17:29:08.960138-08
17	fd	df	$2b$10$3Q6H5IqVuP4SXtvZqqNFS.Y3xO0vFceXbONmXSq1FsqrDYntWYDIq	2020-01-25 17:30:10.375249-08
18	v	v	$2b$10$vEOIUUr29YjoctcGrXAPS.CNbxkT8V0xMJLyE4NSbriqf9c741oZa	2020-01-25 17:30:44.009493-08
20	g	g	$2b$10$RiA6D/qwQp3H8pz2lwPz4.ECIc6kTiqD2V9pbgfFeyTEud6t1XFZO	2020-01-25 17:31:14.741795-08
21	cdcdc	cd	$2b$10$sAOaJy6L84dusK23V08kAeFi0W8jZ/1pM4bGO0Tspy5CkFKw93H7u	2020-01-25 18:30:38.366808-08
23	x	x	$2b$10$tDxVs3LZHlgixpmuIarBxuusvrcdZIQ4S7WoI4l1IU6lV4Y0hlaUm	2020-01-25 18:31:36.097002-08
49	xx	xx	$2b$10$gZ9fGJitV2dSKqVJqx4niudOO3vvlfuIjlfY/xSI5i4k7U9ku2qiS	2020-01-25 23:35:32.692959-08
52	xa	xa	$2b$10$lpg/mcnZjZ6Gp9DGlrK3teISPEQp8tbvB5qyiKQ8maMwvZMcZRbnq	2020-01-25 23:36:25.179694-08
60		sadsa	$2b$10$Yt5FD5I2Ou4zI54SSwwVk.9eAWS0LHj8UQfpdB1TbfOPjSVWOSRLS	2020-01-29 17:15:00.048654-08
69	d	sadsad	$2b$10$7S0udsUjiYEnKQ6T06FsGOPmLcXUJFUl3qugQtZ76pORhisJqJTdm	2020-01-29 17:28:50.521731-08
70	sadasd	sdasdsa@sad.xom	$2b$10$oUOMlIzYrd7p/4m.WoD44uAkK2H4XuMQdqWriNQKDbrtj8tDsQ6O2	2020-01-29 17:43:50.479379-08
\.


--
-- Data for Name: userHabit; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public."userHabit" ("userId", "routineId", "habitId", "timesCompleted", "lastCompleted", frequency, "nextCompletion", duration, "congratsMessage", "motivationalMessage", "createdAt") FROM stdin;
\.


--
-- Data for Name: userRoutine; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY public."userRoutine" ("receiverId", "senderId", "routineId", "routineName", "accepted?", "requestMessage", "createdAt") FROM stdin;
23	23	20	Default Routines	t	Self-created routine	2020-01-30 12:42:11.800923-08
\.


--
-- Name: chat_chatId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."chat_chatId_seq"', 1, false);


--
-- Name: chat_receiverId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."chat_receiverId_seq"', 1, false);


--
-- Name: chat_senderId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."chat_senderId_seq"', 1, false);


--
-- Name: habit_createdBy_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."habit_createdBy_seq"', 1, false);


--
-- Name: habit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."habit_habitId_seq"', 24, true);


--
-- Name: routineHabit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."routineHabit_habitId_seq"', 1, false);


--
-- Name: routineHabit_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."routineHabit_routineId_seq"', 1, false);


--
-- Name: routine_createdBy_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."routine_createdBy_seq"', 1, false);


--
-- Name: routine_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."routine_routineId_seq"', 20, true);


--
-- Name: userHabit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."userHabit_habitId_seq"', 1, false);


--
-- Name: userHabit_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."userHabit_routineId_seq"', 1, false);


--
-- Name: userHabit_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."userHabit_userId_seq"', 1, false);


--
-- Name: userRoutine_receiverId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."userRoutine_receiverId_seq"', 1, false);


--
-- Name: userRoutine_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."userRoutine_routineId_seq"', 1, false);


--
-- Name: userRoutine_senderId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."userRoutine_senderId_seq"', 1, false);


--
-- Name: user_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('public."user_userId_seq"', 70, true);


--
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY ("chatId");


--
-- Name: habit habit_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.habit
    ADD CONSTRAINT habit_pk PRIMARY KEY ("habitId");


--
-- Name: routine routine_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.routine
    ADD CONSTRAINT routine_pk PRIMARY KEY ("routineId");


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY ("userId");


--
-- Name: user user_userName_key; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "user_userName_key" UNIQUE ("userName");


--
-- Name: chat chat_fk0; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk0 FOREIGN KEY ("senderId") REFERENCES public."user"("userId");


--
-- Name: chat chat_fk1; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk1 FOREIGN KEY ("receiverId") REFERENCES public."user"("userId");


--
-- Name: habit habit_fk0; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.habit
    ADD CONSTRAINT habit_fk0 FOREIGN KEY ("createdBy") REFERENCES public."user"("userId");


--
-- Name: routineHabit routineHabit_fk0; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."routineHabit"
    ADD CONSTRAINT "routineHabit_fk0" FOREIGN KEY ("routineId") REFERENCES public.routine("routineId");


--
-- Name: routineHabit routineHabit_fk1; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."routineHabit"
    ADD CONSTRAINT "routineHabit_fk1" FOREIGN KEY ("habitId") REFERENCES public.habit("habitId");


--
-- Name: routine routine_fk0; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.routine
    ADD CONSTRAINT routine_fk0 FOREIGN KEY ("createdBy") REFERENCES public."user"("userId");


--
-- Name: userHabit userHabit_fk0; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userHabit"
    ADD CONSTRAINT "userHabit_fk0" FOREIGN KEY ("userId") REFERENCES public."user"("userId");


--
-- Name: userHabit userHabit_fk1; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userHabit"
    ADD CONSTRAINT "userHabit_fk1" FOREIGN KEY ("routineId") REFERENCES public.routine("routineId");


--
-- Name: userHabit userHabit_fk2; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userHabit"
    ADD CONSTRAINT "userHabit_fk2" FOREIGN KEY ("habitId") REFERENCES public.habit("habitId");


--
-- Name: userRoutine userRoutine_fk0; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userRoutine"
    ADD CONSTRAINT "userRoutine_fk0" FOREIGN KEY ("receiverId") REFERENCES public."user"("userId");


--
-- Name: userRoutine userRoutine_fk1; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userRoutine"
    ADD CONSTRAINT "userRoutine_fk1" FOREIGN KEY ("senderId") REFERENCES public."user"("userId");


--
-- Name: userRoutine userRoutine_fk2; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public."userRoutine"
    ADD CONSTRAINT "userRoutine_fk2" FOREIGN KEY ("routineId") REFERENCES public.routine("routineId");


--
-- PostgreSQL database dump complete
--

