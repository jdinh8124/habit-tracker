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

ALTER TABLE ONLY public."userRoutine" DROP CONSTRAINT "userRoutine_fk2";
ALTER TABLE ONLY public."userRoutine" DROP CONSTRAINT "userRoutine_fk1";
ALTER TABLE ONLY public."userRoutine" DROP CONSTRAINT "userRoutine_fk0";
ALTER TABLE ONLY public."userHabit" DROP CONSTRAINT "userHabit_fk2";
ALTER TABLE ONLY public."userHabit" DROP CONSTRAINT "userHabit_fk1";
ALTER TABLE ONLY public."userHabit" DROP CONSTRAINT "userHabit_fk0";
ALTER TABLE ONLY public.routine DROP CONSTRAINT routine_fk0;
ALTER TABLE ONLY public."routineHabit" DROP CONSTRAINT "routineHabit_fk1";
ALTER TABLE ONLY public."routineHabit" DROP CONSTRAINT "routineHabit_fk0";
ALTER TABLE ONLY public.habit DROP CONSTRAINT habit_fk0;
ALTER TABLE ONLY public.chat DROP CONSTRAINT chat_fk1;
ALTER TABLE ONLY public.chat DROP CONSTRAINT chat_fk0;
ALTER TABLE ONLY public."user" DROP CONSTRAINT "user_userName_key";
ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pk;
ALTER TABLE ONLY public.routine DROP CONSTRAINT routine_pk;
ALTER TABLE ONLY public.habit DROP CONSTRAINT habit_pk;
ALTER TABLE ONLY public.chat DROP CONSTRAINT chat_pk;
ALTER TABLE public."userRoutine" ALTER COLUMN "routineId" DROP DEFAULT;
ALTER TABLE public."userRoutine" ALTER COLUMN "senderId" DROP DEFAULT;
ALTER TABLE public."userRoutine" ALTER COLUMN "receiverId" DROP DEFAULT;
ALTER TABLE public."userHabit" ALTER COLUMN "habitId" DROP DEFAULT;
ALTER TABLE public."userHabit" ALTER COLUMN "routineId" DROP DEFAULT;
ALTER TABLE public."userHabit" ALTER COLUMN "userId" DROP DEFAULT;
ALTER TABLE public."user" ALTER COLUMN "userId" DROP DEFAULT;
ALTER TABLE public."routineHabit" ALTER COLUMN "habitId" DROP DEFAULT;
ALTER TABLE public."routineHabit" ALTER COLUMN "routineId" DROP DEFAULT;
ALTER TABLE public.routine ALTER COLUMN "createdBy" DROP DEFAULT;
ALTER TABLE public.routine ALTER COLUMN "routineId" DROP DEFAULT;
ALTER TABLE public.habit ALTER COLUMN "createdBy" DROP DEFAULT;
ALTER TABLE public.habit ALTER COLUMN "habitId" DROP DEFAULT;
ALTER TABLE public.chat ALTER COLUMN "receiverId" DROP DEFAULT;
ALTER TABLE public.chat ALTER COLUMN "senderId" DROP DEFAULT;
ALTER TABLE public.chat ALTER COLUMN "chatId" DROP DEFAULT;
DROP SEQUENCE public."user_userId_seq";
DROP SEQUENCE public."userRoutine_senderId_seq";
DROP SEQUENCE public."userRoutine_routineId_seq";
DROP SEQUENCE public."userRoutine_receiverId_seq";
DROP TABLE public."userRoutine";
DROP SEQUENCE public."userHabit_userId_seq";
DROP SEQUENCE public."userHabit_routineId_seq";
DROP SEQUENCE public."userHabit_habitId_seq";
DROP TABLE public."userHabit";
DROP TABLE public."user";
DROP SEQUENCE public."routine_routineId_seq";
DROP SEQUENCE public."routine_createdBy_seq";
DROP SEQUENCE public."routineHabit_routineId_seq";
DROP SEQUENCE public."routineHabit_habitId_seq";
DROP TABLE public."routineHabit";
DROP TABLE public.routine;
DROP SEQUENCE public."habit_habitId_seq";
DROP SEQUENCE public."habit_createdBy_seq";
DROP TABLE public.habit;
DROP SEQUENCE public."chat_senderId_seq";
DROP SEQUENCE public."chat_receiverId_seq";
DROP SEQUENCE public."chat_chatId_seq";
DROP TABLE public.chat;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat (
    "chatId" integer NOT NULL,
    "senderId" integer NOT NULL,
    "receiverId" integer NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: chat_chatId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."chat_chatId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_chatId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."chat_chatId_seq" OWNED BY public.chat."chatId";


--
-- Name: chat_receiverId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."chat_receiverId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_receiverId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."chat_receiverId_seq" OWNED BY public.chat."receiverId";


--
-- Name: chat_senderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."chat_senderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_senderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."chat_senderId_seq" OWNED BY public.chat."senderId";


--
-- Name: habit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habit (
    "habitId" integer NOT NULL,
    "habitName" character varying(255) NOT NULL,
    "habitDescription" text NOT NULL,
    "createdBy" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: habit_createdBy_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."habit_createdBy_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: habit_createdBy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."habit_createdBy_seq" OWNED BY public.habit."createdBy";


--
-- Name: habit_habitId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."habit_habitId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: habit_habitId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."habit_habitId_seq" OWNED BY public.habit."habitId";


--
-- Name: routine; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.routine (
    "routineId" integer NOT NULL,
    "routineName" character varying(255) NOT NULL,
    "routineDescription" text NOT NULL,
    "createdBy" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: routineHabit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."routineHabit" (
    "routineId" integer NOT NULL,
    "habitId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: routineHabit_habitId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."routineHabit_habitId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routineHabit_habitId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."routineHabit_habitId_seq" OWNED BY public."routineHabit"."habitId";


--
-- Name: routineHabit_routineId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."routineHabit_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routineHabit_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."routineHabit_routineId_seq" OWNED BY public."routineHabit"."routineId";


--
-- Name: routine_createdBy_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."routine_createdBy_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routine_createdBy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."routine_createdBy_seq" OWNED BY public.routine."createdBy";


--
-- Name: routine_routineId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."routine_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routine_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."routine_routineId_seq" OWNED BY public.routine."routineId";


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    "userId" integer NOT NULL,
    "userName" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "userPwd" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: userHabit; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: userHabit_habitId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userHabit_habitId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userHabit_habitId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userHabit_habitId_seq" OWNED BY public."userHabit"."habitId";


--
-- Name: userHabit_routineId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userHabit_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userHabit_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userHabit_routineId_seq" OWNED BY public."userHabit"."routineId";


--
-- Name: userHabit_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userHabit_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userHabit_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userHabit_userId_seq" OWNED BY public."userHabit"."userId";


--
-- Name: userRoutine; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: userRoutine_receiverId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userRoutine_receiverId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userRoutine_receiverId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userRoutine_receiverId_seq" OWNED BY public."userRoutine"."receiverId";


--
-- Name: userRoutine_routineId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userRoutine_routineId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userRoutine_routineId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userRoutine_routineId_seq" OWNED BY public."userRoutine"."routineId";


--
-- Name: userRoutine_senderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userRoutine_senderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userRoutine_senderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userRoutine_senderId_seq" OWNED BY public."userRoutine"."senderId";


--
-- Name: user_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."user_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."user_userId_seq" OWNED BY public."user"."userId";


--
-- Name: chat chatId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat ALTER COLUMN "chatId" SET DEFAULT nextval('public."chat_chatId_seq"'::regclass);


--
-- Name: chat senderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat ALTER COLUMN "senderId" SET DEFAULT nextval('public."chat_senderId_seq"'::regclass);


--
-- Name: chat receiverId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat ALTER COLUMN "receiverId" SET DEFAULT nextval('public."chat_receiverId_seq"'::regclass);


--
-- Name: habit habitId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit ALTER COLUMN "habitId" SET DEFAULT nextval('public."habit_habitId_seq"'::regclass);


--
-- Name: habit createdBy; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit ALTER COLUMN "createdBy" SET DEFAULT nextval('public."habit_createdBy_seq"'::regclass);


--
-- Name: routine routineId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routine ALTER COLUMN "routineId" SET DEFAULT nextval('public."routine_routineId_seq"'::regclass);


--
-- Name: routine createdBy; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routine ALTER COLUMN "createdBy" SET DEFAULT nextval('public."routine_createdBy_seq"'::regclass);


--
-- Name: routineHabit routineId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."routineHabit" ALTER COLUMN "routineId" SET DEFAULT nextval('public."routineHabit_routineId_seq"'::regclass);


--
-- Name: routineHabit habitId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."routineHabit" ALTER COLUMN "habitId" SET DEFAULT nextval('public."routineHabit_habitId_seq"'::regclass);


--
-- Name: user userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN "userId" SET DEFAULT nextval('public."user_userId_seq"'::regclass);


--
-- Name: userHabit userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userHabit" ALTER COLUMN "userId" SET DEFAULT nextval('public."userHabit_userId_seq"'::regclass);


--
-- Name: userHabit routineId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userHabit" ALTER COLUMN "routineId" SET DEFAULT nextval('public."userHabit_routineId_seq"'::regclass);


--
-- Name: userHabit habitId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userHabit" ALTER COLUMN "habitId" SET DEFAULT nextval('public."userHabit_habitId_seq"'::regclass);


--
-- Name: userRoutine receiverId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userRoutine" ALTER COLUMN "receiverId" SET DEFAULT nextval('public."userRoutine_receiverId_seq"'::regclass);


--
-- Name: userRoutine senderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userRoutine" ALTER COLUMN "senderId" SET DEFAULT nextval('public."userRoutine_senderId_seq"'::regclass);


--
-- Name: userRoutine routineId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userRoutine" ALTER COLUMN "routineId" SET DEFAULT nextval('public."userRoutine_routineId_seq"'::regclass);


--
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chat ("chatId", "senderId", "receiverId", message, "createdAt") FROM stdin;
\.


--
-- Data for Name: habit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.habit ("habitId", "habitName", "habitDescription", "createdBy", "createdAt") FROM stdin;
1	Take a Walk	Taking a walk outside	1	2020-01-22 17:25:08.386083-08
2	Drink water	So you can stay alive	2	2020-01-22 17:25:08.386083-08
3	Work Out	Make yourself tired	1	2020-01-22 17:25:08.386083-08
4	Code Everyday	Stay sharp	2	2020-01-22 17:25:08.386083-08
\.


--
-- Data for Name: routine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.routine ("routineId", "routineName", "routineDescription", "createdBy", "createdAt") FROM stdin;
1	Going Out	Bob wants to go outside	1	2020-01-22 12:14:57.795595-08
2	Stay Healthy	Dob wants to be healthy	2	2020-01-22 12:14:57.795595-08
3	Be Productive	Bob needs to work more	1	2020-01-22 12:14:57.795595-08
4	Have Fun	Dob is boring	2	2020-01-22 12:14:57.795595-08
\.


--
-- Data for Name: routineHabit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."routineHabit" ("routineId", "habitId", "createdAt") FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" ("userId", "userName", email, "userPwd", "createdAt") FROM stdin;
1	bob	bob@imail.com	bob123	2020-01-22 11:49:27.832874-08
2	dob	dob@imail.com	dob456	2020-01-22 11:49:27.832874-08
\.


--
-- Data for Name: userHabit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."userHabit" ("userId", "routineId", "habitId", "timesCompleted", "lastCompleted", frequency, "nextCompletion", duration, "congratsMessage", "motivationalMessage", "createdAt") FROM stdin;
2	1	1	3	17:32:23.37984	1	2020-01-22	30 min	You went outside!	Get out...	2020-01-22 17:32:23.37984-08
2	2	2	5	17:32:23.37984	2	2020-01-22	1 hour	Stay hydrated!	Get some water...	2020-01-22 17:32:23.37984-08
2	1	4	12	17:32:23.37984	1	2020-01-22	2 hours	Stay sharp!	Just commit...	2020-01-22 17:32:23.37984-08
1	2	3	7	17:32:23.37984	2	2020-01-22	1 hour	Get gains!	Hit the gym...	2020-01-22 17:32:23.37984-08
\.


--
-- Data for Name: userRoutine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."userRoutine" ("receiverId", "senderId", "routineId", "routineName", "accepted?", "requestMessage", "createdAt") FROM stdin;
2	1	1	Going out	t	Dob please accept this routine	2020-01-22 12:33:50.164023-08
2	2	4	Have Fun	t	Fun routine for me	2020-01-22 12:33:50.164023-08
2	1	3	Work!	f	Dob be more productive	2020-01-22 12:33:50.164023-08
2	2	2	Be Healthy	\N	Stopb being a fatass	2020-01-22 12:33:50.164023-08
1	2	4	Have Some Fun	f	You should try this	2020-01-22 12:33:50.164023-08
1	2	2	Be More Healthy	t	Stay healthy	2020-01-22 12:33:50.164023-08
\.


--
-- Name: chat_chatId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."chat_chatId_seq"', 1, false);


--
-- Name: chat_receiverId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."chat_receiverId_seq"', 1, false);


--
-- Name: chat_senderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."chat_senderId_seq"', 1, false);


--
-- Name: habit_createdBy_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."habit_createdBy_seq"', 1, false);


--
-- Name: habit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."habit_habitId_seq"', 4, true);


--
-- Name: routineHabit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."routineHabit_habitId_seq"', 1, false);


--
-- Name: routineHabit_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."routineHabit_routineId_seq"', 1, false);


--
-- Name: routine_createdBy_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."routine_createdBy_seq"', 1, false);


--
-- Name: routine_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."routine_routineId_seq"', 4, true);


--
-- Name: userHabit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userHabit_habitId_seq"', 1, false);


--
-- Name: userHabit_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userHabit_routineId_seq"', 1, false);


--
-- Name: userHabit_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userHabit_userId_seq"', 1, false);


--
-- Name: userRoutine_receiverId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userRoutine_receiverId_seq"', 1, false);


--
-- Name: userRoutine_routineId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userRoutine_routineId_seq"', 1, false);


--
-- Name: userRoutine_senderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userRoutine_senderId_seq"', 1, false);


--
-- Name: user_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."user_userId_seq"', 2, true);


--
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY ("chatId");


--
-- Name: habit habit_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit
    ADD CONSTRAINT habit_pk PRIMARY KEY ("habitId");


--
-- Name: routine routine_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routine
    ADD CONSTRAINT routine_pk PRIMARY KEY ("routineId");


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY ("userId");


--
-- Name: user user_userName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "user_userName_key" UNIQUE ("userName");


--
-- Name: chat chat_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk0 FOREIGN KEY ("senderId") REFERENCES public."user"("userId");


--
-- Name: chat chat_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk1 FOREIGN KEY ("receiverId") REFERENCES public."user"("userId");


--
-- Name: habit habit_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habit
    ADD CONSTRAINT habit_fk0 FOREIGN KEY ("createdBy") REFERENCES public."user"("userId");


--
-- Name: routineHabit routineHabit_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."routineHabit"
    ADD CONSTRAINT "routineHabit_fk0" FOREIGN KEY ("routineId") REFERENCES public.routine("routineId");


--
-- Name: routineHabit routineHabit_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."routineHabit"
    ADD CONSTRAINT "routineHabit_fk1" FOREIGN KEY ("habitId") REFERENCES public.habit("habitId");


--
-- Name: routine routine_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.routine
    ADD CONSTRAINT routine_fk0 FOREIGN KEY ("createdBy") REFERENCES public."user"("userId");


--
-- Name: userHabit userHabit_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userHabit"
    ADD CONSTRAINT "userHabit_fk0" FOREIGN KEY ("userId") REFERENCES public."user"("userId");


--
-- Name: userHabit userHabit_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userHabit"
    ADD CONSTRAINT "userHabit_fk1" FOREIGN KEY ("routineId") REFERENCES public.routine("routineId");


--
-- Name: userHabit userHabit_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userHabit"
    ADD CONSTRAINT "userHabit_fk2" FOREIGN KEY ("habitId") REFERENCES public.habit("habitId");


--
-- Name: userRoutine userRoutine_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userRoutine"
    ADD CONSTRAINT "userRoutine_fk0" FOREIGN KEY ("receiverId") REFERENCES public."user"("userId");


--
-- Name: userRoutine userRoutine_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userRoutine"
    ADD CONSTRAINT "userRoutine_fk1" FOREIGN KEY ("senderId") REFERENCES public."user"("userId");


--
-- Name: userRoutine userRoutine_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userRoutine"
    ADD CONSTRAINT "userRoutine_fk2" FOREIGN KEY ("routineId") REFERENCES public.routine("routineId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

