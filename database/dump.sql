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
ALTER TABLE ONLY public."defaultCheck" DROP CONSTRAINT "defaultCheck_fk0";
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
ALTER TABLE public."defaultCheck" ALTER COLUMN "userId" DROP DEFAULT;
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
DROP SEQUENCE public."defaultCheck_userId_seq";
DROP TABLE public."defaultCheck";
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
-- Name: defaultCheck; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."defaultCheck" (
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: defaultCheck_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."defaultCheck_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: defaultCheck_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."defaultCheck_userId_seq" OWNED BY public."defaultCheck"."userId";


--
-- Name: habit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habit (
    "habitId" integer NOT NULL,
    "habitName" character varying(255) NOT NULL,
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
-- Name: defaultCheck userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."defaultCheck" ALTER COLUMN "userId" SET DEFAULT nextval('public."defaultCheck_userId_seq"'::regclass);


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
-- Data for Name: defaultCheck; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."defaultCheck" ("userId", "createdAt") FROM stdin;
\.


--
-- Data for Name: habit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.habit ("habitId", "habitName", "createdBy", "createdAt") FROM stdin;
1	Code often	1	2020-01-30 17:23:02.078595-08
2	Networking	1	2020-01-30 17:23:02.078595-08
3	Practice whiteboard	1	2020-01-30 17:23:02.078595-08
4	Keep GitHub green	1	2020-01-30 17:23:02.078595-08
5	Learn from other people	1	2020-01-30 17:23:02.078595-08
6	Eat	2	2020-01-30 19:46:27.454691-08
7	Sleep	2	2020-01-30 19:46:34.744802-08
8	hello	23	2020-02-09 14:48:25.964097-08
9	Yolo	23	2020-02-09 14:49:13.337504-08
\.


--
-- Data for Name: routine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.routine ("routineId", "routineName", "createdBy", "createdAt") FROM stdin;
1	Web Dev	1	2020-01-30 17:23:02.075242-08
2	New Routine	2	2020-01-30 18:10:05.920014-08
3	Hello	2	2020-01-30 18:12:38.913683-08
4	Hello Dev	2	2020-01-30 19:46:18.051686-08
5	Sleep	2	2020-01-30 19:47:01.238489-08
6	Sleep	2	2020-01-30 19:47:10.685441-08
7	Training Day	2	2020-01-31 09:09:20.336569-08
8	Hello	23	2020-02-09 14:39:27.445637-08
\.


--
-- Data for Name: routineHabit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."routineHabit" ("routineId", "habitId", "createdAt") FROM stdin;
1	1	2020-01-30 17:23:02.081043-08
1	2	2020-01-30 17:23:02.081043-08
1	3	2020-01-30 17:23:02.081043-08
1	4	2020-01-30 17:23:02.081043-08
1	5	2020-01-30 17:23:02.081043-08
4	6	2020-01-30 19:46:27.467162-08
4	7	2020-01-30 19:46:34.757545-08
1	8	2020-02-09 14:48:25.980429-08
8	9	2020-02-09 14:49:13.355727-08
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" ("userId", "userName", email, "userPwd", "createdAt") FROM stdin;
1	bob	bob@bob.com	noHashPwd	2020-01-30 17:23:02.068464-08
2	x	xxx@g.com	$2b$10$hbH5zatHDmgk.qd0RD3DZOj4in4P4IV85veQt0aZXrW0JVlW5GfIu	2020-01-30 17:36:54.585669-08
3	hello	hello@gmail.com	$2b$10$jJukNBqNqhwCWrf5F/FUU.IxyeMb7Gf2d29Gl72BuW3UGB8ZWcZ1u	2020-01-30 18:30:45.031143-08
4	james	hello@gmail.com	$2b$10$RXeY9uaywC/I4adQ0LUXK.9IJ.RMrjmw/X3zwso1KtXPMHkUbEeE6	2020-01-30 19:48:21.361324-08
11	xxasdasdadasdsadsadassadsad	x@gmail.com	$2b$10$hgoun.Ic1EhHEdKlyzCniO/vKYHl6vYNhxexqJO3L4t7pA9fkfXTm	2020-01-31 09:13:48.960874-08
13	xx	x@gmail.com	$2b$10$8DNt.xFW470wj/wtHkQHhOicDvOPj7BcuMl4BvfYQ6JHXUhmVhbhq	2020-01-31 09:14:06.720433-08
19	xxx	x@f.x	$2b$10$IoKBMUB1TGyZaBqi3BU9w.MRjajkpyQS8qf0DYh3nhHmolb8Hmg9a	2020-01-31 09:15:53.124832-08
23	a	a@a.com	$2b$10$iwWtvM3ECNfHUpNQib7PJOpCCPw6UNVdkjFLMIceUjubaU.293ysO	2020-02-09 14:37:25.418987-08
24	guest	guest@google.com	$2b$10$z3cCgdZoHGZ0khvxTNCtU./PUuqW3tJjTetjjl0aHoL1nhodFZj6u	2020-03-29 20:20:27.866094-07
\.


--
-- Data for Name: userHabit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."userHabit" ("userId", "routineId", "habitId", "timesCompleted", "lastCompleted", frequency, "nextCompletion", duration, "congratsMessage", "motivationalMessage", "createdAt") FROM stdin;
2	1	4	1	18:38:42.140253	7	2020-01-31	Hello	effwfwe	sdfsdf	2020-01-30 18:38:38.320751-08
24	1	1	0	04:05:06.789	1	2019-02-08	10 mins	Good job!!!	Get them next time champ	2020-03-29 20:33:17.009871-07
24	1	5	0	04:05:06.789	7	2019-02-08	15 mins	Good job champ!	Next time!	2020-03-29 20:33:37.773289-07
\.


--
-- Data for Name: userRoutine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."userRoutine" ("receiverId", "senderId", "routineId", "routineName", "accepted?", "requestMessage", "createdAt") FROM stdin;
2	2	4	Hello Dev	t	Self-created routine	2020-01-30 19:46:18.062742-08
2	2	7	Training Day	t	Self-created routine	2020-01-31 09:09:20.344525-08
23	23	8	Hello	t	Self-created routine	2020-02-09 14:39:27.48135-08
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
-- Name: defaultCheck_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."defaultCheck_userId_seq"', 1, false);


--
-- Name: habit_createdBy_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."habit_createdBy_seq"', 1, false);


--
-- Name: habit_habitId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."habit_habitId_seq"', 9, true);


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

SELECT pg_catalog.setval('public."routine_routineId_seq"', 8, true);


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

SELECT pg_catalog.setval('public."user_userId_seq"', 24, true);


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
-- Name: defaultCheck defaultCheck_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."defaultCheck"
    ADD CONSTRAINT "defaultCheck_fk0" FOREIGN KEY ("userId") REFERENCES public."user"("userId");


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

