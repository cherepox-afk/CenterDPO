--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2026-06-01 17:32:58

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 24640)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    course_id_code character varying(20) NOT NULL,
    program_id integer NOT NULL,
    start_date date,
    end_date date,
    max_students integer DEFAULT 20
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24639)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 227
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 230 (class 1259 OID 24655)
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying,
    attestation character varying(20)
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24654)
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollments_id_seq OWNER TO postgres;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 229
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollments_id_seq OWNED BY public.enrollments.id;


--
-- TOC entry 234 (class 1259 OID 24692)
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_id integer NOT NULL,
    teacher_id integer NOT NULL,
    course_id integer NOT NULL,
    grade integer,
    date date DEFAULT CURRENT_DATE,
    CONSTRAINT ck_grades_grade CHECK (((grade >= 1) AND (grade <= 5)))
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24691)
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_id_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 233
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- TOC entry 226 (class 1259 OID 24628)
-- Name: programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programs (
    id integer NOT NULL,
    program_id_code character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    duration_hours integer,
    category character varying(100),
    CONSTRAINT ck_programs_duration_hours CHECK ((duration_hours > 0))
);


ALTER TABLE public.programs OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24627)
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programs_id_seq OWNER TO postgres;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 225
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- TOC entry 218 (class 1259 OID 24582)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    permissions text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24581)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 222 (class 1259 OID 24610)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    birth_date date,
    gender character varying(10),
    phone character varying(20),
    email character varying(100),
    student_id_code character varying(20) NOT NULL,
    registration_date date
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24609)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 224 (class 1259 OID 24619)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    birth_date date,
    gender character varying(10),
    phone character varying(20),
    email character varying(100),
    teacher_id_code character varying(20) NOT NULL,
    hire_date date,
    specialization character varying(100)
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24618)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 223
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 232 (class 1259 OID 24673)
-- Name: teaching; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teaching (
    id integer NOT NULL,
    teacher_id integer NOT NULL,
    course_id integer NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying,
    assignment_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.teaching OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24672)
-- Name: teaching_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teaching_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teaching_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 231
-- Name: teaching_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teaching_id_seq OWNED BY public.teaching.id;


--
-- TOC entry 220 (class 1259 OID 24594)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    status character varying(20) DEFAULT 'active'::character varying,
    registration_date date DEFAULT CURRENT_DATE,
    last_login timestamp without time zone,
    last_logout timestamp without time zone,
    role_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24593)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4689 (class 2604 OID 24643)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 24658)
-- Name: enrollments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN id SET DEFAULT nextval('public.enrollments_id_seq'::regclass);


