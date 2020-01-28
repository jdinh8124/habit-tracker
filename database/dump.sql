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
5	Jog	Unneeded column	2	2020-01-27 15:13:11.981094-08
6	New Added Habit	Unneeded column	2	2020-01-27 15:36:26.571531-08
7	2nd New Added Habit	Unneeded column	2	2020-01-27 15:40:48.785976-08
8	3rd New Habit	Unneeded column	2	2020-01-27 15:42:00.531213-08
9	4th New Habit	Unneeded column	2	2020-01-27 15:43:06.655497-08
10	5th New Habit	Unneeded column	2	2020-01-27 15:44:27.184427-08
11	6th New Habit	Unneeded column	2	2020-01-27 15:45:21.053248-08
12	7th New Habit	Unneeded column	2	2020-01-27 15:46:29.854265-08
13	8th New Habit	Unneeded column	2	2020-01-27 15:48:35.12172-08
14	9th New Habit	Unneeded column	2	2020-01-27 16:07:09.490432-08
15	Find Something	Unneeded column	2	2020-01-27 16:13:04.966705-08
16	Plan	Unneeded column	2	2020-01-27 16:19:50.069512-08
17	Something	Unneeded column	2	2020-01-27 16:21:06.157122-08
18	Habit123	Unneeded column	2	2020-01-27 17:13:19.833706-08
19	Habit 1	Unneeded column	2	2020-01-28 11:00:58.15653-08
20	Habit 2	Unneeded column	2	2020-01-28 11:01:24.88346-08
\.


