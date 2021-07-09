PGDMP     5    5        	        y            test #   12.7 (Ubuntu 12.7-0ubuntu0.20.04.1) #   12.7 (Ubuntu 12.7-0ubuntu0.20.04.1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17209    test    DATABASE     j   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_IN' LC_CTYPE = 'en_IN';
    DROP DATABASE test;
                postgres    false            �            1259    17337    accounts_city    TABLE     �   CREATE TABLE public.accounts_city (
    id bigint NOT NULL,
    city character varying(255) NOT NULL,
    state_id bigint NOT NULL
);
 !   DROP TABLE public.accounts_city;
       public         heap    postgres    false            �            1259    17335    accounts_city_id_seq    SEQUENCE     }   CREATE SEQUENCE public.accounts_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_city_id_seq;
       public          postgres    false    219            �           0    0    accounts_city_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_city_id_seq OWNED BY public.accounts_city.id;
          public          postgres    false    218            �            1259    17345    accounts_education    TABLE     r   CREATE TABLE public.accounts_education (
    id bigint NOT NULL,
    education character varying(255) NOT NULL
);
 &   DROP TABLE public.accounts_education;
       public         heap    postgres    false            �            1259    17343    accounts_education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.accounts_education_id_seq;
       public          postgres    false    221            �           0    0    accounts_education_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.accounts_education_id_seq OWNED BY public.accounts_education.id;
          public          postgres    false    220            �            1259    17353    accounts_familytype    TABLE     p   CREATE TABLE public.accounts_familytype (
    id bigint NOT NULL,
    family character varying(255) NOT NULL
);
 '   DROP TABLE public.accounts_familytype;
       public         heap    postgres    false            �            1259    17351    accounts_familytype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_familytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.accounts_familytype_id_seq;
       public          postgres    false    223            �           0    0    accounts_familytype_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.accounts_familytype_id_seq OWNED BY public.accounts_familytype.id;
          public          postgres    false    222            �            1259    17361    accounts_firstmodule    TABLE     t  CREATE TABLE public.accounts_firstmodule (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    tennis character varying(255) NOT NULL,
    cricket character varying(255) NOT NULL,
    chess character varying(255) NOT NULL,
    food character varying(255) NOT NULL,
    drinks character varying(255) NOT NULL
);
 (   DROP TABLE public.accounts_firstmodule;
       public         heap    postgres    false            �            1259    17359    accounts_firstmodule_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_firstmodule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_firstmodule_id_seq;
       public          postgres    false    225            �           0    0    accounts_firstmodule_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_firstmodule_id_seq OWNED BY public.accounts_firstmodule.id;
          public          postgres    false    224            �            1259    17372    accounts_form    TABLE     h   CREATE TABLE public.accounts_form (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
 !   DROP TABLE public.accounts_form;
       public         heap    postgres    false            �            1259    17370    accounts_form_id_seq    SEQUENCE     }   CREATE SEQUENCE public.accounts_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_form_id_seq;
       public          postgres    false    227            �           0    0    accounts_form_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_form_id_seq OWNED BY public.accounts_form.id;
          public          postgres    false    226            �            1259    17484    accounts_formdetails    TABLE       CREATE TABLE public.accounts_formdetails (
    id bigint NOT NULL,
    open boolean NOT NULL,
    pre boolean NOT NULL,
    start_timestamp timestamp with time zone NOT NULL,
    end_timestamp timestamp with time zone,
    form_id bigint NOT NULL,
    teacher_id bigint NOT NULL
);
 (   DROP TABLE public.accounts_formdetails;
       public         heap    postgres    false            �            1259    17482    accounts_formdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_formdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_formdetails_id_seq;
       public          postgres    false    245            �           0    0    accounts_formdetails_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_formdetails_id_seq OWNED BY public.accounts_formdetails.id;
          public          postgres    false    244            �            1259    17473    accounts_moduleone    TABLE     �  CREATE TABLE public.accounts_moduleone (
    id bigint NOT NULL,
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
    student_id bigint NOT NULL
);
 &   DROP TABLE public.accounts_moduleone;
       public         heap    postgres    false            �            1259    17471    accounts_moduleone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_moduleone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.accounts_moduleone_id_seq;
       public          postgres    false    243            �           0    0    accounts_moduleone_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.accounts_moduleone_id_seq OWNED BY public.accounts_moduleone.id;
          public          postgres    false    242            �            1259    17380    accounts_occupation    TABLE     t   CREATE TABLE public.accounts_occupation (
    id bigint NOT NULL,
    occupation character varying(255) NOT NULL
);
 '   DROP TABLE public.accounts_occupation;
       public         heap    postgres    false            �            1259    17378    accounts_occupation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_occupation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.accounts_occupation_id_seq;
       public          postgres    false    229            �           0    0    accounts_occupation_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.accounts_occupation_id_seq OWNED BY public.accounts_occupation.id;
          public          postgres    false    228            �            1259    17388    accounts_parentsinfo    TABLE     �  CREATE TABLE public.accounts_parentsinfo (
    id bigint NOT NULL,
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
    city_id bigint NOT NULL,
    edu_id bigint NOT NULL,
    occupation_id bigint NOT NULL,
    religion_id bigint NOT NULL,
    state_id bigint NOT NULL,
    type_of_family_id bigint NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.accounts_parentsinfo;
       public         heap    postgres    false            �            1259    17386    accounts_parentsinfo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_parentsinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_parentsinfo_id_seq;
       public          postgres    false    231            �           0    0    accounts_parentsinfo_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_parentsinfo_id_seq OWNED BY public.accounts_parentsinfo.id;
          public          postgres    false    230            �            1259    17399    accounts_religiousbelief    TABLE     w   CREATE TABLE public.accounts_religiousbelief (
    id bigint NOT NULL,
    religion character varying(255) NOT NULL
);
 ,   DROP TABLE public.accounts_religiousbelief;
       public         heap    postgres    false            �            1259    17397    accounts_religiousbelief_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_religiousbelief_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.accounts_religiousbelief_id_seq;
       public          postgres    false    233            �           0    0    accounts_religiousbelief_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.accounts_religiousbelief_id_seq OWNED BY public.accounts_religiousbelief.id;
          public          postgres    false    232            �            1259    17407    accounts_school    TABLE     �   CREATE TABLE public.accounts_school (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(255) NOT NULL,
    pincode integer NOT NULL,
    city_id bigint NOT NULL,
    state_id bigint NOT NULL
);
 #   DROP TABLE public.accounts_school;
       public         heap    postgres    false            �            1259    17405    accounts_school_id_seq    SEQUENCE        CREATE SEQUENCE public.accounts_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.accounts_school_id_seq;
       public          postgres    false    235            �           0    0    accounts_school_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.accounts_school_id_seq OWNED BY public.accounts_school.id;
          public          postgres    false    234            �            1259    17415    accounts_state    TABLE     j   CREATE TABLE public.accounts_state (
    id bigint NOT NULL,
    state character varying(255) NOT NULL
);
 "   DROP TABLE public.accounts_state;
       public         heap    postgres    false            �            1259    17413    accounts_state_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.accounts_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accounts_state_id_seq;
       public          postgres    false    237            �           0    0    accounts_state_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accounts_state_id_seq OWNED BY public.accounts_state.id;
          public          postgres    false    236            �            1259    17433    accounts_studentsinfo    TABLE     �  CREATE TABLE public.accounts_studentsinfo (
    id bigint NOT NULL,
    name bytea NOT NULL,
    address character varying(255) NOT NULL,
    rollno integer NOT NULL,
    gender character varying(255) NOT NULL,
    dob date NOT NULL,
    first_password character varying(20) NOT NULL,
    password_changed boolean NOT NULL,
    parent_id bigint NOT NULL,
    school_id bigint NOT NULL,
    teacher_id bigint NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.accounts_studentsinfo;
       public         heap    postgres    false            �            1259    17431    accounts_studentsinfo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_studentsinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.accounts_studentsinfo_id_seq;
       public          postgres    false    241            �           0    0    accounts_studentsinfo_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.accounts_studentsinfo_id_seq OWNED BY public.accounts_studentsinfo.id;
          public          postgres    false    240            �            1259    17423    accounts_teacherincharge    TABLE     �   CREATE TABLE public.accounts_teacherincharge (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    school_id bigint NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.accounts_teacherincharge;
       public         heap    postgres    false            �            1259    17421    accounts_teacherincharge_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_teacherincharge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.accounts_teacherincharge_id_seq;
       public          postgres    false    239            �           0    0    accounts_teacherincharge_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.accounts_teacherincharge_id_seq OWNED BY public.accounts_teacherincharge.id;
          public          postgres    false    238            �            1259    17241 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    17239    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    17251    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    17249    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    17233    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    17231    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    17259 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    17269    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    17267    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    17257    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    17277    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    17275 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    17579    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    17577    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    247            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    246            �            1259    17223    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    17221    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    17212    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    17210    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    17610    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �           2604    17340    accounts_city id    DEFAULT     t   ALTER TABLE ONLY public.accounts_city ALTER COLUMN id SET DEFAULT nextval('public.accounts_city_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17348    accounts_education id    DEFAULT     ~   ALTER TABLE ONLY public.accounts_education ALTER COLUMN id SET DEFAULT nextval('public.accounts_education_id_seq'::regclass);
 D   ALTER TABLE public.accounts_education ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    17356    accounts_familytype id    DEFAULT     �   ALTER TABLE ONLY public.accounts_familytype ALTER COLUMN id SET DEFAULT nextval('public.accounts_familytype_id_seq'::regclass);
 E   ALTER TABLE public.accounts_familytype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    17364    accounts_firstmodule id    DEFAULT     �   ALTER TABLE ONLY public.accounts_firstmodule ALTER COLUMN id SET DEFAULT nextval('public.accounts_firstmodule_id_seq'::regclass);
 F   ALTER TABLE public.accounts_firstmodule ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    17375    accounts_form id    DEFAULT     t   ALTER TABLE ONLY public.accounts_form ALTER COLUMN id SET DEFAULT nextval('public.accounts_form_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_form ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    17487    accounts_formdetails id    DEFAULT     �   ALTER TABLE ONLY public.accounts_formdetails ALTER COLUMN id SET DEFAULT nextval('public.accounts_formdetails_id_seq'::regclass);
 F   ALTER TABLE public.accounts_formdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    17476    accounts_moduleone id    DEFAULT     ~   ALTER TABLE ONLY public.accounts_moduleone ALTER COLUMN id SET DEFAULT nextval('public.accounts_moduleone_id_seq'::regclass);
 D   ALTER TABLE public.accounts_moduleone ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    17383    accounts_occupation id    DEFAULT     �   ALTER TABLE ONLY public.accounts_occupation ALTER COLUMN id SET DEFAULT nextval('public.accounts_occupation_id_seq'::regclass);
 E   ALTER TABLE public.accounts_occupation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    17391    accounts_parentsinfo id    DEFAULT     �   ALTER TABLE ONLY public.accounts_parentsinfo ALTER COLUMN id SET DEFAULT nextval('public.accounts_parentsinfo_id_seq'::regclass);
 F   ALTER TABLE public.accounts_parentsinfo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    17402    accounts_religiousbelief id    DEFAULT     �   ALTER TABLE ONLY public.accounts_religiousbelief ALTER COLUMN id SET DEFAULT nextval('public.accounts_religiousbelief_id_seq'::regclass);
 J   ALTER TABLE public.accounts_religiousbelief ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    17410    accounts_school id    DEFAULT     x   ALTER TABLE ONLY public.accounts_school ALTER COLUMN id SET DEFAULT nextval('public.accounts_school_id_seq'::regclass);
 A   ALTER TABLE public.accounts_school ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    17418    accounts_state id    DEFAULT     v   ALTER TABLE ONLY public.accounts_state ALTER COLUMN id SET DEFAULT nextval('public.accounts_state_id_seq'::regclass);
 @   ALTER TABLE public.accounts_state ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    17436    accounts_studentsinfo id    DEFAULT     �   ALTER TABLE ONLY public.accounts_studentsinfo ALTER COLUMN id SET DEFAULT nextval('public.accounts_studentsinfo_id_seq'::regclass);
 G   ALTER TABLE public.accounts_studentsinfo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    17426    accounts_teacherincharge id    DEFAULT     �   ALTER TABLE ONLY public.accounts_teacherincharge ALTER COLUMN id SET DEFAULT nextval('public.accounts_teacherincharge_id_seq'::regclass);
 J   ALTER TABLE public.accounts_teacherincharge ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    17244    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    17254    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    17236    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    17262    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    17272    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    17280    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    17582    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            �           2604    17226    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    17215    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2606    17342     accounts_city accounts_city_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_city
    ADD CONSTRAINT accounts_city_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_city DROP CONSTRAINT accounts_city_pkey;
       public            postgres    false    219            �           2606    17350 *   accounts_education accounts_education_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_education
    ADD CONSTRAINT accounts_education_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_education DROP CONSTRAINT accounts_education_pkey;
       public            postgres    false    221            �           2606    17358 ,   accounts_familytype accounts_familytype_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accounts_familytype
    ADD CONSTRAINT accounts_familytype_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.accounts_familytype DROP CONSTRAINT accounts_familytype_pkey;
       public            postgres    false    223            �           2606    17369 .   accounts_firstmodule accounts_firstmodule_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_firstmodule
    ADD CONSTRAINT accounts_firstmodule_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_firstmodule DROP CONSTRAINT accounts_firstmodule_pkey;
       public            postgres    false    225            �           2606    17377     accounts_form accounts_form_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_form
    ADD CONSTRAINT accounts_form_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_form DROP CONSTRAINT accounts_form_pkey;
       public            postgres    false    227                       2606    17489 .   accounts_formdetails accounts_formdetails_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_formdetails
    ADD CONSTRAINT accounts_formdetails_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_formdetails DROP CONSTRAINT accounts_formdetails_pkey;
       public            postgres    false    245            	           2606    17481 *   accounts_moduleone accounts_moduleone_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_moduleone
    ADD CONSTRAINT accounts_moduleone_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_moduleone DROP CONSTRAINT accounts_moduleone_pkey;
       public            postgres    false    243            �           2606    17385 ,   accounts_occupation accounts_occupation_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accounts_occupation
    ADD CONSTRAINT accounts_occupation_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.accounts_occupation DROP CONSTRAINT accounts_occupation_pkey;
       public            postgres    false    229            �           2606    17396 .   accounts_parentsinfo accounts_parentsinfo_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_pkey;
       public            postgres    false    231            �           2606    17465 5   accounts_parentsinfo accounts_parentsinfo_user_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_user_id_key UNIQUE (user_id);
 _   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_user_id_key;
       public            postgres    false    231            �           2606    17404 6   accounts_religiousbelief accounts_religiousbelief_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.accounts_religiousbelief
    ADD CONSTRAINT accounts_religiousbelief_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.accounts_religiousbelief DROP CONSTRAINT accounts_religiousbelief_pkey;
       public            postgres    false    233            �           2606    17412 $   accounts_school accounts_school_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.accounts_school
    ADD CONSTRAINT accounts_school_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.accounts_school DROP CONSTRAINT accounts_school_pkey;
       public            postgres    false    235            �           2606    17420 "   accounts_state accounts_state_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accounts_state
    ADD CONSTRAINT accounts_state_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accounts_state DROP CONSTRAINT accounts_state_pkey;
       public            postgres    false    237                       2606    17441 0   accounts_studentsinfo accounts_studentsinfo_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.accounts_studentsinfo
    ADD CONSTRAINT accounts_studentsinfo_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.accounts_studentsinfo DROP CONSTRAINT accounts_studentsinfo_pkey;
       public            postgres    false    241                       2606    17443 7   accounts_studentsinfo accounts_studentsinfo_user_id_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.accounts_studentsinfo
    ADD CONSTRAINT accounts_studentsinfo_user_id_key UNIQUE (user_id);
 a   ALTER TABLE ONLY public.accounts_studentsinfo DROP CONSTRAINT accounts_studentsinfo_user_id_key;
       public            postgres    false    241            �           2606    17428 6   accounts_teacherincharge accounts_teacherincharge_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.accounts_teacherincharge
    ADD CONSTRAINT accounts_teacherincharge_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.accounts_teacherincharge DROP CONSTRAINT accounts_teacherincharge_pkey;
       public            postgres    false    239                        2606    17430 =   accounts_teacherincharge accounts_teacherincharge_user_id_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.accounts_teacherincharge
    ADD CONSTRAINT accounts_teacherincharge_user_id_key UNIQUE (user_id);
 g   ALTER TABLE ONLY public.accounts_teacherincharge DROP CONSTRAINT accounts_teacherincharge_user_id_key;
       public            postgres    false    239            �           2606    17608    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    17293 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    17256 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    17246    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    17284 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    17238 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            �           2606    17274 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            �           2606    17308 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �           2606    17264    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            �           2606    17282 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            �           2606    17322 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    17602     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213                       2606    17588 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    247            �           2606    17230 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    17228 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    17220 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203                       2606    17617 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    248            �           1259    17576    accounts_city_state_id_4ea0890d    INDEX     ]   CREATE INDEX accounts_city_state_id_4ea0890d ON public.accounts_city USING btree (state_id);
 3   DROP INDEX public.accounts_city_state_id_4ea0890d;
       public            postgres    false    219                       1259    17574 %   accounts_formdetails_form_id_583347cb    INDEX     i   CREATE INDEX accounts_formdetails_form_id_583347cb ON public.accounts_formdetails USING btree (form_id);
 9   DROP INDEX public.accounts_formdetails_form_id_583347cb;
       public            postgres    false    245                       1259    17575 (   accounts_formdetails_teacher_id_3170d2ac    INDEX     o   CREATE INDEX accounts_formdetails_teacher_id_3170d2ac ON public.accounts_formdetails USING btree (teacher_id);
 <   DROP INDEX public.accounts_formdetails_teacher_id_3170d2ac;
       public            postgres    false    245            
           1259    17563 &   accounts_moduleone_student_id_e84d5e39    INDEX     k   CREATE INDEX accounts_moduleone_student_id_e84d5e39 ON public.accounts_moduleone USING btree (student_id);
 :   DROP INDEX public.accounts_moduleone_student_id_e84d5e39;
       public            postgres    false    243            �           1259    17511 %   accounts_parentsinfo_city_id_ca7897b5    INDEX     i   CREATE INDEX accounts_parentsinfo_city_id_ca7897b5 ON public.accounts_parentsinfo USING btree (city_id);
 9   DROP INDEX public.accounts_parentsinfo_city_id_ca7897b5;
       public            postgres    false    231            �           1259    17512 $   accounts_parentsinfo_edu_id_1e1ae5cd    INDEX     g   CREATE INDEX accounts_parentsinfo_edu_id_1e1ae5cd ON public.accounts_parentsinfo USING btree (edu_id);
 8   DROP INDEX public.accounts_parentsinfo_edu_id_1e1ae5cd;
       public            postgres    false    231            �           1259    17513 +   accounts_parentsinfo_occupation_id_08faf90e    INDEX     u   CREATE INDEX accounts_parentsinfo_occupation_id_08faf90e ON public.accounts_parentsinfo USING btree (occupation_id);
 ?   DROP INDEX public.accounts_parentsinfo_occupation_id_08faf90e;
       public            postgres    false    231            �           1259    17555 )   accounts_parentsinfo_religion_id_cd422d93    INDEX     q   CREATE INDEX accounts_parentsinfo_religion_id_cd422d93 ON public.accounts_parentsinfo USING btree (religion_id);
 =   DROP INDEX public.accounts_parentsinfo_religion_id_cd422d93;
       public            postgres    false    231            �           1259    17556 &   accounts_parentsinfo_state_id_a68314bf    INDEX     k   CREATE INDEX accounts_parentsinfo_state_id_a68314bf ON public.accounts_parentsinfo USING btree (state_id);
 :   DROP INDEX public.accounts_parentsinfo_state_id_a68314bf;
       public            postgres    false    231            �           1259    17557 /   accounts_parentsinfo_type_of_family_id_6f2bf2d4    INDEX     }   CREATE INDEX accounts_parentsinfo_type_of_family_id_6f2bf2d4 ON public.accounts_parentsinfo USING btree (type_of_family_id);
 C   DROP INDEX public.accounts_parentsinfo_type_of_family_id_6f2bf2d4;
       public            postgres    false    231            �           1259    17519     accounts_school_city_id_1d798912    INDEX     _   CREATE INDEX accounts_school_city_id_1d798912 ON public.accounts_school USING btree (city_id);
 4   DROP INDEX public.accounts_school_city_id_1d798912;
       public            postgres    false    235            �           1259    17554 !   accounts_school_state_id_76dfa969    INDEX     a   CREATE INDEX accounts_school_state_id_76dfa969 ON public.accounts_school USING btree (state_id);
 5   DROP INDEX public.accounts_school_state_id_76dfa969;
       public            postgres    false    235                       1259    17551 (   accounts_studentsinfo_parent_id_fb54d7fb    INDEX     o   CREATE INDEX accounts_studentsinfo_parent_id_fb54d7fb ON public.accounts_studentsinfo USING btree (parent_id);
 <   DROP INDEX public.accounts_studentsinfo_parent_id_fb54d7fb;
       public            postgres    false    241                       1259    17552 (   accounts_studentsinfo_school_id_f10bb7b0    INDEX     o   CREATE INDEX accounts_studentsinfo_school_id_f10bb7b0 ON public.accounts_studentsinfo USING btree (school_id);
 <   DROP INDEX public.accounts_studentsinfo_school_id_f10bb7b0;
       public            postgres    false    241                       1259    17553 )   accounts_studentsinfo_teacher_id_614c3400    INDEX     q   CREATE INDEX accounts_studentsinfo_teacher_id_614c3400 ON public.accounts_studentsinfo USING btree (teacher_id);
 =   DROP INDEX public.accounts_studentsinfo_teacher_id_614c3400;
       public            postgres    false    241            �           1259    17530 +   accounts_teacherincharge_school_id_42d787d6    INDEX     u   CREATE INDEX accounts_teacherincharge_school_id_42d787d6 ON public.accounts_teacherincharge USING btree (school_id);
 ?   DROP INDEX public.accounts_teacherincharge_school_id_42d787d6;
       public            postgres    false    239            �           1259    17609    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    17304 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    17305 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    17290 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            �           1259    17320 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            �           1259    17319 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            �           1259    17334 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            �           1259    17333 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �           1259    17603     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213                       1259    17599 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    247                       1259    17600 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    247                       1259    17619 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    248                       1259    17618 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    248                       2606    17491 B   accounts_city accounts_city_state_id_4ea0890d_fk_accounts_state_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_city
    ADD CONSTRAINT accounts_city_state_id_4ea0890d_fk_accounts_state_id FOREIGN KEY (state_id) REFERENCES public.accounts_state(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.accounts_city DROP CONSTRAINT accounts_city_state_id_4ea0890d_fk_accounts_state_id;
       public          postgres    false    219    237    3067            /           2606    17564 N   accounts_formdetails accounts_formdetails_form_id_583347cb_fk_accounts_form_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_formdetails
    ADD CONSTRAINT accounts_formdetails_form_id_583347cb_fk_accounts_form_id FOREIGN KEY (form_id) REFERENCES public.accounts_form(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_formdetails DROP CONSTRAINT accounts_formdetails_form_id_583347cb_fk_accounts_form_id;
       public          postgres    false    227    3047    245            0           2606    17569 J   accounts_formdetails accounts_formdetails_teacher_id_3170d2ac_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_formdetails
    ADD CONSTRAINT accounts_formdetails_teacher_id_3170d2ac_fk_accounts_ FOREIGN KEY (teacher_id) REFERENCES public.accounts_teacherincharge(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.accounts_formdetails DROP CONSTRAINT accounts_formdetails_teacher_id_3170d2ac_fk_accounts_;
       public          postgres    false    245    239    3069            .           2606    17558 F   accounts_moduleone accounts_moduleone_student_id_e84d5e39_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_moduleone
    ADD CONSTRAINT accounts_moduleone_student_id_e84d5e39_fk_accounts_ FOREIGN KEY (student_id) REFERENCES public.accounts_studentsinfo(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_moduleone DROP CONSTRAINT accounts_moduleone_student_id_e84d5e39_fk_accounts_;
       public          postgres    false    3075    241    243            #           2606    17496 N   accounts_parentsinfo accounts_parentsinfo_city_id_ca7897b5_fk_accounts_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_city_id_ca7897b5_fk_accounts_city_id FOREIGN KEY (city_id) REFERENCES public.accounts_city(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_city_id_ca7897b5_fk_accounts_city_id;
       public          postgres    false    219    231    3038            $           2606    17501 R   accounts_parentsinfo accounts_parentsinfo_edu_id_1e1ae5cd_fk_accounts_education_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_edu_id_1e1ae5cd_fk_accounts_education_id FOREIGN KEY (edu_id) REFERENCES public.accounts_education(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_edu_id_1e1ae5cd_fk_accounts_education_id;
       public          postgres    false    231    3041    221            %           2606    17506 M   accounts_parentsinfo accounts_parentsinfo_occupation_id_08faf90e_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_occupation_id_08faf90e_fk_accounts_ FOREIGN KEY (occupation_id) REFERENCES public.accounts_occupation(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_occupation_id_08faf90e_fk_accounts_;
       public          postgres    false    229    3049    231                       2606    17449 K   accounts_parentsinfo accounts_parentsinfo_religion_id_cd422d93_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_religion_id_cd422d93_fk_accounts_ FOREIGN KEY (religion_id) REFERENCES public.accounts_religiousbelief(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_religion_id_cd422d93_fk_accounts_;
       public          postgres    false    233    231    3061                        2606    17454 P   accounts_parentsinfo accounts_parentsinfo_state_id_a68314bf_fk_accounts_state_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_state_id_a68314bf_fk_accounts_state_id FOREIGN KEY (state_id) REFERENCES public.accounts_state(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_state_id_a68314bf_fk_accounts_state_id;
       public          postgres    false    3067    231    237            !           2606    17459 Q   accounts_parentsinfo accounts_parentsinfo_type_of_family_id_6f2bf2d4_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_type_of_family_id_6f2bf2d4_fk_accounts_ FOREIGN KEY (type_of_family_id) REFERENCES public.accounts_familytype(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_type_of_family_id_6f2bf2d4_fk_accounts_;
       public          postgres    false    3043    223    231            "           2606    17466 J   accounts_parentsinfo accounts_parentsinfo_user_id_d74d30ba_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_parentsinfo
    ADD CONSTRAINT accounts_parentsinfo_user_id_d74d30ba_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.accounts_parentsinfo DROP CONSTRAINT accounts_parentsinfo_user_id_d74d30ba_fk_auth_user_id;
       public          postgres    false    231    213    3021            '           2606    17514 D   accounts_school accounts_school_city_id_1d798912_fk_accounts_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_school
    ADD CONSTRAINT accounts_school_city_id_1d798912_fk_accounts_city_id FOREIGN KEY (city_id) REFERENCES public.accounts_city(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.accounts_school DROP CONSTRAINT accounts_school_city_id_1d798912_fk_accounts_city_id;
       public          postgres    false    3038    219    235            &           2606    17444 F   accounts_school accounts_school_state_id_76dfa969_fk_accounts_state_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_school
    ADD CONSTRAINT accounts_school_state_id_76dfa969_fk_accounts_state_id FOREIGN KEY (state_id) REFERENCES public.accounts_state(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_school DROP CONSTRAINT accounts_school_state_id_76dfa969_fk_accounts_state_id;
       public          postgres    false    237    3067    235            *           2606    17531 J   accounts_studentsinfo accounts_studentsinf_parent_id_fb54d7fb_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_studentsinfo
    ADD CONSTRAINT accounts_studentsinf_parent_id_fb54d7fb_fk_accounts_ FOREIGN KEY (parent_id) REFERENCES public.accounts_parentsinfo(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.accounts_studentsinfo DROP CONSTRAINT accounts_studentsinf_parent_id_fb54d7fb_fk_accounts_;
       public          postgres    false    231    3054    241            ,           2606    17541 K   accounts_studentsinfo accounts_studentsinf_teacher_id_614c3400_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_studentsinfo
    ADD CONSTRAINT accounts_studentsinf_teacher_id_614c3400_fk_accounts_ FOREIGN KEY (teacher_id) REFERENCES public.accounts_teacherincharge(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.accounts_studentsinfo DROP CONSTRAINT accounts_studentsinf_teacher_id_614c3400_fk_accounts_;
       public          postgres    false    3069    241    239            +           2606    17536 T   accounts_studentsinfo accounts_studentsinfo_school_id_f10bb7b0_fk_accounts_school_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_studentsinfo
    ADD CONSTRAINT accounts_studentsinfo_school_id_f10bb7b0_fk_accounts_school_id FOREIGN KEY (school_id) REFERENCES public.accounts_school(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.accounts_studentsinfo DROP CONSTRAINT accounts_studentsinfo_school_id_f10bb7b0_fk_accounts_school_id;
       public          postgres    false    241    3064    235            -           2606    17546 L   accounts_studentsinfo accounts_studentsinfo_user_id_e639d748_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_studentsinfo
    ADD CONSTRAINT accounts_studentsinfo_user_id_e639d748_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_studentsinfo DROP CONSTRAINT accounts_studentsinfo_user_id_e639d748_fk_auth_user_id;
       public          postgres    false    3021    213    241            (           2606    17520 M   accounts_teacherincharge accounts_teacherinch_school_id_42d787d6_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_teacherincharge
    ADD CONSTRAINT accounts_teacherinch_school_id_42d787d6_fk_accounts_ FOREIGN KEY (school_id) REFERENCES public.accounts_school(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.accounts_teacherincharge DROP CONSTRAINT accounts_teacherinch_school_id_42d787d6_fk_accounts_;
       public          postgres    false    235    239    3064            )           2606    17525 R   accounts_teacherincharge accounts_teacherincharge_user_id_f4460ac1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_teacherincharge
    ADD CONSTRAINT accounts_teacherincharge_user_id_f4460ac1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_teacherincharge DROP CONSTRAINT accounts_teacherincharge_user_id_f4460ac1_fk_auth_user_id;
       public          postgres    false    239    3021    213                       2606    17299 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    207    3008                       2606    17294 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3013    211    209                       2606    17285 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3003    205    207                       2606    17314 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3013    215    209                       2606    17309 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    215    213    3021                       2606    17328 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    217    3008    207                       2606    17323 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    217    3021    213            1           2606    17589 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    205    3003    247            2           2606    17594 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    247    213    3021           