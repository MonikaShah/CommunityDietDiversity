--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: registration_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_city (
    id integer NOT NULL,
    city character varying(255) NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.registration_city OWNER TO postgres;

--
-- Name: registration_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_city_id_seq OWNER TO postgres;

--
-- Name: registration_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_city_id_seq OWNED BY public.registration_city.id;


--
-- Name: registration_education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_education (
    id integer NOT NULL,
    education character varying(255) NOT NULL
);


ALTER TABLE public.registration_education OWNER TO postgres;

--
-- Name: registration_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_education_id_seq OWNER TO postgres;

--
-- Name: registration_education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_education_id_seq OWNED BY public.registration_education.id;


--
-- Name: registration_familytype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_familytype (
    id integer NOT NULL,
    family character varying(255) NOT NULL
);


ALTER TABLE public.registration_familytype OWNER TO postgres;

--
-- Name: registration_familytype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_familytype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_familytype_id_seq OWNER TO postgres;

--
-- Name: registration_familytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_familytype_id_seq OWNED BY public.registration_familytype.id;


--
-- Name: registration_firstmodule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_firstmodule (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    tennis character varying(255) NOT NULL,
    cricket character varying(255) NOT NULL,
    chess character varying(255) NOT NULL,
    food character varying(255) NOT NULL,
    drinks character varying(255) NOT NULL
);


ALTER TABLE public.registration_firstmodule OWNER TO postgres;

--
-- Name: registration_firstmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_firstmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_firstmodule_id_seq OWNER TO postgres;

--
-- Name: registration_firstmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_firstmodule_id_seq OWNED BY public.registration_firstmodule.id;


--
-- Name: registration_form; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_form (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.registration_form OWNER TO postgres;

--
-- Name: registration_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_form_id_seq OWNER TO postgres;

--
-- Name: registration_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_form_id_seq OWNED BY public.registration_form.id;


--
-- Name: registration_formdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_formdetails (
    id integer NOT NULL,
    open boolean NOT NULL,
    pre boolean NOT NULL,
    start_timestamp timestamp with time zone NOT NULL,
    end_timestamp timestamp with time zone,
    form_id integer NOT NULL,
    teacher_id integer NOT NULL
);


ALTER TABLE public.registration_formdetails OWNER TO postgres;

--
-- Name: registration_formdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_formdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_formdetails_id_seq OWNER TO postgres;

--
-- Name: registration_formdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_formdetails_id_seq OWNED BY public.registration_formdetails.id;


--
-- Name: registration_moduleone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_moduleone (
    id integer NOT NULL,
    pre boolean NOT NULL,
    draft boolean NOT NULL,
    "nutriGarden" character varying(10),
    source_fruits_vegetables character varying(255),
    grow_own_food character varying(255),
    if_grow_what character varying(255),
    reason_gardening character varying(255),
    healthy_diet character varying(255),
    imp_nutrients character varying(255),
    citrus_fruits_blank character varying(255),
    not_richsource_iron character varying(255),
    "source_vitaminA" character varying(255),
    imp_eat_fruits_vegetables character varying(255),
    reason_wide_variety_food character varying(255),
    microgreen character varying(255),
    microgreen_example character varying(255),
    harvestdays_microgreen character varying(255),
    microgreen_grow_seeds_kitchen character varying(255),
    microgreen_nutritiousthan_fullgrownvegetables character varying(255),
    microgreen_immunity character varying(255),
    microgreen_variety character varying(255),
    microgreen_source character varying(255),
    newspaper_grow_microgreen character varying(255),
    microgreen_first_step character varying(255),
    soaking_time_seeds character varying(255),
    microgreen_watering character varying(255),
    microgreen_use character varying(255),
    submission_timestamp timestamp with time zone,
    student_id integer NOT NULL
);


ALTER TABLE public.registration_moduleone OWNER TO postgres;

--
-- Name: registration_moduleone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_moduleone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_moduleone_id_seq OWNER TO postgres;

--
-- Name: registration_moduleone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_moduleone_id_seq OWNED BY public.registration_moduleone.id;


--
-- Name: registration_occupation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_occupation (
    id integer NOT NULL,
    occupation character varying(255) NOT NULL
);


ALTER TABLE public.registration_occupation OWNER TO postgres;

--
-- Name: registration_occupation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_occupation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_occupation_id_seq OWNER TO postgres;

--
-- Name: registration_occupation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_occupation_id_seq OWNED BY public.registration_occupation.id;


--
-- Name: registration_parentsinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_parentsinfo (
    id integer NOT NULL,
    email bytea NOT NULL,
    consent boolean NOT NULL,
    name bytea NOT NULL,
    gender character varying(255) NOT NULL,
    age integer NOT NULL,
    address character varying(255) NOT NULL,
    pincode integer NOT NULL,
    no_of_family_members integer NOT NULL,
    children_count integer NOT NULL,
    first_password character varying(20) NOT NULL,
    password_changed boolean NOT NULL,
    city_id integer NOT NULL,
    edu_id integer NOT NULL,
    occupation_id integer NOT NULL,
    religion_id integer NOT NULL,
    state_id integer NOT NULL,
    type_of_family_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.registration_parentsinfo OWNER TO postgres;

--
-- Name: registration_parentsinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_parentsinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_parentsinfo_id_seq OWNER TO postgres;

--
-- Name: registration_parentsinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_parentsinfo_id_seq OWNED BY public.registration_parentsinfo.id;


--
-- Name: registration_religiousbelief; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_religiousbelief (
    id integer NOT NULL,
    religion character varying(255) NOT NULL
);


ALTER TABLE public.registration_religiousbelief OWNER TO postgres;

--
-- Name: registration_religiousbelief_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_religiousbelief_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_religiousbelief_id_seq OWNER TO postgres;

--
-- Name: registration_religiousbelief_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_religiousbelief_id_seq OWNED BY public.registration_religiousbelief.id;


--
-- Name: registration_school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_school (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(255) NOT NULL,
    pincode integer NOT NULL,
    city_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.registration_school OWNER TO postgres;

--
-- Name: registration_school_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_school_id_seq OWNER TO postgres;

--
-- Name: registration_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_school_id_seq OWNED BY public.registration_school.id;


--
-- Name: registration_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_state (
    id integer NOT NULL,
    state character varying(255) NOT NULL
);


ALTER TABLE public.registration_state OWNER TO postgres;

--
-- Name: registration_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_state_id_seq OWNER TO postgres;

--
-- Name: registration_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_state_id_seq OWNED BY public.registration_state.id;


--
-- Name: registration_studentsinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_studentsinfo (
    id integer NOT NULL,
    name bytea NOT NULL,
    address character varying(255) NOT NULL,
    rollno integer NOT NULL,
    gender character varying(255) NOT NULL,
    dob date NOT NULL,
    first_password character varying(20) NOT NULL,
    password_changed boolean NOT NULL,
    parent_id integer NOT NULL,
    school_id integer NOT NULL,
    teacher_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.registration_studentsinfo OWNER TO postgres;

--
-- Name: registration_studentsinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_studentsinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_studentsinfo_id_seq OWNER TO postgres;

--
-- Name: registration_studentsinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_studentsinfo_id_seq OWNED BY public.registration_studentsinfo.id;


--
-- Name: registration_teacherincharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_teacherincharge (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    school_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.registration_teacherincharge OWNER TO postgres;

--
-- Name: registration_teacherincharge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_teacherincharge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_teacherincharge_id_seq OWNER TO postgres;

--
-- Name: registration_teacherincharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_teacherincharge_id_seq OWNED BY public.registration_teacherincharge.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: registration_city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_city ALTER COLUMN id SET DEFAULT nextval('public.registration_city_id_seq'::regclass);


--
-- Name: registration_education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_education ALTER COLUMN id SET DEFAULT nextval('public.registration_education_id_seq'::regclass);


--
-- Name: registration_familytype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_familytype ALTER COLUMN id SET DEFAULT nextval('public.registration_familytype_id_seq'::regclass);


--
-- Name: registration_firstmodule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_firstmodule ALTER COLUMN id SET DEFAULT nextval('public.registration_firstmodule_id_seq'::regclass);


--
-- Name: registration_form id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_form ALTER COLUMN id SET DEFAULT nextval('public.registration_form_id_seq'::regclass);


--
-- Name: registration_formdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_formdetails ALTER COLUMN id SET DEFAULT nextval('public.registration_formdetails_id_seq'::regclass);


--
-- Name: registration_moduleone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_moduleone ALTER COLUMN id SET DEFAULT nextval('public.registration_moduleone_id_seq'::regclass);


--
-- Name: registration_occupation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_occupation ALTER COLUMN id SET DEFAULT nextval('public.registration_occupation_id_seq'::regclass);


--
-- Name: registration_parentsinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo ALTER COLUMN id SET DEFAULT nextval('public.registration_parentsinfo_id_seq'::regclass);


--
-- Name: registration_religiousbelief id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_religiousbelief ALTER COLUMN id SET DEFAULT nextval('public.registration_religiousbelief_id_seq'::regclass);


--
-- Name: registration_school id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_school ALTER COLUMN id SET DEFAULT nextval('public.registration_school_id_seq'::regclass);


--
-- Name: registration_state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_state ALTER COLUMN id SET DEFAULT nextval('public.registration_state_id_seq'::regclass);


--
-- Name: registration_studentsinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo ALTER COLUMN id SET DEFAULT nextval('public.registration_studentsinfo_id_seq'::regclass);


--
-- Name: registration_teacherincharge id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_teacherincharge ALTER COLUMN id SET DEFAULT nextval('public.registration_teacherincharge_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: registration_city registration_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_city
    ADD CONSTRAINT registration_city_pkey PRIMARY KEY (id);


--
-- Name: registration_education registration_education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_education
    ADD CONSTRAINT registration_education_pkey PRIMARY KEY (id);


--
-- Name: registration_familytype registration_familytype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_familytype
    ADD CONSTRAINT registration_familytype_pkey PRIMARY KEY (id);


--
-- Name: registration_firstmodule registration_firstmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_firstmodule
    ADD CONSTRAINT registration_firstmodule_pkey PRIMARY KEY (id);


--
-- Name: registration_form registration_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_form
    ADD CONSTRAINT registration_form_pkey PRIMARY KEY (id);


--
-- Name: registration_formdetails registration_formdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_formdetails
    ADD CONSTRAINT registration_formdetails_pkey PRIMARY KEY (id);


--
-- Name: registration_moduleone registration_moduleone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_moduleone
    ADD CONSTRAINT registration_moduleone_pkey PRIMARY KEY (id);


--
-- Name: registration_occupation registration_occupation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_occupation
    ADD CONSTRAINT registration_occupation_pkey PRIMARY KEY (id);


--
-- Name: registration_parentsinfo registration_parentsinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parentsinfo_pkey PRIMARY KEY (id);


--
-- Name: registration_parentsinfo registration_parentsinfo_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parentsinfo_user_id_key UNIQUE (user_id);


--
-- Name: registration_religiousbelief registration_religiousbelief_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_religiousbelief
    ADD CONSTRAINT registration_religiousbelief_pkey PRIMARY KEY (id);


--
-- Name: registration_school registration_school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_school
    ADD CONSTRAINT registration_school_pkey PRIMARY KEY (id);


--
-- Name: registration_state registration_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_state
    ADD CONSTRAINT registration_state_pkey PRIMARY KEY (id);


--
-- Name: registration_studentsinfo registration_studentsinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo
    ADD CONSTRAINT registration_studentsinfo_pkey PRIMARY KEY (id);


--
-- Name: registration_studentsinfo registration_studentsinfo_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo
    ADD CONSTRAINT registration_studentsinfo_user_id_key UNIQUE (user_id);


--
-- Name: registration_teacherincharge registration_teacherincharge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_teacherincharge
    ADD CONSTRAINT registration_teacherincharge_pkey PRIMARY KEY (id);


--
-- Name: registration_teacherincharge registration_teacherincharge_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_teacherincharge
    ADD CONSTRAINT registration_teacherincharge_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: registration_city_state_id_7ad767e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_city_state_id_7ad767e8 ON public.registration_city USING btree (state_id);


--
-- Name: registration_formdetails_form_id_b5a26230; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_formdetails_form_id_b5a26230 ON public.registration_formdetails USING btree (form_id);


--
-- Name: registration_formdetails_teacher_id_7f667529; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_formdetails_teacher_id_7f667529 ON public.registration_formdetails USING btree (teacher_id);


--
-- Name: registration_moduleone_student_id_6df8e911; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_moduleone_student_id_6df8e911 ON public.registration_moduleone USING btree (student_id);


--
-- Name: registration_parentsinfo_city_id_acbd0e86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_parentsinfo_city_id_acbd0e86 ON public.registration_parentsinfo USING btree (city_id);


--
-- Name: registration_parentsinfo_edu_id_86556239; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_parentsinfo_edu_id_86556239 ON public.registration_parentsinfo USING btree (edu_id);


--
-- Name: registration_parentsinfo_occupation_id_3ae90877; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_parentsinfo_occupation_id_3ae90877 ON public.registration_parentsinfo USING btree (occupation_id);


--
-- Name: registration_parentsinfo_religion_id_4eac561d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_parentsinfo_religion_id_4eac561d ON public.registration_parentsinfo USING btree (religion_id);


--
-- Name: registration_parentsinfo_state_id_32cacd4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_parentsinfo_state_id_32cacd4e ON public.registration_parentsinfo USING btree (state_id);


--
-- Name: registration_parentsinfo_type_of_family_id_581a2072; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_parentsinfo_type_of_family_id_581a2072 ON public.registration_parentsinfo USING btree (type_of_family_id);


--
-- Name: registration_school_city_id_5cf5c0a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_school_city_id_5cf5c0a9 ON public.registration_school USING btree (city_id);


--
-- Name: registration_school_state_id_e924f13d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_school_state_id_e924f13d ON public.registration_school USING btree (state_id);


--
-- Name: registration_studentsinfo_parent_id_abdf84e4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_studentsinfo_parent_id_abdf84e4 ON public.registration_studentsinfo USING btree (parent_id);


--
-- Name: registration_studentsinfo_school_id_3de74945; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_studentsinfo_school_id_3de74945 ON public.registration_studentsinfo USING btree (school_id);


--
-- Name: registration_studentsinfo_teacher_id_2ea7b712; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_studentsinfo_teacher_id_2ea7b712 ON public.registration_studentsinfo USING btree (teacher_id);


--
-- Name: registration_teacherincharge_school_id_cbb8d8b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX registration_teacherincharge_school_id_cbb8d8b6 ON public.registration_teacherincharge USING btree (school_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_city registration_city_state_id_7ad767e8_fk_registration_state_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_city
    ADD CONSTRAINT registration_city_state_id_7ad767e8_fk_registration_state_id FOREIGN KEY (state_id) REFERENCES public.registration_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_formdetails registration_formdet_form_id_b5a26230_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_formdetails
    ADD CONSTRAINT registration_formdet_form_id_b5a26230_fk_registrat FOREIGN KEY (form_id) REFERENCES public.registration_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_formdetails registration_formdet_teacher_id_7f667529_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_formdetails
    ADD CONSTRAINT registration_formdet_teacher_id_7f667529_fk_registrat FOREIGN KEY (teacher_id) REFERENCES public.registration_teacherincharge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_moduleone registration_moduleo_student_id_6df8e911_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_moduleone
    ADD CONSTRAINT registration_moduleo_student_id_6df8e911_fk_registrat FOREIGN KEY (student_id) REFERENCES public.registration_studentsinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parents_city_id_acbd0e86_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parents_city_id_acbd0e86_fk_registrat FOREIGN KEY (city_id) REFERENCES public.registration_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parents_edu_id_86556239_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parents_edu_id_86556239_fk_registrat FOREIGN KEY (edu_id) REFERENCES public.registration_education(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parents_occupation_id_3ae90877_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parents_occupation_id_3ae90877_fk_registrat FOREIGN KEY (occupation_id) REFERENCES public.registration_occupation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parents_religion_id_4eac561d_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parents_religion_id_4eac561d_fk_registrat FOREIGN KEY (religion_id) REFERENCES public.registration_religiousbelief(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parents_state_id_32cacd4e_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parents_state_id_32cacd4e_fk_registrat FOREIGN KEY (state_id) REFERENCES public.registration_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parents_type_of_family_id_581a2072_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parents_type_of_family_id_581a2072_fk_registrat FOREIGN KEY (type_of_family_id) REFERENCES public.registration_familytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_parentsinfo registration_parentsinfo_user_id_7e287518_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_parentsinfo
    ADD CONSTRAINT registration_parentsinfo_user_id_7e287518_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_school registration_school_city_id_5cf5c0a9_fk_registration_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_school
    ADD CONSTRAINT registration_school_city_id_5cf5c0a9_fk_registration_city_id FOREIGN KEY (city_id) REFERENCES public.registration_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_school registration_school_state_id_e924f13d_fk_registration_state_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_school
    ADD CONSTRAINT registration_school_state_id_e924f13d_fk_registration_state_id FOREIGN KEY (state_id) REFERENCES public.registration_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_studentsinfo registration_student_parent_id_abdf84e4_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo
    ADD CONSTRAINT registration_student_parent_id_abdf84e4_fk_registrat FOREIGN KEY (parent_id) REFERENCES public.registration_parentsinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_studentsinfo registration_student_school_id_3de74945_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo
    ADD CONSTRAINT registration_student_school_id_3de74945_fk_registrat FOREIGN KEY (school_id) REFERENCES public.registration_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_studentsinfo registration_student_teacher_id_2ea7b712_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo
    ADD CONSTRAINT registration_student_teacher_id_2ea7b712_fk_registrat FOREIGN KEY (teacher_id) REFERENCES public.registration_teacherincharge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_studentsinfo registration_studentsinfo_user_id_a7efb689_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_studentsinfo
    ADD CONSTRAINT registration_studentsinfo_user_id_a7efb689_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_teacherincharge registration_teacher_school_id_cbb8d8b6_fk_registrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_teacherincharge
    ADD CONSTRAINT registration_teacher_school_id_cbb8d8b6_fk_registrat FOREIGN KEY (school_id) REFERENCES public.registration_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_teacherincharge registration_teacherincharge_user_id_52f272bb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_teacherincharge
    ADD CONSTRAINT registration_teacherincharge_user_id_52f272bb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