--
-- Data for Name: routine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.routine ("routineId", "routineName", "routineDescription", "createdBy", "createdAt") FROM stdin;
1	Going Out	Bob wants to go outside	1	2020-01-22 12:14:57.795595-08
2	Stay Healthy	Dob wants to be healthy	2	2020-01-22 12:14:57.795595-08
3	Be Productive	Bob needs to work more	1	2020-01-22 12:14:57.795595-08
4	Have Fun	Dob is boring	2	2020-01-22 12:14:57.795595-08
7	Cook	Cook your own meal!	2	2020-01-23 11:13:17.631725-08
8	Test Your Code	will be deleted soon	2	2020-01-23 13:22:43.112137-08
9	Update Routine	will be deleted soon	2	2020-01-23 13:23:30.470449-08
10	Cook2	Cook your own meal!	2	2020-01-23 15:07:15.689247-08
11	Cook3	Cook your own meal!	2	2020-01-23 15:08:31.679739-08
12	Cook4	Cook your own meal!	2	2020-01-23 15:09:38.22148-08
13	Cook5	Cook your own meal!	2	2020-01-23 15:10:34.957411-08
14	Cook6	Cook your own meal!	2	2020-01-23 15:11:09.836432-08
15	Cook7	Cook your own meal!	2	2020-01-23 15:12:02.10243-08
16	Cook8	Cook your own meal!	2	2020-01-23 15:12:40.906799-08
17	Cook9	Cook your own meal!	2	2020-01-23 15:13:35.077749-08
18	Cook10	Cook your own meal!	2	2020-01-23 15:14:14.250991-08
19	Cook11	Cook your own meal!	2	2020-01-23 15:15:39.672447-08
20	Cook12	Cook your own meal!	2	2020-01-23 15:16:42.286293-08
21	Cook a Lot	will be deleted soon	2	2020-01-23 15:17:13.506099-08
22	Test	will be deleted soon	2	2020-01-23 15:18:27.677309-08
23	Test2	will be deleted soon	2	2020-01-23 15:18:58.723035-08
24	Cook13	Cook your own meal!	2	2020-01-23 15:19:48.115265-08
25	Test3	will be deleted soon	2	2020-01-23 15:20:02.38679-08
26	Test4	will be deleted soon	2	2020-01-23 15:21:10.367067-08
27	Test5	will be deleted soon	2	2020-01-23 15:21:33.653685-08
28	New Routine	will be deleted soon	2	2020-01-23 17:07:38.648188-08
29	jkashdflakfldhsj	will be deleted soon	2	2020-01-23 17:08:35.502434-08
30	Do Something	will be deleted soon	2	2020-01-27 16:12:51.264054-08
31	3rd Routine	will be deleted soon	2	2020-01-27 16:20:44.862531-08
32	What	will be deleted soon	2	2020-01-27 16:21:18.697331-08
33	Whaat	will be deleted soon	2	2020-01-27 16:28:18.80463-08
34	Whaaat	will be deleted soon	2	2020-01-27 16:28:52.696937-08
35	Test Test	will be deleted soon	2	2020-01-27 16:29:32.59707-08
36	New Routine 2	will be deleted soon	2	2020-01-27 16:56:01.386911-08
37	Routine 3	will be deleted soon	2	2020-01-27 16:56:55.865789-08
38	Routine 4	will be deleted soon	2	2020-01-27 16:57:53.739035-08
39	Routine 50	will be deleted soon	2	2020-01-27 16:59:20.236579-08
40	Routine 5	will be deleted soon	2	2020-01-27 17:01:32.577093-08
41	Routine 6	will be deleted soon	2	2020-01-27 17:05:46.190598-08
42	Routine 7	will be deleted soon	2	2020-01-27 17:09:29.935714-08
43	Routine 8	will be deleted soon	2	2020-01-27 17:12:07.438045-08
44	Routine 9	will be deleted soon	2	2020-01-27 17:16:46.605214-08
45	Routine 10	will be deleted soon	2	2020-01-27 17:20:44.599751-08
46	Routine 11	will be deleted soon	2	2020-01-27 17:21:57.335827-08
47	Routine 12	will be deleted soon	2	2020-01-27 17:23:09.404007-08
48	Routine 15	will be deleted soon	2	2020-01-27 17:25:15.506894-08
49	Routine 18	will be deleted soon	2	2020-01-27 17:29:09.742009-08
50	Routine 20	will be deleted soon	2	2020-01-27 17:29:22.777183-08
51	Routine 21	will be deleted soon	2	2020-01-27 17:30:17.567357-08
52	Routine 22	will be deleted soon	2	2020-01-27 17:30:44.448458-08
53	Routine 23	will be deleted soon	2	2020-01-27 17:31:18.188805-08
54	Routine 24	will be deleted soon	2	2020-01-27 17:31:48.746473-08
55	Routine 25	will be deleted soon	2	2020-01-27 17:32:54.059559-08
56	Routine 26	will be deleted soon	2	2020-01-27 17:35:05.586432-08
57	Routine 27	will be deleted soon	2	2020-01-27 17:39:52.425517-08
58	Routine 28	will be deleted soon	2	2020-01-27 17:40:28.742199-08
59	Routine 29	will be deleted soon	2	2020-01-27 17:41:23.06054-08
60	Routine 30	will be deleted soon	2	2020-01-27 17:42:08.570424-08
61	Routine 31	will be deleted soon	2	2020-01-27 17:42:47.004388-08
62	Routine32	will be deleted soon	2	2020-01-27 17:43:21.647801-08
63	Routine 33	will be deleted soon	2	2020-01-27 17:43:39.069075-08
64	Routine 34	will be deleted soon	2	2020-01-27 17:44:28.327363-08
65	Routine 35	will be deleted soon	2	2020-01-27 17:44:49.795811-08
66	Routine 36	will be deleted soon	2	2020-01-27 17:44:58.15652-08
67	Routine 37	will be deleted soon	2	2020-01-27 17:45:09.445098-08
68	Routine 38	will be deleted soon	2	2020-01-27 17:45:16.957845-08
69	Routine 39	will be deleted soon	2	2020-01-27 17:46:25.389541-08
70	Routine 40	will be deleted soon	2	2020-01-27 17:46:36.357838-08
71	Routine 41	will be deleted soon	2	2020-01-27 17:47:11.143955-08
72	Routine 42	will be deleted soon	2	2020-01-27 17:56:10.93429-08
73	Routine 43	will be deleted soon	2	2020-01-27 17:57:07.254867-08
74	Routine 44	will be deleted soon	2	2020-01-27 17:57:25.242774-08
75	Routine 45	will be deleted soon	2	2020-01-27 17:57:39.140018-08
76	Routine 46	will be deleted soon	2	2020-01-27 17:57:45.754473-08
77	Routine 47	will be deleted soon	2	2020-01-27 17:58:39.986659-08
78	Routine 48	will be deleted soon	2	2020-01-27 17:58:48.478316-08
79	Routine 49	will be deleted soon	2	2020-01-27 17:59:22.688383-08
80	Routine 51	will be deleted soon	2	2020-01-27 18:00:54.942422-08
81	Routine 52	will be deleted soon	2	2020-01-27 18:01:02.271827-08
82	Routine 53	will be deleted soon	2	2020-01-27 18:01:52.537769-08
83	Routine 54	will be deleted soon	2	2020-01-27 18:02:03.874255-08
84	Routine 55	will be deleted soon	2	2020-01-27 18:02:33.922693-08
85	Routine 56	will be deleted soon	2	2020-01-27 18:02:46.729091-08
86	Routine 58	will be deleted soon	2	2020-01-27 18:04:05.817971-08
87	Routine 59	will be deleted soon	2	2020-01-27 18:04:14.609865-08
88	Routine 60	will be deleted soon	2	2020-01-27 18:06:00.054538-08
89	Routine 61	will be deleted soon	2	2020-01-27 18:07:23.180393-08
90	Routine 62	will be deleted soon	2	2020-01-27 18:07:43.712543-08
91	Routine 63	will be deleted soon	2	2020-01-27 18:07:55.49091-08
92	Routine 64	will be deleted soon	2	2020-01-27 18:08:01.971183-08
93	Routine 65	will be deleted soon	2	2020-01-27 18:09:16.680928-08
94	Routine 66	will be deleted soon	2	2020-01-27 18:09:24.272534-08
95	Routine 68	will be deleted soon	2	2020-01-27 18:15:45.605314-08
96	Routine 69	will be deleted soon	2	2020-01-27 18:17:40.559232-08
97	Routine 70	will be deleted soon	2	2020-01-27 18:17:48.262727-08
98	Routine 71	will be deleted soon	2	2020-01-27 18:17:54.048985-08
99	Routine 72	will be deleted soon	2	2020-01-27 18:18:04.474059-08
100	Routine 73	will be deleted soon	2	2020-01-28 10:33:04.299027-08
101	Routine 74	will be deleted soon	2	2020-01-28 10:37:28.166275-08
102	Routine 75	will be deleted soon	2	2020-01-28 10:37:44.522025-08
103	Routine 76	will be deleted soon	2	2020-01-28 10:37:49.919718-08
104	Routine 77	will be deleted soon	2	2020-01-28 10:37:55.784652-08
105	Routine 78	will be deleted soon	2	2020-01-28 10:39:30.954206-08
106	Routine 79	will be deleted soon	2	2020-01-28 10:39:37.268283-08
107	Routine 80	will be deleted soon	2	2020-01-28 10:39:43.439203-08
108	Routine 81	will be deleted soon	2	2020-01-28 10:41:07.921823-08
109	Routine 82	will be deleted soon	2	2020-01-28 10:43:58.583022-08
110	Routine 83	will be deleted soon	2	2020-01-28 10:44:54.699904-08
111	Routine 84	will be deleted soon	2	2020-01-28 10:45:29.551264-08
112	Routine 85	will be deleted soon	2	2020-01-28 10:47:06.342628-08
113	Routine 86	will be deleted soon	2	2020-01-28 10:47:51.598296-08
114	Routine 87	will be deleted soon	2	2020-01-28 10:48:51.655551-08
115	Routine 88	will be deleted soon	2	2020-01-28 10:49:07.762641-08
116	Routine 89	will be deleted soon	2	2020-01-28 10:49:25.226742-08
117	Routine 90	will be deleted soon	2	2020-01-28 10:51:02.395138-08
118	Routine 91	will be deleted soon	2	2020-01-28 10:51:35.245007-08
119	Routine 92	will be deleted soon	2	2020-01-28 10:52:33.339828-08
120	Routine 93	will be deleted soon	2	2020-01-28 10:53:46.249961-08
121	Routine 94	will be deleted soon	2	2020-01-28 10:53:54.952687-08
122	Routine 95	will be deleted soon	2	2020-01-28 10:54:44.220403-08
123	Routine 96	will be deleted soon	2	2020-01-28 10:54:54.650602-08
124	Routine 97	will be deleted soon	2	2020-01-28 10:56:39.909155-08
125	Routine 98	will be deleted soon	2	2020-01-28 10:57:39.265476-08
126	Routine 99	will be deleted soon	2	2020-01-28 11:01:46.11437-08
\.