--
-- TOC entry 4696 (class 2604 OID 24695)
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 24631)
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 24585)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4686 (class 2604 OID 24613)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 4687 (class 2604 OID 24622)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 24676)
-- Name: teaching id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaching ALTER COLUMN id SET DEFAULT nextval('public.teaching_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 24597)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4895 (class 0 OID 24640)
-- Dependencies: 228
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses (id, course_id_code, program_id, start_date, end_date, max_students) VALUES (1, 'C001', 1, '2024-09-10', '2024-12-20', 25);
INSERT INTO public.courses (id, course_id_code, program_id, start_date, end_date, max_students) VALUES (2, 'C002', 2, '2024-10-01', '2025-01-30', 20);
INSERT INTO public.courses (id, course_id_code, program_id, start_date, end_date, max_students) VALUES (3, 'C003', 3, '2024-11-15', '2025-03-15', 30);
INSERT INTO public.courses (id, course_id_code, program_id, start_date, end_date, max_students) VALUES (4, 'C004', 4, '2025-02-01', '2025-05-30', 15);
INSERT INTO public.courses (id, course_id_code, program_id, start_date, end_date, max_students) VALUES (5, 'C005', 5, '2025-03-10', '2025-06-20', 20);


--
-- TOC entry 4897 (class 0 OID 24655)
-- Dependencies: 230
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (1, 1, 1, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (2, 2, 1, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (3, 3, 1, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (4, 4, 2, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (5, 5, 2, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (6, 6, 2, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (7, 7, 3, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (8, 8, 3, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (9, 9, 4, 'active', NULL);
INSERT INTO public.enrollments (id, student_id, course_id, status, attestation) VALUES (10, 10, 4, 'active', NULL);


--
-- TOC entry 4901 (class 0 OID 24692)
-- Dependencies: 234
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grades (id, student_id, teacher_id, course_id, grade, date) VALUES (1, 1, 1, 1, 5, '2024-12-15');
INSERT INTO public.grades (id, student_id, teacher_id, course_id, grade, date) VALUES (2, 2, 1, 1, 4, '2024-12-15');
INSERT INTO public.grades (id, student_id, teacher_id, course_id, grade, date) VALUES (3, 3, 1, 1, 5, '2024-12-15');
INSERT INTO public.grades (id, student_id, teacher_id, course_id, grade, date) VALUES (4, 4, 2, 2, 4, '2025-01-20');
INSERT INTO public.grades (id, student_id, teacher_id, course_id, grade, date) VALUES (5, 5, 2, 2, 5, '2025-01-20');
INSERT INTO public.grades (id, student_id, teacher_id, course_id, grade, date) VALUES (6, 6, 2, 2, 3, '2025-01-21');


--
-- TOC entry 4893 (class 0 OID 24628)
-- Dependencies: 226
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (1, 'P001', 'Основы Java', 'Изучение базового синтаксиса и ООП на Java', 120, 'IT');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (2, 'P002', 'Веб-разработка', 'HTML, CSS, JavaScript, серверные технологии', 200, 'IT');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (3, 'P003', 'Анализ данных', 'Работа с pandas, numpy, визуализация', 150, 'Аналитика');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (4, 'P004', 'Машинное обучение', 'Введение в ML, алгоритмы и практика', 180, 'AI');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (5, 'P005', 'Управление проектами', 'Методологии Agile, Scrum, Waterfall', 100, 'Управление');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (6, 'P006', 'Английский для IT', 'Технический английский, документация', 80, 'Языки');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (7, 'P007', 'Базы данных', 'SQL, PostgreSQL, проектирование БД', 140, 'IT');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (8, 'P008', 'Мобильная разработка', 'Android, Kotlin, основы интерфейсов', 160, 'IT');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (9, 'P009', 'Кибербезопасность', 'Основы защиты информации, сети', 130, 'Безопасность');
INSERT INTO public.programs (id, program_id_code, name, description, duration_hours, category) VALUES (10, 'P010', '3D-моделирование', 'Blender, создание персонажей', 90, 'Дизайн');


--
-- TOC entry 4885 (class 0 OID 24582)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, name, permissions) VALUES (1, 'Администратор', 'Все операции');
INSERT INTO public.roles (id, name, permissions) VALUES (2, 'Пользователь', 'Операции с курсами');
INSERT INTO public.roles (id, name, permissions) VALUES (3, 'Гость', 'Просмотр курсов');


--
-- TOC entry 4889 (class 0 OID 24610)
-- Dependencies: 222
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (1, 'Иванов', 'Иван', 'Иванович', '2000-05-12', 'Male', '89001234567', 'ivan@mail.ru', 'S001', '2023-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (2, 'Петрова', 'Анна', 'Сергеевна', '2001-11-23', 'Female', '89007654321', 'anna@mail.ru', 'S002', '2023-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (3, 'Сидоров', 'Петр', 'Алексеевич', '1999-08-30', 'Male', '89161231212', 'petr@mail.ru', 'S003', '2024-02-10');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (4, 'Козлова', 'Мария', 'Дмитриевна', '2000-02-14', 'Female', '89265554433', 'maria@mail.ru', 'S004', '2024-02-15');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (5, 'Морозов', 'Алексей', 'Игоревич', '2002-07-05', 'Male', '89038889900', 'alex@mail.ru', 'S005', '2024-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (6, 'Волкова', 'Елена', 'Андреевна', '2001-03-18', 'Female', '89115556677', 'elena@mail.ru', 'S006', '2024-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (7, 'Смирнов', 'Дмитрий', 'Сергеевич', '2000-11-30', 'Male', '89057778899', 'dmitry@mail.ru', 'S007', '2024-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (8, 'Федорова', 'Ольга', 'Павловна', '1999-06-22', 'Female', '89163332211', 'olga@mail.ru', 'S008', '2024-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (9, 'Николаев', 'Сергей', 'Васильевич', '2001-01-10', 'Male', '89098887766', 'sergey@mail.ru', 'S009', '2024-09-01');
INSERT INTO public.students (id, last_name, first_name, middle_name, birth_date, gender, phone, email, student_id_code, registration_date) VALUES (10, 'Ковалева', 'Анастасия', 'Ильинична', '2002-09-05', 'Female', '89124443355', 'anastasia@mail.ru', 'S010', '2024-09-01');


--
-- TOC entry 4891 (class 0 OID 24619)
-- Dependencies: 224
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (1, 'Смирнов', 'Алексей', 'Викторович', '1980-03-15', 'Male', '89031112233', 'smirnov@mail.ru', 'T001', '2015-09-01', 'Программирование');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (2, 'Козлова', 'Елена', 'Игоревна', '1975-07-22', 'Female', '89035556677', 'kozlova@mail.ru', 'T002', '2012-02-10', 'Математика');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (3, 'Федоров', 'Денис', 'Андреевич', '1985-11-05', 'Male', '89038889900', 'fedorov@mail.ru', 'T003', '2018-01-15', 'Физика');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (4, 'Григорьев', 'Павел', 'Сергеевич', '1978-05-10', 'Male', '89039990011', 'grin@mail.ru', 'T004', '2005-06-20', 'Информатика');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (5, 'Васильева', 'Ольга', 'Николаевна', '1982-12-01', 'Female', '89034445566', 'vasil@mail.ru', 'T005', '2010-09-01', 'Английский язык');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (6, 'Романов', 'Игорь', 'Дмитриевич', '1976-08-17', 'Male', '89032221100', 'romanov@mail.ru', 'T006', '2013-03-10', 'История');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (7, 'Богданова', 'Марина', 'Алексеевна', '1983-04-25', 'Female', '89035557788', 'bogdanova@mail.ru', 'T007', '2016-09-01', 'Химия');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (8, 'Тимофеев', 'Андрей', 'Владимирович', '1979-09-09', 'Male', '89036669900', 'timofeev@mail.ru', 'T008', '2011-02-20', 'Биология');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (9, 'Иванова', 'Татьяна', 'Петровна', '1981-06-14', 'Female', '89037778811', 'ivanova_t@mail.ru', 'T009', '2014-09-01', 'География');
INSERT INTO public.teachers (id, last_name, first_name, middle_name, birth_date, gender, phone, email, teacher_id_code, hire_date, specialization) VALUES (10, 'Кузнецов', 'Виктор', 'Иванович', '1977-11-30', 'Male', '89033334455', 'kuznetsov@mail.ru', 'T010', '2009-01-10', 'Экономика');


--
-- TOC entry 4899 (class 0 OID 24673)
-- Dependencies: 232
-- Data for Name: teaching; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teaching (id, teacher_id, course_id, status, assignment_date) VALUES (1, 1, 1, 'active', '2024-09-01');
INSERT INTO public.teaching (id, teacher_id, course_id, status, assignment_date) VALUES (2, 2, 2, 'active', '2024-09-15');
INSERT INTO public.teaching (id, teacher_id, course_id, status, assignment_date) VALUES (3, 3, 3, 'active', '2024-10-20');
INSERT INTO public.teaching (id, teacher_id, course_id, status, assignment_date) VALUES (4, 4, 4, 'active', '2025-01-10');
INSERT INTO public.teaching (id, teacher_id, course_id, status, assignment_date) VALUES (5, 5, 5, 'active', '2025-02-20');


--
-- TOC entry 4887 (class 0 OID 24594)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, login, password, last_name, first_name, middle_name, status, registration_date, last_login, last_logout, role_id) VALUES (1, 'admin', '111', 'Сергеев', 'Сергей', 'Сергеевич', 'active', '2026-06-01', NULL, NULL, 1);
INSERT INTO public.users (id, login, password, last_name, first_name, middle_name, status, registration_date, last_login, last_logout, role_id) VALUES (4, 'student1', '444', 'Студентов', 'Петр', 'Петрович', 'active', '2026-06-01', NULL, NULL, 2);
INSERT INTO public.users (id, login, password, last_name, first_name, middle_name, status, registration_date, last_login, last_logout, role_id) VALUES (5, 'student2', '555', 'Учаева', 'Анна', 'Сергеевна', 'active', '2026-06-01', NULL, NULL, 2);
INSERT INTO public.users (id, login, password, last_name, first_name, middle_name, status, registration_date, last_login, last_logout, role_id) VALUES (2, 'guest', '222', 'Гостев', 'Гость', 'Гостьевич', 'active', '2026-06-01', NULL, NULL, 2);
INSERT INTO public.users (id, login, password, last_name, first_name, middle_name, status, registration_date, last_login, last_logout, role_id) VALUES (6, 'sysadmin', '666', '1', '1', '1', 'active', '2026-06-01', NULL, NULL, 3);
INSERT INTO public.users (id, login, password, last_name, first_name, middle_name, status, registration_date, last_login, last_logout, role_id) VALUES (3, 'teacher1', '333', 'Преподавателев', 'Иван', 'Иванович', 'active', '2026-06-01', NULL, NULL, 1);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 227
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 5, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 229
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollments_id_seq', 10, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 233
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grades_id_seq', 6, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 225
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programs_id_seq', 10, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 10, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 10, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 231
-- Name: teaching_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teaching_id_seq', 5, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- TOC entry 4721 (class 2606 OID 24646)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4725 (class 2606 OID 24661)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 24699)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- TOC entry 4717 (class 2606 OID 24636)
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 24590)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 24615)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4713 (class 2606 OID 24624)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 4727 (class 2606 OID 24680)
-- Name: teaching teaching_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaching
    ADD CONSTRAINT teaching_pkey PRIMARY KEY (id);


--
-- TOC entry 4723 (class 2606 OID 24648)
-- Name: courses uq_courses_course_id_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT uq_courses_course_id_code UNIQUE (course_id_code);


--
-- TOC entry 4719 (class 2606 OID 24638)
-- Name: programs uq_programs_program_id_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT uq_programs_program_id_code UNIQUE (program_id_code);


--
-- TOC entry 4703 (class 2606 OID 24592)
-- Name: roles uq_roles_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uq_roles_name UNIQUE (name);


--
-- TOC entry 4711 (class 2606 OID 24617)
-- Name: students uq_students_student_id_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT uq_students_student_id_code UNIQUE (student_id_code);


--
-- TOC entry 4715 (class 2606 OID 24626)
-- Name: teachers uq_teachers_teacher_id_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT uq_teachers_teacher_id_code UNIQUE (teacher_id_code);


--
-- TOC entry 4705 (class 2606 OID 24603)
-- Name: users uq_users_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_login UNIQUE (login);


--
-- TOC entry 4707 (class 2606 OID 24601)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 24649)
-- Name: courses fk_courses_program; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_program FOREIGN KEY (program_id) REFERENCES public.programs(id) ON DELETE RESTRICT;


--
-- TOC entry 4732 (class 2606 OID 24667)
-- Name: enrollments fk_enrollments_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_enrollments_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4733 (class 2606 OID 24662)
-- Name: enrollments fk_enrollments_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_enrollments_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4736 (class 2606 OID 24710)
-- Name: grades fk_grades_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4737 (class 2606 OID 24700)
-- Name: grades fk_grades_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4738 (class 2606 OID 24705)
-- Name: grades fk_grades_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT fk_grades_teacher FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- TOC entry 4734 (class 2606 OID 24686)
-- Name: teaching fk_teaching_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaching
    ADD CONSTRAINT fk_teaching_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4735 (class 2606 OID 24681)
-- Name: teaching fk_teaching_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaching
    ADD CONSTRAINT fk_teaching_teacher FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- TOC entry 4730 (class 2606 OID 24604)
-- Name: users fk_users_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE RESTRICT;


-- Completed on 2026-06-01 17:32:58

--
-- PostgreSQL database dump complete
--