--
-- Data for Name: routineHabit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."routineHabit" ("routineId", "habitId", "createdAt") FROM stdin;
3	5	2020-01-27 15:14:51.773544-08
10	10	2020-01-27 15:47:48.650564-08
10	13	2020-01-27 15:48:35.132587-08
10	14	2020-01-27 16:07:09.503005-08
30	15	2020-01-27 16:13:04.972459-08
30	16	2020-01-27 16:19:50.093037-08
30	17	2020-01-27 16:21:06.182069-08
41	18	2020-01-27 17:13:19.869056-08
125	19	2020-01-28 11:00:58.162649-08
125	20	2020-01-28 11:01:24.896375-08
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" ("userId", "userName", email, "userPwd", "createdAt") FROM stdin;
1	bob	bob@imail.com	bob123	2020-01-22 11:49:27.832874-08
2	dob	dob@imail.com	dob456	2020-01-22 11:49:27.832874-08
3	rob	rob@rob.com	$2b$10$WxnZsSlraVVnBnSwq7wi4.kbWGvD9Xd2.uF3XObeIMDjCKbyEAnKW	2020-01-27 19:38:04.989298-08
\.


--
-- Data for Name: userHabit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."userHabit" ("userId", "routineId", "habitId", "timesCompleted", "lastCompleted", frequency, "nextCompletion", duration, "congratsMessage", "motivationalMessage", "createdAt") FROM stdin;
2	1	1	3	17:32:23.37984	1	2020-01-22	30 min	You went outside!	Get out...	2020-01-22 17:32:23.37984-08
2	2	2	5	17:32:23.37984	2	2020-01-22	1 hour	Stay hydrated!	Get some water...	2020-01-22 17:32:23.37984-08
1	2	3	7	17:32:23.37984	2	2020-01-22	1 hour	Get gains!	Hit the gym...	2020-01-22 17:32:23.37984-08
\.


--
-- Data for Name: userRoutine; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."userRoutine" ("receiverId", "senderId", "routineId", "routineName", "accepted?", "requestMessage", "createdAt") FROM stdin;
2	2	2	Be Healthy	\N	Stopb being a fatass	2020-01-22 12:33:50.164023-08
1	2	2	Be More Healthy	t	Stay healthy	2020-01-22 12:33:50.164023-08
2	2	125	Routine 98	t	Self-created routine	2020-01-28 10:57:39.281962-08
2	2	126	Routine 99	t	Self-created routine	2020-01-28 11:01:46.122812-08
2	1	3	Marathon	f	Dob be more productive	2020-01-22 12:33:50.164023-08
2	1	10	A Cooking Routine	t	Will be deleted soon	2020-01-24 12:26:57.159904-08
2	2	30	Do Something	t	Self-created routine	2020-01-27 16:12:51.275106-08
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

SELECT pg_catalog.setval('public."habit_habitId_seq"', 20, true);


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

SELECT pg_catalog.setval('public."routine_routineId_seq"', 126, true);


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

SELECT pg_catalog.setval('public."user_userId_seq"', 3, true);


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

