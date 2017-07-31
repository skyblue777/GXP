--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE addresses (
    id integer NOT NULL,
    name character varying,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    country character varying,
    mobile character varying
);


ALTER TABLE addresses OWNER TO green_x;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO green_x;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE admins (
    id integer NOT NULL,
    name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role integer
);


ALTER TABLE admins OWNER TO green_x;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admins_id_seq OWNER TO green_x;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: book_types; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE book_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE book_types OWNER TO green_x;

--
-- Name: book_types_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE book_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE book_types_id_seq OWNER TO green_x;

--
-- Name: book_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE book_types_id_seq OWNED BY book_types.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    projects_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE categories OWNER TO green_x;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO green_x;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE comments (
    id integer NOT NULL,
    project_id integer,
    user_id integer,
    body character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    commentable_id integer,
    commentable_type character varying
);


ALTER TABLE comments OWNER TO green_x;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO green_x;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contests; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE contests (
    id integer NOT NULL,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    terms_of_service text,
    location character varying,
    longitude double precision,
    latitude double precision,
    slug character varying,
    main boolean DEFAULT false NOT NULL
);


ALTER TABLE contests OWNER TO green_x;

--
-- Name: contests_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE contests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contests_id_seq OWNER TO green_x;

--
-- Name: contests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE contests_id_seq OWNED BY contests.id;


--
-- Name: group_invitations; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE group_invitations (
    id integer NOT NULL,
    group_id integer,
    email character varying,
    accepted boolean DEFAULT false NOT NULL,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE group_invitations OWNER TO green_x;

--
-- Name: group_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE group_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_invitations_id_seq OWNER TO green_x;

--
-- Name: group_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE group_invitations_id_seq OWNED BY group_invitations.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE groups (
    id integer NOT NULL,
    project_id integer,
    name character varying,
    image_id character varying,
    bio character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE groups OWNER TO green_x;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO green_x;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE images (
    id integer NOT NULL,
    project_id integer,
    image_id character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_filename character varying,
    image_size integer,
    image_content_type character varying
);


ALTER TABLE images OWNER TO green_x;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO green_x;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE order_products (
    id integer NOT NULL,
    order_id integer,
    quantity integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    price numeric,
    description text,
    digital boolean,
    product_price_id integer
);


ALTER TABLE order_products OWNER TO green_x;

--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_products_id_seq OWNER TO green_x;

--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE order_products_id_seq OWNED BY order_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE orders (
    id integer NOT NULL,
    shipped character varying,
    price numeric,
    complete boolean DEFAULT false,
    tax numeric,
    subtotal numeric,
    shipping numeric,
    name character varying,
    permalink character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shipping_address_id integer,
    billing_address_id integer,
    token character varying,
    email character varying,
    order_otp integer,
    user_id integer
);


ALTER TABLE orders OWNER TO green_x;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO green_x;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE payments (
    id integer NOT NULL,
    transaction_id character varying,
    location_id character varying,
    amount integer,
    card_brand character varying,
    card_last_4 character varying,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subscription_id integer,
    card_exp_month integer,
    card_exp_year integer,
    user_id integer,
    tender_id character varying
);


ALTER TABLE payments OWNER TO green_x;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payments_id_seq OWNER TO green_x;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: product_prices; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE product_prices (
    id integer NOT NULL,
    product_id integer,
    price numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    book_type character varying
);


ALTER TABLE product_prices OWNER TO green_x;

--
-- Name: product_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE product_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_prices_id_seq OWNER TO green_x;

--
-- Name: product_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE product_prices_id_seq OWNED BY product_prices.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    price numeric,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_id character varying,
    image_filename character varying,
    image_size integer,
    image_content_type character varying,
    book_download_id character varying,
    book_download_filename character varying,
    book_download_content_type character varying,
    book_types_id integer,
    book_versions_id integer
);


ALTER TABLE products OWNER TO green_x;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO green_x;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: project_categories; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE project_categories (
    id integer NOT NULL,
    project_id integer,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE project_categories OWNER TO green_x;

--
-- Name: project_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE project_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_categories_id_seq OWNER TO green_x;

--
-- Name: project_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE project_categories_id_seq OWNED BY project_categories.id;


--
-- Name: project_users; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE project_users (
    id integer NOT NULL,
    project_id integer,
    user_id integer,
    admin boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE project_users OWNER TO green_x;

--
-- Name: project_users_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE project_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_users_id_seq OWNER TO green_x;

--
-- Name: project_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE project_users_id_seq OWNED BY project_users.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying,
    body text,
    contest_id integer,
    votes_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    video_id character varying,
    video_mp4_id character varying,
    video_webm_id character varying,
    tagline character varying,
    step integer DEFAULT 1,
    finalized boolean DEFAULT false NOT NULL,
    video_filename character varying,
    video_size integer,
    video_content_type character varying,
    audio_file_name character varying,
    audio_content_type character varying,
    audio_file_size integer,
    audio_updated_at timestamp without time zone
);


ALTER TABLE projects OWNER TO green_x;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO green_x;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: redemption_codes; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE redemption_codes (
    id integer NOT NULL,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_id integer
);


ALTER TABLE redemption_codes OWNER TO green_x;

--
-- Name: redemption_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE redemption_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE redemption_codes_id_seq OWNER TO green_x;

--
-- Name: redemption_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE redemption_codes_id_seq OWNED BY redemption_codes.id;


--
-- Name: refunds; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE refunds (
    id integer NOT NULL,
    refund_id character varying,
    transaction_id character varying,
    location_id character varying,
    tender_id character varying,
    amount integer,
    payment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_id integer,
    subscription_id integer
);


ALTER TABLE refunds OWNER TO green_x;

--
-- Name: refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE refunds_id_seq OWNER TO green_x;

--
-- Name: refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE refunds_id_seq OWNED BY refunds.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO green_x;

--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE sponsors (
    id integer NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    address_1 character varying,
    address_2 character varying,
    city character varying,
    state character varying,
    country character varying,
    zip character varying,
    duration character varying,
    start_date date,
    region character varying,
    notes text,
    admin_notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sponsors OWNER TO green_x;

--
-- Name: sponsors_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE sponsors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sponsors_id_seq OWNER TO green_x;

--
-- Name: sponsors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE sponsors_id_seq OWNED BY sponsors.id;


--
-- Name: subscription_plans; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE subscription_plans (
    id integer NOT NULL,
    amount integer,
    "interval" character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE subscription_plans OWNER TO green_x;

--
-- Name: subscription_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE subscription_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscription_plans_id_seq OWNER TO green_x;

--
-- Name: subscription_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE subscription_plans_id_seq OWNED BY subscription_plans.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    name character varying,
    amount integer,
    active boolean,
    customer_id character varying,
    card_id character varying,
    card_brand character varying,
    card_last_4 character varying,
    card_exp_month integer,
    card_exp_year integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subscription_plan_id integer,
    email character varying,
    subscription_otp integer,
    sub_mobile_no character varying
);


ALTER TABLE subscriptions OWNER TO green_x;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscriptions_id_seq OWNER TO green_x;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    redemption_code character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    device_token character varying,
    device_platform character varying,
    authentication_token character varying,
    token_expires_at timestamp without time zone,
    image_id character varying,
    website character varying,
    bio character varying,
    location character varying,
    longitude double precision,
    latitude double precision,
    city character varying,
    state character varying,
    country character varying,
    is_permanent boolean
);


ALTER TABLE users OWNER TO green_x;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO green_x;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone
);


ALTER TABLE versions OWNER TO green_x;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE versions_id_seq OWNER TO green_x;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: green_x
--

CREATE TABLE votes (
    id integer NOT NULL,
    user_id integer,
    project_id integer,
    weight integer DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE votes OWNER TO green_x;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: green_x
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO green_x;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: green_x
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY book_types ALTER COLUMN id SET DEFAULT nextval('book_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY contests ALTER COLUMN id SET DEFAULT nextval('contests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY group_invitations ALTER COLUMN id SET DEFAULT nextval('group_invitations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY order_products ALTER COLUMN id SET DEFAULT nextval('order_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY product_prices ALTER COLUMN id SET DEFAULT nextval('product_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_categories ALTER COLUMN id SET DEFAULT nextval('project_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_users ALTER COLUMN id SET DEFAULT nextval('project_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY redemption_codes ALTER COLUMN id SET DEFAULT nextval('redemption_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY refunds ALTER COLUMN id SET DEFAULT nextval('refunds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY sponsors ALTER COLUMN id SET DEFAULT nextval('sponsors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY subscription_plans ALTER COLUMN id SET DEFAULT nextval('subscription_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY addresses (id, name, street, city, state, zip, created_at, updated_at, country, mobile) FROM stdin;
1	Karla Pollowitz	16532 27th Ave NE	Shoreline	WA	98155	2017-03-06 18:22:47.427165	2017-03-06 18:22:47.427165	\N	\N
2	Thomas 	Addaquay 	Atlanta 	Ga	30324	2017-03-06 20:40:55.902709	2017-03-06 20:40:55.902709	\N	\N
3	Karla Pollowitz	16532 27th Ave NE	Shoreline	WA	98155	2017-03-07 19:28:55.003404	2017-03-07 19:28:55.003404	\N	\N
4	Karla Pollowitz	16532 27th Ave NE	Shoreline	WA	98155	2017-03-07 21:19:11.871703	2017-03-07 21:19:11.871703	\N	\N
5	Karla Pollowitz	16532 27th Ave NE	Shoreline	WA	98155	2017-03-07 21:24:31.842317	2017-03-07 21:24:31.842317	\N	\N
6	Karla Pollowitz	16532 27th Ave NE	Shoreline	WA	98155	2017-03-07 21:27:16.17927	2017-03-07 21:27:16.17927	\N	\N
7	Thomas Addaquay	3050 stonegate drive	atlanta	ga	30324	2017-03-08 01:48:44.828131	2017-03-08 01:48:44.828131	\N	\N
8	Test	Test	Westbury	NY	11590	2017-03-08 02:14:02.887979	2017-03-08 02:14:02.887979	\N	\N
9	Karla Pollowitz	Test 234 N	Seattle	WA	98155	2017-03-08 03:27:43.975479	2017-03-08 03:27:43.975479	US	\N
10	Karla Pollowitz	Test 234 N	Shoreline	WA	98155	2017-03-08 03:37:59.11785	2017-03-08 03:37:59.11785	US	\N
11	jlkj	lj	lkj	lkj	lj	2017-03-08 17:54:27.025629	2017-03-08 17:54:27.025629	AX	\N
12	y	y	y	y	y	2017-03-08 18:47:45.558143	2017-03-08 18:47:45.558143	AU	\N
13	TYLAR BOREM	3315 ROSWELL RD APT 1052	ATLANTA	GA	30305	2017-03-15 14:59:45.916483	2017-03-15 14:59:45.916483	US	\N
14	lkj	lk	lkj	lk	ljk	2017-03-15 16:25:46.294408	2017-03-15 16:25:46.294408	LA	\N
15	TOBY KORRS	470 16TH ST NW Apt 1007	Atlanta	GA	30363	2017-03-16 21:14:48.23031	2017-03-16 21:14:48.23031	US	\N
16	Tarry Griswold	3560 Piedmont Rd NE Apt 304	Atlanta	GA	30305	2017-03-22 17:02:11.962228	2017-03-22 17:02:11.962228	US	\N
17	Naylo Wilde	481 Lakeside Dr NE Apt P105	Atlanta	GA	30326 	2017-03-22 17:06:24.120278	2017-03-23 02:37:32.737571	US	\N
18	Naylo Wilde	481 Lakeside Dr NE Apt P105	Atlanta	GA	30326 	2017-03-23 02:40:26.367922	2017-03-23 02:40:26.367922	US	\N
19	Asam Younge	3562 Piedmont Rd NE Apt 314	Atlanta	GA	30305	2017-03-23 16:29:13.914147	2017-03-23 16:29:13.914147	US	\N
20	Asam Younge	3562 Piedmont Rd NE Apt 314	Atlanta	GA	30305	2017-03-23 16:33:34.613076	2017-03-23 16:33:34.613076	US	\N
21	Kenedon Wilde	1609 Pineland Dr	Bainbridge	GA	39819	2017-03-23 16:49:57.111479	2017-03-23 16:49:57.111479	US	\N
22	Tylar Borem	3315 Roswell Rd Apt 1052	Atlanta	GA	30305	2017-03-24 15:22:23.538672	2017-03-24 15:22:23.538672	US	\N
23	Naylo Wilde	481 Lakeside Dr NE Apt P105	Atlanta	GA	30326	2017-03-28 10:43:35.308082	2017-03-28 10:43:35.308082	US	\N
24	Naylo Wilde	481 LAKESIDE DR NE APT P105	Atlanta	GA	30326	2017-03-28 19:27:47.916159	2017-03-28 19:27:47.916159	US	\N
25	DEROY WILDE	205 WONNUM RD	CULLODEN	GA	31016	2017-03-29 16:29:17.328798	2017-03-29 16:29:17.328798	US	\N
26	Zeus Delin	3481 Lakeside Dr NE Apt P105	Atlanta	Georgia	30326	2017-04-03 16:05:58.54168	2017-04-03 16:05:58.54168	US	\N
27	Caesar Delin	3481 Lakeside Dr NE Apt P105	Atlanta	GA	30326	2017-04-04 14:36:25.22499	2017-04-04 14:36:25.22499	US	\N
28	Zeus Delin	4528 Balto Way	Acworth	GA	30101	2017-04-04 14:52:30.271151	2017-04-04 14:52:30.271151	US	\N
29	Chris Pakarumo	470 16th St NW Apt 5022	Atlanta	GA	30363	2017-04-07 04:49:17.694126	2017-04-07 04:49:17.694126	US	\N
30	Tarry Griswold	555 Ivory Dr	Baldwin	GA	30511	2017-04-07 04:52:52.540181	2017-04-07 04:52:52.540181	US	\N
31	Tarry Griswold	555 Ivory Dr	Baldwin	GA	30511	2017-04-07 04:52:53.239418	2017-04-07 04:52:53.239418	US	\N
32	Jone Griswold	157 Strickland Rd	Allenhurst	GA	31301	2017-04-07 15:16:43.766961	2017-04-07 15:16:43.766961	US	\N
33	Tylar Borem	3315 Roswell Rd Apt 1052	Atlanta	GA	30305	2017-04-07 18:20:14.348844	2017-04-07 18:20:14.348844	US	\N
34	KJ	301 S jupiter Rd	Allen	TX	75002	2017-04-13 12:58:29.664445	2017-04-13 12:58:29.664445	US	\N
35	2345	2345	2345	234	23452345	2017-04-18 14:54:14.277583	2017-04-18 14:54:14.277583	BH	\N
36	erty	erty	erty	erty	erty	2017-04-18 14:55:02.581501	2017-04-18 14:55:02.581501	ER	\N
37	David	123 Paper Street	Los Angeles	CA	90025	2017-04-26 17:32:47.83343	2017-04-26 17:32:47.83343	US	\N
38	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	441401	2017-05-09 08:18:40.063747	2017-05-09 08:18:40.063747	IN	\N
39	Nikhil Kanholkar	pratap nagar	Nagpur	Maharashtra	112233	2017-05-09 09:57:22.375307	2017-05-09 09:57:22.375307	IN	\N
40	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 10:47:17.325909	2017-05-09 10:47:17.325909	IN	\N
41	amulya	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 11:21:08.61918	2017-05-09 11:21:08.61918	IN	\N
42	amulya	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 11:33:26.247638	2017-05-09 11:33:26.247638	IN	\N
43	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 12:47:50.767342	2017-05-09 12:47:50.767342	IN	\N
44	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 12:50:24.118454	2017-05-09 12:50:24.118454	IN	\N
45	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 13:38:48.510611	2017-05-09 13:38:48.510611	IN	\N
62	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 17:04:49.886579	2017-05-09 17:04:49.886579	IN	9876543210
63	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 17:09:03.905677	2017-05-09 17:09:03.905677	IN	9876543210
46	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	4444444	2017-05-09 13:49:57.231072	2017-05-09 14:56:05.949181	IN	\N
47	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 15:11:01.024485	2017-05-09 15:11:01.024485	IN	9876543210
48	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 15:57:47.184765	2017-05-09 15:57:47.184765	IN	9876543210
49	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:05:37.817149	2017-05-09 16:05:37.817149	IN	9876543210
50	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:08:36.34353	2017-05-09 16:08:36.34353	IN	9876543210
51	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:13:30.115539	2017-05-09 16:13:30.115539	IN	9876543210
52	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:26:31.372307	2017-05-09 16:26:31.372307	IN	9876543210
53	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:28:45.715754	2017-05-09 16:28:45.715754	IN	9876543210
54	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:31:34.988233	2017-05-09 16:31:34.988233	IN	9876543210
55	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:33:39.777885	2017-05-09 16:33:39.777885	IN	9876543210
56	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:35:38.015942	2017-05-09 16:35:38.015942	IN	9876543210
57	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:42:23.286155	2017-05-09 16:42:23.286155	IN	9876543210
58	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:46:33.526965	2017-05-09 16:46:33.526965	IN	9876543210
59	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:51:26.025933	2017-05-09 16:51:26.025933	IN	9876543210
60	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:57:28.15372	2017-05-09 16:57:28.15372	IN	9876543210
61	Rahul Kanholkar	gopal nagar	Nagpur	Maharashtra	112233	2017-05-09 16:59:11.934021	2017-05-09 16:59:11.934021	IN	9876543210
134	cz	xc	czx	zxc	zxc	2017-05-16 07:30:50.602808	2017-05-16 07:30:50.602808	AD	+917385034725
101	zxczxzcx	zxczxcxc	zxczxc	zcxzx	zxczx	2017-05-10 12:25:55.755163	2017-05-10 12:25:55.755163	AU	zczx
102	zxczxzcx	zxczxcxc	zxczxc	zcxzx	zxczx	2017-05-10 12:27:09.753823	2017-05-10 12:27:09.753823	AU	zczx
103	zxc	czxc	xzx	zcz	zxcz	2017-05-10 12:27:49.092332	2017-05-10 12:27:49.092332	AW	zxczx
116	zczxc	xzczx	xczzxc	zxczxc	zxczx	2017-05-15 06:27:53.743973	2017-05-15 06:27:53.743973	AQ	387145433
117	xczx	zxczx	zxczx	vcxv	zxcxz	2017-05-15 06:41:12.709524	2017-05-15 06:41:12.709524	AI	333
118	xcvcx	xcvcx	cxvxc	cxvcx	xcvxc	2017-05-15 06:50:23.203147	2017-05-15 06:50:23.203147	AF	+917387145433
119	xzcxz	zxczx	zxczx	zxczx	zxczx	2017-05-16 04:31:44.657742	2017-05-16 04:31:44.657742	AQ	+917387145433
120	zxczx	czxc	zxcz	czx	zxc	2017-05-16 05:59:44.606884	2017-05-16 05:59:44.606884	AQ	\N
121	zxczx	zxcz	zxc	zxcz	zxczx	2017-05-16 06:03:43.048826	2017-05-16 06:03:43.048826	AQ	\N
122	zxc	zxczx	zxcz	zxc	zxcz	2017-05-16 06:04:51.203733	2017-05-16 06:04:51.203733	AM	\N
123	sadsad	sadsa	sadsa	asds	asdas	2017-05-16 06:09:18.145885	2017-05-16 06:09:18.145885	AM	+917387145433
124	sazd	zxZ	xz	xzx	zxz	2017-05-16 06:22:37.674431	2017-05-16 06:22:37.674431	AR	+917387145433
125	zczxc	zxc	zxc	zxc	zxc	2017-05-16 06:36:15.527232	2017-05-16 06:36:15.527232	AM	+917387145433
126	czxc	zxc	zxc	zxc	xczx	2017-05-16 06:41:09.018976	2017-05-16 06:41:09.018976	AI	+917387145433
127	zxvc	zxc	zxcz	czx	zxc	2017-05-16 06:43:42.055369	2017-05-16 06:43:42.055369	AR	+917387145433
128	sadasd	dasdsd	asdas	das	das	2017-05-16 06:53:34.613615	2017-05-16 06:53:34.613615	AI	\N
129	czxc	xczx	zxczx	zxc	zxcxz	2017-05-16 06:57:26.868553	2017-05-16 06:57:26.868553	AR	+917387145433
130	SDasd	asdas	asdas	asd	ada	2017-05-16 06:58:15.417838	2017-05-16 06:58:15.417838	AI	+917387145433
131	sdsad	asdas	asds	asdasd	asdsa	2017-05-16 07:01:09.097672	2017-05-16 07:01:09.097672	AM	\N
132	asdas	asd	asd	asda	sdas	2017-05-16 07:09:50.357246	2017-05-16 07:09:50.357246	AM	\N
133	szxc	czxc	xc	zxc	zxczxc	2017-05-16 07:29:14.311852	2017-05-16 07:29:14.311852	AR	\N
135	sadasdas	asd	das	asdasdasd	sdasd	2017-05-16 07:32:39.397624	2017-05-16 07:32:39.397624	AR	+918390756008
136	xzx	zx	zx	zx	zx	2017-05-16 07:34:45.445853	2017-05-16 07:34:45.445853	AG	\N
137	zxczxc	zxc	zxc	zxc	zxczx	2017-05-16 07:49:11.797974	2017-05-16 07:49:11.797974	AI	+917387145433
138	xzxc	zxczx	zxcz	zxc	zxczx	2017-05-17 05:23:17.525709	2017-05-17 05:23:17.525709	AQ	+919373242291
139	zxcz	zxc	zxczx	zxc	zxc	2017-05-17 05:26:47.94001	2017-05-17 05:26:47.94001	AQ	+919373242291
140	Coffee & Toffee SF	1455 Market Street	San Francisco	CA	94103	2017-05-17 05:51:17.692836	2017-05-17 05:51:17.692836	US	+917387145433
141	zczx	czxc	zxczx	zxczx	zczxc	2017-05-17 05:52:14.237587	2017-05-17 05:52:14.237587	AO	+917387145433
142	xvcxv	xcv	xcv	xcvxc	xcvxc	2017-05-17 06:00:09.854704	2017-05-17 06:00:09.854704	AD	+917387145433
143	vxzv	zxvzxv	zxvz	xvzxv	zxv	2017-05-17 06:00:57.499456	2017-05-17 06:00:57.499456	AQ	+917387145433
144	zxczx	czxc	zxcz	xczc	zxcz	2017-05-17 06:01:29.264205	2017-05-17 06:01:29.264205	AG	+917387145433
145	xvxcv	xcvx	cvxcv	xcvxcv	xcv	2017-05-17 06:10:14.526878	2017-05-17 06:10:14.526878	AR	+917387145125
146	xczx	czx	zxcz	xczx	czxcz	2017-05-17 06:10:35.698397	2017-05-17 06:10:35.698397	AD	+917387145125
147	cxcx	xv	xcv	vzxcv	xczvzx	2017-05-17 06:25:37.14309	2017-05-17 06:25:37.14309	AI	+917387145125
148	xzczx	czxc	zxczxc	zxczxc	zxczx	2017-05-17 06:32:58.937212	2017-05-17 06:32:58.937212	AG	+917387145125
149	zxcvzxczx	czxc	zxczxczxc	zxcxz	czxczxcxz	2017-05-17 08:31:40.272252	2017-05-17 08:31:40.272252	AQ	+917387145433
150	zxx	czxZX	ZXZX	ZXz	XZXX	2017-05-17 08:32:37.194077	2017-05-17 08:32:37.194077	AO	+917387145433
151	vxc	vxc	xcvxc	xcvxcv	vxcv	2017-05-17 09:54:42.204329	2017-05-17 09:54:42.204329	AQ	\N
152	asdas	dasdasd	asdsa	dasd	asdasd	2017-05-17 12:45:03.081183	2017-05-17 12:45:03.081183	AI	+917387145433
153	zcxz	czxczxc	zxcz	xcxzczxc	zxczxczx	2017-05-17 12:49:49.564583	2017-05-17 12:49:49.564583	AI	+917387145433
154	zcxz	czxczxc	zxcz	xcxzczxc	zxczxczx	2017-05-17 12:50:24.843561	2017-05-17 12:50:24.843561	AI	+917387145433
155	xzczxc	zxc	zxczxc	zxczxc	zxczxc	2017-05-17 12:54:08.783716	2017-05-17 12:54:08.783716	AD	+917387145433
156	xzczxc	zxc	zxczxc	zxczxc	zxczxc	2017-05-17 12:56:12.785331	2017-05-17 12:56:12.785331	AD	+917387145433
157	xzczxc	zxc	zxczxc	zxczxc	zxczxc	2017-05-17 12:56:17.121607	2017-05-17 12:56:17.121607	AD	+917387145433
158	cz	xczxczx	zxczxcczx	czxczx	czxczxc	2017-05-17 13:04:00.265597	2017-05-17 13:04:00.265597	AD	+917387145433
159	xzczx	czxczx	czxczxczxc	zxczxc	zxczxcz	2017-05-17 13:06:23.624958	2017-05-17 13:06:23.624958	AM	\N
160	xzczxczx	zxczxc	zxcz	zxcz	xzcxz	2017-05-17 13:07:29.729738	2017-05-17 13:07:29.729738	AQ	+917387145433
161	zxczxc	xczxczx	zxczxczx	zxcxzc	zxczxc	2017-05-17 14:10:52.227508	2017-05-17 14:10:52.227508	AO	+9173871452333
162	czxc	zxczx	zxc	zxc	zxc	2017-05-18 04:44:53.781706	2017-05-18 04:44:53.781706	IN	+917387145433
163	xzvczxc	zczxczx	czxczx	xczx	zxczx	2017-05-18 04:57:27.499065	2017-05-18 04:57:27.499065	DZ	+917387145433
164	sdfsdf	das	dsad	das	dasd	2017-05-18 08:30:26.495617	2017-05-18 08:30:26.495617	AX	+3582312312
165	xzczxc	zxcxz	zxc	zxc	zxczx	2017-05-18 08:58:43.309837	2017-05-18 08:58:43.339033	IN	+917387145433
166	zcz	zxc	zxc	zxczx	xzczx	2017-05-18 11:21:28.048828	2017-05-18 11:21:28.079034	IN	+917387145433
167	sdf	sdfs	sfdsf	sdfds	fds	2017-05-19 08:48:33.732197	2017-05-19 08:48:33.75897	AU	
168	cxzczxc	zxczxcxczxc	xczxczxc	czxczxczxcz	zxczxc	2017-05-19 09:15:51.495187	2017-05-19 09:15:51.511918	PA	
169	xzczxczxc	zxc	zxczx	zxc	zxc	2017-05-19 11:47:10.37938	2017-05-19 11:47:10.468047	AM	
170	xzczxczxc	zxc	zxczx	zxc	zxc	2017-05-19 11:47:20.475181	2017-05-19 11:47:20.521212	IN	
171	scszc	zxczxc	zxczxc	zxczx	zxczxcxz	2017-05-19 13:12:21.893415	2017-05-19 13:12:21.933009	AR	
172	zxczxc	xczxczx	zxczx	zxczx	zxczx	2017-05-19 14:12:56.655168	2017-05-19 14:12:56.687308	AG	
173	zxczxczxc	zxczxc	zxczx	zxcz	zxczx	2017-05-19 14:30:48.753072	2017-05-19 14:30:48.834182	AR	
174	zczxc	zxc	zxc	zxc	zxcxz	2017-05-19 14:31:42.529111	2017-05-19 14:31:42.581032	AI	
175	zxczxc	zxczx	xxzcz	zxczx	zxc	2017-05-19 14:32:54.145177	2017-05-19 14:32:54.166261	IN	
176	czxczcc	zxczx	zxc	zxc	zxczx	2017-05-19 14:37:50.008173	2017-05-19 14:37:50.074602	AM	
177	zcc	xzc	zxc	zxc	zxc	2017-05-22 10:27:17.862933	2017-05-22 10:27:18.090045	AG	
178	zcxz	zxczx	zxc	zxczx	xczxczxc	2017-05-22 13:01:27.111219	2017-05-22 13:01:27.174964	AG	
179	zxczxczxczxc	zxccxzc	zxczxc	zxc	zxc	2017-05-22 13:02:06.617012	2017-05-22 13:02:06.745499	AR	
180	sdasd	dsad	asdsa	dsadsa	dsad	2017-05-22 13:32:14.652521	2017-05-22 13:32:14.753892	AG	
181	sdasd	dsad	asdsa	dsadsa	dsad	2017-05-22 14:14:24.569757	2017-05-22 14:14:24.640091	AG	
182	sczx	czx	czx	czx	zxcz	2017-05-22 14:48:32.632574	2017-05-22 14:48:32.780903	AW	
183	xzczxczxczx	czx	czxc	czx	czx	2017-05-23 04:54:43.831827	2017-05-23 04:54:44.062884	AR	
184	cxzczx	cxzcxzc	zxczx	zxczx	xzcxz	2017-05-23 07:21:15.389935	2017-05-23 07:21:15.513488	IN	+917387145433
185	xzczxczxczxxc	zxc	zxc	zxc	zxc	2017-05-23 08:07:09.537573	2017-05-23 08:07:09.616234	AU	
186	zxczxczxcc	zxc	zxc	zxc	zxczx	2017-05-23 08:08:37.416135	2017-05-23 08:08:37.488662	AW	
187	cxzcc	czxczxzx	czx	czx	czxczx	2017-05-23 08:10:19.605582	2017-05-23 08:10:19.675253	AW	
188	xzczxc	zxcxz	zxc	czxcz	zxczx	2017-05-23 08:12:10.830839	2017-05-23 08:12:10.88095	AR	
189	xzczxc	zxc	zxczxc	zxczx	zxczxc	2017-05-23 08:13:27.221859	2017-05-23 08:13:27.269706	IN	+917387145433
190	zxczxczxc	zczxc	zxc	zxczx	xczxczxc	2017-05-23 14:23:09.319163	2017-05-23 14:23:09.402657	AM	
191	zxczxczxcczxc	zxczxczx	czxczxc	zxczxczx	zxcxz	2017-05-24 14:54:50.959908	2017-05-24 14:54:51.26461	AW	
192	zxczxczxcczxccx	czx	zxc	czxczxz	czxczx	2017-05-26 14:56:26.170654	2017-05-26 14:56:26.427082	AM	
193	zxzx	zx	zX	zx	Xzx	2017-05-26 14:58:28.158308	2017-05-26 14:58:28.209393	AU	
194	xzczxczxzxcxzx	z	x	ZXzxzx	ZXzx	2017-05-26 15:02:28.599249	2017-05-26 15:02:28.623612	AU	
195	zxczczxc	zxczx	zxc	zxczx	zxczxc	2017-05-26 15:05:50.06996	2017-05-26 15:05:50.099219	AG	
196	zxczxczxcczxc	czx	zxc	zxc	zxc	2017-05-26 15:07:53.508048	2017-05-26 15:07:53.572498	AU	
197	zxczx	xzc	zxc	zxczx	zxczxc	2017-05-27 08:56:04.706576	2017-05-27 08:56:05.177649	AQ	
198	xczx	zxc	zxc	zxc	xzczx	2017-05-27 09:30:37.719216	2017-05-27 09:30:37.793142	IN	
199	cxvxcc	czx	zxc	zxc	zxc	2017-05-27 10:43:16.214468	2017-05-27 10:43:16.21729	IN	
200	cxvxxcv	xvcx	cxvxc	vcvcxv	cxvxcv	2017-05-27 13:44:00.307746	2017-05-27 13:44:00.326126	IN	
201	43twet	trtertret	treter	tretret	tret	2017-05-27 13:46:29.23609	2017-05-27 13:46:29.238524	AU	
202	xzczxczxzxcxzxc	cxzczxc	czxczxc	zxcxz	xzczx	2017-05-27 17:57:41.440516	2017-05-27 17:57:41.443301	AU	
203	gdfsggs`	ewrewf	ewfef	q	qewqwq	2017-05-29 13:59:49.231633	2017-05-29 14:02:07.880425	LU	+35256757565
204	hththh	hrhgh	hfghfgh	mshfghfg	656767	2017-05-29 14:03:09.177463	2017-05-29 14:09:24.774443	IN	5675756568
205	srer	rwerr	rewr	rew	rewr	2017-05-29 14:10:39.128173	2017-05-29 14:10:39.130596	IN	+918698962876
206	qwe	dff	fdsfs	fdsfsf	fsd	2017-05-29 14:13:50.150243	2017-05-29 14:13:50.153173	IN	
207	test	test	test	test	test	2017-05-29 19:37:00.384499	2017-05-29 19:37:00.388672	US	+1123131231313
208	hhshfshbfx	hhd	ghhh	hzhs	ghf	2017-05-30 13:52:06.392087	2017-05-30 13:52:06.398877	IN	
209	cvxcv	xcvxcvxc	vxcvxcv	xcv	xcvcx	2017-05-30 14:25:14.112799	2017-05-30 14:25:14.116428	AZ	
210	xc	xzc	xzc	xzcxz	zx	2017-05-31 13:44:13.913899	2017-05-31 13:44:13.916998	AU	
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('addresses_id_seq', 210, true);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY admins (id, name, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, role) FROM stdin;
2	Wayne	wayne.christian@phalinx.com	$2a$10$dcw0QML2myJWUBDdJYqT4e02qGZbT.D5tlkWCvS.SMDihnzYcHDum	\N	\N	\N	0	\N	\N	\N	\N	2017-01-17 16:33:05.733276	2017-01-17 16:33:05.733276	1
5	Pete Dunlap	pete.dunlap@metova.com	$2a$10$pvxvAhRFpbUZbHjCAwRyteGNeMzvxlXkcP66wdOGk8aLczZ3BT5ga	\N	\N	\N	2	2017-03-09 21:51:06.592737	2017-03-09 16:56:42.884403	50.132.224.5	50.132.224.5	2017-03-09 16:56:35.779423	2017-03-09 21:51:06.594562	1
1	Metova	admin@metova.com	$2a$10$5FLQwYkdNwouTi1Oe/7vtuMxS1Ht/TPiSxcpS0M8QKhJI9mrxJ6be	\N	\N	\N	1	2017-05-10 09:50:02.076941	2017-05-10 09:50:02.076941	127.0.0.1	127.0.0.1	2017-01-17 16:33:05.655398	2017-05-10 09:50:02.077948	1
3	Thomas	taddaquay@gmail.com	$2a$10$yyVLJE8cXDeLi5.Jr9NpTeui/My79sjD2plq3dpAtxWFLdFbWNJ2i	\N	\N	\N	41	2017-06-02 21:30:37.870634	2017-06-02 14:03:28.887568	86.97.7.47	43.227.133.66	2017-01-17 16:33:05.809855	2017-06-02 21:30:37.872405	1
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('admins_id_seq', 5, true);


--
-- Data for Name: book_types; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY book_types (id, name, created_at, updated_at) FROM stdin;
1	Hardcover	2017-01-01 00:00:00	2017-01-01 00:00:00
2	Paperback	2017-01-01 00:00:00	2017-01-01 00:00:00
3	Audio	2017-01-01 00:00:00	2017-01-01 00:00:00
4	Ebook	2017-01-01 00:00:00	2017-01-01 00:00:00
\.


--
-- Name: book_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('book_types_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY categories (id, name, projects_count, created_at, updated_at) FROM stdin;
3	New Category	\N	2017-04-18 14:57:14.437465	2017-04-18 14:57:14.437465
1	Recreation	2	2017-01-17 16:33:05.567414	2017-01-17 16:33:05.567414
4	My new Cat	2	2017-05-18 13:53:36.535304	2017-05-18 13:53:36.535304
2	Test	4	2017-03-08 19:14:56.734138	2017-03-08 19:14:56.734138
6	GXP Category 1	\N	2017-06-02 11:11:40.509287	2017-06-02 11:11:40.509287
7	GXP Category 2	\N	2017-06-02 11:42:40.25942	2017-06-02 11:42:40.25942
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('categories_id_seq', 7, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY comments (id, project_id, user_id, body, created_at, updated_at, commentable_id, commentable_type) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('comments_id_seq', 5, true);


--
-- Data for Name: contests; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY contests (id, starts_at, ends_at, created_at, updated_at, name, terms_of_service, location, longitude, latitude, slug, main) FROM stdin;
1	2016-01-17 16:33:05.521879	2018-01-17 16:33:05.522264	2017-01-17 16:33:05.538648	2017-01-17 16:33:05.550428	10K Sweepstakes	\N	\N	\N	\N	10k	t
2	2017-02-23 14:17:00	2017-02-28 14:17:00	2017-02-24 17:17:43.121683	2017-02-24 17:17:43.121683	$5,000		Seattle, WA	-122.332070799999997	47.6062094999999985	5k-contest	f
\.


--
-- Name: contests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('contests_id_seq', 2, true);


--
-- Data for Name: group_invitations; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY group_invitations (id, group_id, email, accepted, code, created_at, updated_at) FROM stdin;
\.


--
-- Name: group_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('group_invitations_id_seq', 1, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY groups (id, project_id, name, image_id, bio, created_at, updated_at) FROM stdin;
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('groups_id_seq', 1, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY images (id, project_id, image_id, description, created_at, updated_at, image_filename, image_size, image_content_type) FROM stdin;
2	2	19b7e376a5b9e92f3636f04f1a3ae3d1e651202402743fa09f11378043a8	\N	2017-02-24 17:13:20.35368	2017-02-24 17:13:21.410397	open-uri20170224-1265-1s0igy5.png	262125	image/png
3	3	c2e898dbd2d7d3d44520212a09a13af847f3063c48438c5442be99bb0a85	\N	2017-02-24 17:31:25.670124	2017-02-24 17:31:25.954237	c82643bfd9a82c824dee1416e2f678735547ab1a2564ff7b7deb8e651cca20170224-1265-1935p99.png	3423	image/png
4	4	7f5d497e2406b8038504c2fe28110309d723ddb74ffa10b849affa651ce5	\N	2017-02-24 19:31:42.043336	2017-02-24 19:31:42.785407	open-uri20170224-8748-12qg4b1.png	262125	image/png
5	5	b536f1f9e575e4ee71c459270f0d9ea13c9451a06514eb662f0a0067ae70	\N	2017-02-24 19:38:27.018194	2017-02-24 19:38:28.197481	open-uri20170224-8748-zx6exf.png	151951	image/png
6	6	43575832a242b66b6767563d304240a1db79c117046899bf1872e21089f1	\N	2017-05-18 13:19:18.186221	2017-05-18 13:19:18.186221	the_hulk.jpg	43776	image/jpeg
7	7	c14609253e6c9f098a6d4dffdbbeab01ac4969bd2c7009598caeeef6510a	\N	2017-05-18 13:22:50.004983	2017-05-18 13:22:50.004983	index.png	6474	image/png
8	8	b08a1c450e0c241fc477fcf2b2aae218a889bac3c5969f81326b63080829	\N	2017-05-22 10:27:00.829675	2017-05-22 10:27:00.829675	mom.jpg	1005872	image/jpeg
9	9	05727a2ff3302dd25946e841cec129d0fa10852f8c186298604e844024f9	\N	2017-05-24 09:48:29.69813	2017-05-24 09:48:30.462213	c5c8c2ebc44f6cae8da8bc3b3ebfc013bc82cbdfb052bb4c1f726c85dbaa20170524-20335-1kwpy33.png	76203	image/png
10	10	1dba2c140990f4974e581892d36fcf1048a8f752c82abd5fac193e8ff421	\N	2017-05-24 11:01:16.944444	2017-05-24 11:01:17.649321	baf2a98d3eaa4575ff324dc7c44c9ac34fdf1797eb3361e446d9a2017ae720170524-29361-13tq9qs.png	11795	image/png
11	11	e58419de31af2c4a08cf588f109390b0aa1aabcf480af8060cd8e040e966	\N	2017-05-27 10:14:44.695594	2017-05-27 10:14:45.349415	5d1249fd600682ec6e2473c174cc4f089fbbe396a351970003939127da4e20170527-24354-cefx1g.png	11795	image/png
12	12	7692f2306707ca500f8d6b3e14e01a8c0b2a52f9e5217c8aa698cd47a7bf	\N	2017-05-27 10:22:44.183754	2017-05-27 10:22:44.183754	groups.png	7502	image/png
19	19	9970c69c9ec924d19a28fadb406751ff9523df37339f518d6a642fccc1d7	\N	2017-05-27 14:10:19.767001	2017-05-27 14:10:19.767001	vxcvxc.jpeg	10099	image/jpeg
20	20	164d0bb3ee5fa7b3c73ee3cd22fb26c36962b486d067026ee47a1aedf296	\N	2017-05-27 14:32:46.49172	2017-05-27 14:32:46.49172	vxcvxc.jpeg	10099	image/jpeg
21	21	d433251e8d0d66825a55a4cafa1ebb8c14ffe5419e9f7b3639aede893aeb	\N	2017-05-29 14:20:01.341298	2017-05-29 14:20:01.341298	vxcvxc.jpeg	10099	image/jpeg
22	22	2ebad46f361bbdb032566c1958001754c0d714867963c9c3facfe97cd34e	\N	2017-06-02 14:04:40.120199	2017-06-02 14:04:40.120199	mom.jpg	1005872	image/jpeg
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('images_id_seq', 22, true);


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY order_products (id, order_id, quantity, created_at, updated_at, name, price, description, digital, product_price_id) FROM stdin;
414	241	1	2017-05-30 07:14:04.399086	2017-05-30 07:14:04.399086	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
415	241	1	2017-05-30 07:14:04.412252	2017-05-30 07:14:04.412252	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
381	228	1	2017-05-29 09:47:03.547457	2017-05-29 09:47:03.547457	Black & White Version	34.95	Black & White Version	f	121
382	228	1	2017-05-29 09:47:03.55927	2017-05-29 09:47:03.55927	Black & White Version	26.95	Black & White Version	f	122
383	230	1	2017-05-29 13:04:53.383818	2017-05-29 13:04:53.383818	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
384	230	2	2017-05-29 13:04:53.392919	2017-05-29 13:04:53.392919	Downloadable Versions	53.9	 Ebook and Audio Versions 	f	114
385	231	2	2017-05-29 13:05:06.887895	2017-05-29 13:05:06.887895	Downloadable Versions	69.9	 Ebook and Audio Versions 	f	113
386	231	1	2017-05-29 13:05:06.896829	2017-05-29 13:05:06.896829	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
387	231	1	2017-05-29 13:08:18.190022	2017-05-29 13:08:18.190022	Colored Version	37.95	Colored Version 	f	115
388	231	1	2017-05-29 13:08:18.212552	2017-05-29 13:08:18.212552	Colored Version	29.95	Colored Version 	f	116
389	231	1	2017-05-29 13:58:20.74157	2017-05-29 13:58:20.74157	Black & White Version	34.95	Black & White Version	f	121
390	232	2	2017-05-29 13:58:32.019874	2017-05-29 13:58:32.019874	Black & White Version	69.9	Black & White Version	f	121
391	232	1	2017-05-29 14:02:18.745326	2017-05-29 14:02:18.745326	Colored Version	37.95	Colored Version 	f	115
392	233	1	2017-05-29 14:02:19.662484	2017-05-29 14:02:19.662484	Black & White Version	34.95	Black & White Version	f	121
393	233	1	2017-05-29 14:09:41.654977	2017-05-29 14:09:41.654977	Black & White Version	34.95	Black & White Version	f	121
394	234	2	2017-05-29 14:09:57.799941	2017-05-29 14:09:57.799941	Black & White Version	69.9	Black & White Version	f	121
395	234	1	2017-05-29 14:13:27.34131	2017-05-29 14:13:27.34131	Black & White Version	34.95	Black & White Version	f	121
396	235	2	2017-05-29 14:13:33.2309	2017-05-29 14:13:33.2309	Black & White Version	69.9	Black & White Version	f	121
416	242	1	2017-05-30 07:14:12.709875	2017-05-30 07:14:12.709875	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
417	242	1	2017-05-30 07:14:12.720501	2017-05-30 07:14:12.720501	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
401	236	3	2017-05-29 19:18:00.932235	2017-05-29 19:18:00.932235	Colored Version	113.85	Colored Version 	f	115
402	236	1	2017-05-29 20:22:39.401443	2017-05-29 20:22:39.401443	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
403	237	1	2017-05-29 20:22:47.325906	2017-05-29 20:22:47.325906	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
404	237	1	2017-05-29 20:25:14.322883	2017-05-29 20:25:14.322883	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
405	238	1	2017-05-29 20:25:21.913281	2017-05-29 20:25:21.913281	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
406	238	4	2017-05-29 20:34:18.089806	2017-05-29 20:34:18.089806	Downloadable Versions	139.8	 Ebook and Audio Versions 	f	113
407	238	2	2017-05-29 20:34:18.096391	2017-05-29 20:34:18.096391	Downloadable Versions	53.9	 Ebook and Audio Versions 	f	114
408	239	2	2017-05-29 20:34:26.010305	2017-05-29 20:34:26.010305	Downloadable Versions	69.9	 Ebook and Audio Versions 	f	113
409	239	1	2017-05-29 20:34:26.017571	2017-05-29 20:34:26.017571	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
410	239	1	2017-05-29 22:08:32.930529	2017-05-29 22:08:32.930529	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
411	240	1	2017-05-29 22:08:40.224689	2017-05-29 22:08:40.224689	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
412	240	1	2017-05-30 07:13:03.241044	2017-05-30 07:13:03.241044	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
413	241	1	2017-05-30 07:13:30.241636	2017-05-30 07:13:30.241636	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
421	244	1	2017-05-30 13:41:17.55606	2017-05-30 13:41:17.55606	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
423	245	1	2017-05-30 14:14:51.091995	2017-05-30 14:14:51.091995	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
424	245	1	2017-05-30 14:25:04.676153	2017-05-30 14:25:04.676153	Colored Version	37.95	Colored Version 	f	115
425	245	5	2017-05-30 19:10:11.596263	2017-05-30 19:10:11.596263	Black & White Version	174.75	Black & White Version	f	121
426	246	5	2017-05-30 19:10:23.522332	2017-05-30 19:10:23.522332	Black & White Version	134.75	Black & White Version	f	122
427	246	2	2017-05-31 08:30:22.051107	2017-05-31 08:30:22.051107	Colored Version	75.9	Colored Version 	f	115
428	246	4	2017-05-31 08:30:22.059351	2017-05-31 08:30:22.059351	Colored Version	119.8	Colored Version 	f	116
429	247	2	2017-05-31 08:30:22.898571	2017-05-31 08:30:22.898571	Black & White Version	69.9	Black & White Version	f	121
430	247	1	2017-05-31 08:30:22.92129	2017-05-31 08:30:22.92129	Black & White Version	26.95	Black & White Version	f	122
431	247	2	2017-05-31 08:30:33.036986	2017-05-31 08:30:33.036986	Colored Version	75.9	Colored Version 	f	115
432	247	4	2017-05-31 08:30:33.062415	2017-05-31 08:30:33.062415	Colored Version	119.8	Colored Version 	f	116
433	247	2	2017-05-31 08:31:12.202066	2017-05-31 08:31:12.202066	Downloadable Versions	69.9	 Ebook and Audio Versions 	f	113
434	247	1	2017-05-31 08:31:12.208847	2017-05-31 08:31:12.208847	Downloadable Versions	26.95	 Ebook and Audio Versions 	f	114
435	247	1	2017-05-31 13:44:00.728292	2017-05-31 13:44:00.728292	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
436	248	1	2017-05-31 13:44:06.695589	2017-05-31 13:44:06.695589	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
437	248	1	2017-06-01 13:55:23.251298	2017-06-01 13:55:23.251298	Colored Version	37.95	Colored Version 	f	115
438	249	1	2017-06-01 13:55:27.661829	2017-06-01 13:55:27.661829	Colored Version	37.95	Colored Version 	f	115
439	249	3	2017-06-02 14:20:31.461582	2017-06-02 14:20:31.461582	Colored Version	113.85	Colored Version 	f	115
440	251	1	2017-06-03 07:31:36.307768	2017-06-03 07:31:36.307768	Downloadable Versions	34.95	 Ebook and Audio Versions 	f	113
441	251	2	2017-06-03 07:31:36.314236	2017-06-03 11:02:49.644919	Downloadable Versions	53.9	 Ebook and Audio Versions 	f	114
\.


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('order_products_id_seq', 441, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY orders (id, shipped, price, complete, tax, subtotal, shipping, name, permalink, created_at, updated_at, shipping_address_id, billing_address_id, token, email, order_otp, user_id) FROM stdin;
48	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-8b69fb3799	0aa883fbe1	2017-04-18 14:53:58.698723	2017-04-18 14:54:14.379177	\N	35	\N	\N	\N	\N
31	new	33661.3000000000002959	t	20.713000000000002959	295.9	\N	order-7838f18685	2167c282e5	2017-03-28 10:41:15.524599	2017-03-28 10:44:35.293225	\N	23	\N	\N	\N	\N
2	new	2980.93000000000002599	t	1.8193000000000002599	25.99	\N	order-f039c94ee1	51b4ed68cc	2017-03-06 20:31:38.662944	2017-03-06 20:52:20.720001	\N	2	\N	\N	\N	\N
19	new	94471.97000000000082871	t	58.0097000000000082871	828.71	\N	order-086d998f14	c2ab5ee39f	2017-03-15 14:50:30.801161	2017-03-15 18:45:24.229494	\N	13	\N	\N	\N	\N
1	new	11816.72000000000010296	t	7.2072000000000010296	102.96	\N	order-e41a6a794d	386a736581	2017-03-06 18:22:25.235612	2017-03-07 17:15:08.020423	\N	1	\N	\N	\N	\N
3	new	3515.93000000000003099	t	2.1693000000000003099	30.99	\N	order-be6ed95e69	1087420f2d	2017-03-07 19:28:39.113494	2017-03-07 19:29:11.010779	\N	3	\N	\N	\N	\N
26	new	33631.16000000000029188	t	20.4316000000000029188	291.88	\N	order-34e0da3705	e7055bbaca	2017-03-23 16:32:06.010817	2017-03-23 16:34:15.509265	\N	20	\N	\N	\N	\N
4	new	3515.93000000000003099	t	2.1693000000000003099	30.99	\N	order-64d0247e3d	c32d50023a	2017-03-07 21:18:51.663319	2017-03-07 21:19:25.980351	\N	4	\N	\N	\N	\N
5	new	3515.93000000000003099	t	2.1693000000000003099	30.99	\N	order-0fada9d4cc	03b9b9f96e	2017-03-07 21:24:15.84487	2017-03-07 21:24:44.973244	\N	5	\N	\N	\N	\N
35	new	61223.6000000000005348	t	37.436000000000005348	534.8	\N	order-d1e0eaaab9	859fcf5440	2017-04-03 16:04:35.215847	2017-04-03 16:06:53.499007	\N	26	\N	\N	\N	\N
6	new	168155.8000000000014594	t	102.158000000000014594	1459.4	\N	order-f46c03c9ff	2a44b386ad	2017-03-07 21:27:00.852147	2017-03-07 21:28:35.848136	\N	6	\N	\N	\N	\N
21	new	110675.69000000000097267	t	68.0869000000000097267	972.67	\N	order-0181246ab3	58e965012d	2017-03-16 21:11:54.664058	2017-03-16 21:16:27.034725	\N	15	\N	\N	\N	\N
8	new	2766.93000000000002399	t	1.6793000000000002399	23.99	\N	order-72257e85d1	d1ebc123b0	2017-03-08 02:13:42.438938	2017-03-08 02:17:37.867897	\N	8	\N	\N	\N	\N
32	new	5961.86000000000005198	t	3.6386000000000005198	51.98	\N	order-69002a3a08	721d193f96	2017-03-28 19:26:15.594418	2017-03-28 19:28:26.004979	\N	24	\N	\N	\N	\N
7	new	3515.93000000000003099	t	2.1693000000000003099	30.99	\N	order-8a6f55c912	110313de15	2017-03-08 01:48:04.106748	2017-03-08 02:20:11.775548	\N	7	\N	\N	\N	\N
27	new	46318.95000000000040485	t	28.3395000000000040485	404.85	\N	order-93e81cdfef	ce50705f70	2017-03-23 16:49:03.73041	2017-03-23 16:56:03.428946	\N	21	\N	\N	\N	\N
9	new	3515.93000000000003099	t	2.1693000000000003099	30.99	\N	order-a965c4cb98	403cc33486	2017-03-08 03:27:17.474104	2017-03-08 03:28:44.103499	\N	9	\N	\N	\N	\N
10	new	8942.79000000000007797	t	5.4579000000000007797	77.97	\N	order-d2c5aacf1d	3903ee3254	2017-03-08 03:37:39.796603	2017-03-08 03:38:32.030681	\N	10	\N	\N	\N	\N
11	new	2766.93000000000002399	f	1.6793000000000002399	23.99	\N	order-464a6d532c	d2912a0ab8	2017-03-08 14:42:10.7951	2017-03-08 14:46:28.746585	\N	\N	\N	\N	\N	\N
12	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-014b0a5b36	778a651a46	2017-03-08 14:59:29.305487	2017-03-08 14:59:29.305487	\N	\N	\N	\N	\N	\N
13	new	3515.93000000000003099	t	2.1693000000000003099	30.99	\N	order-0bbe3a34be	0db8ad2e6b	2017-03-08 17:54:12.904947	2017-03-08 17:56:49.883719	\N	11	\N	\N	\N	\N
14	new	3515.93000000000003099	f	2.1693000000000003099	30.99	\N	order-05620bf4df	eabe3038a8	2017-03-08 18:47:37.045964	2017-03-08 18:47:45.799708	\N	12	\N	\N	\N	\N
15	new	10547.79000000000009297	f	6.5079000000000009297	92.97	\N	order-6463aff3df	11353d61f9	2017-03-08 19:08:36.029796	2017-03-08 19:08:41.193216	\N	\N	\N	\N	\N	\N
16	new	3515.93000000000003099	f	2.1693000000000003099	30.99	\N	order-894f247237	7603033f1d	2017-03-10 07:59:38.426863	2017-03-10 07:59:38.426863	\N	\N	\N	\N	\N	\N
17	new	2766.93000000000002399	f	1.6793000000000002399	23.99	\N	order-a9594080af	e0d9cf40bd	2017-03-13 17:51:16.329523	2017-03-13 17:51:16.329523	\N	\N	\N	\N	\N	\N
18	new	26828.37000000000023391	f	16.3737000000000023391	233.91	\N	order-e7c2ca0a36	f7c12d8748	2017-03-15 14:13:12.899892	2017-03-15 14:13:12.899892	\N	\N	\N	\N	\N	\N
22	new	2766.93000000000002399	t	1.6793000000000002399	23.99	\N	order-1e58e55554	50d48b0ee4	2017-03-22 16:43:19.120435	2017-03-22 17:02:55.392827	\N	16	\N	\N	\N	\N
20	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-44456e4d3d	0df065b49e	2017-03-15 16:25:34.385066	2017-03-15 16:25:46.402387	\N	14	\N	\N	\N	\N
49	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-c0da532978	191dd82f48	2017-04-18 14:54:48.149342	2017-04-18 14:55:03.029235	\N	36	\N	\N	\N	\N
45	new	65580.46000000000057178	t	40.0246000000000057178	571.78	\N	order-76927a7c92	88f9821e5f	2017-04-07 18:18:54.598711	2017-04-07 18:21:35.495686	\N	33	\N	\N	\N	\N
43	new	95389.76000000000083168	t	58.2176000000000083168	831.68	\N	order-c81f293672	15d012cf59	2017-04-07 04:51:32.221176	2017-04-07 04:53:36.606181	\N	31	\N	\N	\N	\N
28	new	193760.45000000000168935	t	118.2545000000000168935	1689.35	\N	order-1abc02970a	1832ad307a	2017-03-24 14:45:28.803795	2017-03-24 15:23:07.642506	\N	22	\N	\N	\N	\N
29	new	2766.93000000000002399	f	1.6793000000000002399	23.99	\N	order-5cf123bec0	0308ca74c3	2017-03-27 17:50:25.171149	2017-03-27 17:50:25.171149	\N	\N	\N	\N	\N	\N
23	new	29809.3000000000002599	t	18.193000000000002599	259.9	\N	order-274a527903	21992a420e	2017-03-22 17:05:26.895247	2017-03-23 02:38:14.19988	\N	17	\N	\N	\N	\N
30	new	6496.86000000000005698	f	3.9886000000000005698	56.98	\N	order-d25cec1c4d	b52c8d1666	2017-03-27 22:10:46.714148	2017-03-27 22:10:54.895575	\N	\N	\N	\N	\N	\N
24	new	35159.3000000000003099	t	21.693000000000003099	309.9	\N	order-54eb2bbeab	fb85b78d52	2017-03-23 02:39:52.096914	2017-03-23 02:41:03.228052	\N	18	\N	\N	\N	\N
25	new	35159.3000000000003099	t	21.693000000000003099	309.9	\N	order-d321aa4c12	db885c80dc	2017-03-23 16:27:00.476084	2017-03-23 16:31:18.987118	\N	19	\N	\N	\N	\N
42	new	61223.6000000000005348	t	37.436000000000005348	534.8	\N	order-f214769bda	af75d4c4e9	2017-04-07 04:46:17.363446	2017-04-07 04:50:02.7046	\N	29	\N	\N	\N	\N
37	new	97452.9000000000008547	f	59.829000000000008547	854.7	\N	order-cd5378e812	21b65103f8	2017-04-04 14:50:45.765646	2017-04-04 14:55:46.438025	\N	28	\N	\N	\N	\N
38	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-d10ea036c7	082af5f13d	2017-04-04 20:32:04.415169	2017-04-04 20:32:04.415169	\N	\N	\N	\N	\N	\N
33	new	92637.9000000000008097	t	56.679000000000008097	809.7	\N	order-1a6e50b2e8	f93c3ff6f5	2017-03-29 16:26:38.189958	2017-03-29 16:37:14.635818	\N	25	\N	\N	\N	\N
34	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-0d2cd097a2	cc3b04eaf1	2017-03-30 15:22:43.732709	2017-03-30 15:22:43.732709	\N	\N	\N	\N	\N	\N
39	new	35557.16000000000030988	f	21.6916000000000030988	309.88	\N	order-413a2774bb	ec56c72673	2017-04-04 22:47:51.890559	2017-04-04 22:48:08.795887	\N	\N	\N	\N	\N	\N
40	new	3515.93000000000003099	f	2.1693000000000003099	30.99	\N	order-dad006709c	4b6f45476f	2017-04-04 23:10:23.299502	2017-04-04 23:10:23.299502	\N	\N	\N	\N	\N	\N
36	new	127461.13000000000111459	t	78.0213000000000111459	1114.59	\N	order-aa3bcfb064	ce03c8c175	2017-04-04 14:34:05.229157	2017-04-04 14:37:29.041028	\N	27	\N	\N	\N	\N
44	new	95404.83000000000083369	t	58.3583000000000083369	833.69	\N	order-63f716e917	dab42db382	2017-04-07 15:12:43.506647	2017-04-07 15:17:26.723695	\N	32	\N	\N	\N	\N
41	new	2766.93000000000002399	f	1.6793000000000002399	23.99	\N	order-ece865f3d4	6fc676b652	2017-04-05 18:24:18.251304	2017-04-05 18:24:18.251304	\N	\N	\N	\N	\N	\N
46	new	2980.93000000000002599	f	1.8193000000000002599	25.99	\N	order-12094e85f9	1e5f3f5d4c	2017-04-13 12:57:30.589573	2017-04-13 12:58:29.842329	\N	34	\N	\N	\N	\N
47	new	2766.93000000000002399	f	1.6793000000000002399	23.99	\N	order-f4bea9523f	8ff080e72b	2017-04-18 04:04:34.747033	2017-04-18 04:04:34.747033	\N	\N	\N	\N	\N	\N
50	new	3515.93000000000003099	f	2.1693000000000003099	30.99	\N	order-e997e4a0ca	e0512b3aaa	2017-04-23 20:30:40.135225	2017-04-23 20:30:40.135225	\N	\N	\N	\N	\N	\N
51	new	3515.93000000000003099	f	2.1693000000000003099	30.99	\N	order-60800d43a5	749b777db0	2017-04-26 17:32:24.653864	2017-04-26 17:32:47.850101	\N	37	\N	\N	\N	\N
52	new	6282.86000000000005498	f	3.8486000000000005498	54.98	\N	order-32e7dcc46d	988eaa2f64	2017-04-27 16:35:13.62918	2017-04-27 16:36:03.371623	\N	\N	\N	\N	\N	\N
53	new	2766.93000000000002399	f	1.6793000000000002399	23.99	\N	order-d12510309a	63f5cb7da4	2017-05-03 00:22:58.732236	2017-05-03 00:22:58.732236	\N	\N	\N	\N	\N	\N
54	new	9477.79000000000008297	f	5.8079000000000008297	82.97	25.0	order-1cdd5c8d9a	da4ab4580b	2017-05-09 08:17:08.359895	2017-05-09 10:41:11.621181	38	39	\N	kanholkarrahul@gmail.com	\N	\N
56	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-41c44f5483	5eb9d0422f	2017-05-09 11:00:42.216647	2017-05-09 12:37:33.260327	42	41	5a6iesggL4Iv_59YgqTwgQ	asdas@xzcx.cc	\N	\N
57	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-f02a8b28ad	5de5d19450	2017-05-09 12:39:42.398877	2017-05-09 12:48:57.086133	43	\N	yJKlmXnPIHAURW5Pe0xx8A	abc@gmail.com	\N	\N
58	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-67c85d87b6	eee6cfd6ed	2017-05-09 12:50:01.362093	2017-05-09 12:50:56.067285	44	\N	9TJcylfQQoynOmUQtOYZTg	abc@gmail.com	\N	\N
168	new	99.4779000000000009297	f	6.5079000000000009297	92.97	25.0	order-4f5f0858a5	707fda5ddd	2017-05-17 09:47:28.236918	2017-05-17 12:32:08.518955	151	\N	\N	deshbhratarakash@gmail.com	\N	\N
72	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-0653a0323a	a3c33433b2	2017-05-09 16:51:04.225686	2017-05-09 16:52:23.748815	59	\N	W7qhpZYxPLOTvTmWiCY_KQ	abc@gmail.com	\N	\N
85	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-cd5c18c343	3ccff3ec9e	2017-05-10 07:45:43.354276	2017-05-10 07:45:43.354276	\N	\N	\N	abc@gmail.com	\N	\N
73	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-02fc4404f7	71b1c9c147	2017-05-09 16:57:04.962817	2017-05-09 16:57:48.846861	60	\N	KIHPAjL3WfFymMOUpAAPTQ	abc@gmail.com	\N	\N
59	new	119.1279000000000008797	t	6.1579000000000008797	87.97	25.0	order-8e473265bb	b13b793e63	2017-05-09 13:25:30.316019	2017-05-09 15:00:47.432032	46	\N	4__XNEXMm_EwORP2xw_YOw	abc@gmail.com	\N	\N
93	new	94.1279000000000008797	f	6.1579000000000008797	87.97	\N	order-33ef238d94	b9cc1b8d33	2017-05-10 10:50:25.48034	2017-05-10 10:51:29.571016	84	\N	\N	abc@gmail.com	\N	\N
60	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-8976579ac7	49a45331f4	2017-05-09 15:07:42.604232	2017-05-09 15:11:51.651398	47	\N	d7VQEW60nXhBh0LbK257PA	abc@gmail.com	\N	\N
74	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-f123e7aa66	66b2383d17	2017-05-09 16:58:45.760566	2017-05-09 16:59:33.248891	61	\N	EWH-GBG0Yiv0ynYdGAsCIQ	abc@gmail.com	\N	\N
61	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-b753893d43	49f828193d	2017-05-09 15:57:23.129476	2017-05-09 15:58:11.664942	48	\N	vGgjp9EEl9pEXFGVPTG9kg	abc@gmail.com	\N	\N
62	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-45f33deb4b	7b2082214f	2017-05-09 16:05:02.52669	2017-05-09 16:06:00.149025	49	\N	McZUVc9cLZ-ScohYbjBPYA	abc@gmail.com	\N	\N
86	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-f0b33aec49	7612ff27a7	2017-05-10 09:42:15.71596	2017-05-10 09:47:26.241544	\N	\N	\N	abc@gmail.com	1124	\N
63	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-612a5c0673	b60305496e	2017-05-09 16:08:14.599137	2017-05-09 16:08:56.331736	50	\N	ZkGJOngUDFPpozWrLkQ5SA	abc@gmail.com	\N	\N
75	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-5b53d27334	9e9dd0daf3	2017-05-09 17:04:27.83076	2017-05-09 17:05:13.973066	62	\N	-OyyXYW3cykX2dwFRY41Ag	abc@gmail.com	\N	\N
64	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-3b8519f326	b95cca2c99	2017-05-09 16:13:08.62099	2017-05-09 16:13:57.398287	51	\N	IfMIKEKx7M7D0PcujswxtQ	abc@gmail.com	\N	\N
65	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-41dc6489e6	fbb64f1005	2017-05-09 16:26:07.890927	2017-05-09 16:26:51.345682	52	\N	OHE82ZftLOntFx9zeTdpoQ	abc@gmail.com	\N	\N
66	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-5edb5164d3	906b45e757	2017-05-09 16:28:15.441642	2017-05-09 16:29:10.15175	53	\N	KbBCy9QN-rycxff2g51hxA	abc@gmail.com	\N	\N
76	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-2175f865c8	ff97ca9fcd	2017-05-09 17:08:37.066328	2017-05-09 17:09:28.513719	63	\N	L1ha5NlVO_VtgcvOyzzm_g	abc@gmail.com	\N	\N
67	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-a2a001b31e	d3f0c1f3a9	2017-05-09 16:31:02.018585	2017-05-09 16:31:57.189729	54	\N	ZcDsWis4us7aTjC_gIoY9w	abc@gmail.com	\N	\N
68	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-d7f999648a	e5a3f1a629	2017-05-09 16:33:16.470156	2017-05-09 16:34:02.403386	55	\N	c3uqTvGIDOXarsnC_Iyzdw	abc@gmail.com	\N	\N
95	new	33.1593000000000003099	t	2.1693000000000003099	30.99	15.0	order-781dd89138	d2abe00f18	2017-05-10 11:31:30.274283	2017-05-10 11:32:03.651942	87	\N	oXn1NH5ZlVEew_U4mKWilA	abc@gmail.com	1378	\N
69	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-440f7b5a54	3981851200	2017-05-09 16:35:02.407422	2017-05-09 16:35:57.084856	56	\N	JlYMRTxkzU_HTyVEsGOPwQ	abc@gmail.com	\N	\N
77	new	58.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-aa9b8ea889	09ad7d0f3a	2017-05-09 17:11:46.909399	2017-05-09 17:13:07.340059	64	\N	Y3-DGSFPpAF4F6HrbIl2EQ	abc@gmail.com	\N	\N
70	new	50.6693000000000002399	t	1.6793000000000002399	23.99	25.0	order-f8a67bbf48	79ab01a4bc	2017-05-09 16:41:46.943959	2017-05-09 16:42:44.08289	57	\N	--_X7SQwCQFkqCXFjewM5g	abc@gmail.com	\N	\N
87	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-ee51505d12	2b9ebf65e8	2017-05-10 09:52:56.345884	2017-05-10 09:55:40.046109	77	\N	AnhSvPvqiuHVpGc59Uh68A	abc@gmail.com	\N	\N
71	new	83.8286000000000005498	t	3.8486000000000005498	54.98	25.0	order-fefe2b684e	aeba6b5c4d	2017-05-09 16:46:07.501244	2017-05-09 16:48:37.998619	58	\N	EWgXLmVL_hsJiMj-DFheKA	abc@gmail.com	\N	\N
78	new	66.3186000000000006198	t	4.3386000000000006198	61.98	\N	order-3d05ab9de5	bbb3a39704	2017-05-10 05:13:39.37626	2017-05-10 05:30:46.19772	69	\N	NNLFiAYCVk1p1uLf-l73CQ	abc@gmail.com	\N	\N
79	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-92e3c798b7	f9f933ca47	2017-05-10 05:34:23.215697	2017-05-10 05:36:01.443676	70	\N	5kugQMz21pFuXXHB-kzZHw	abc@gmail.com	\N	\N
90	new	99.4779000000000009297	t	6.5079000000000009297	92.97	\N	order-3dec3da62f	88dc62cc29	2017-05-10 10:08:38.440479	2017-05-10 10:38:44.420419	82	\N	xhFua8ko8Bodng7uaxQtug	abc@gmail.com	\N	\N
80	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-b235b5d3f5	648d7f7898	2017-05-10 05:37:10.871447	2017-05-10 05:38:36.454005	71	\N	aGOpIrEanSiNzme0OFHUeA	abc@gmail.com	\N	\N
88	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-d2fbd34278	f087f12da6	2017-05-10 10:00:03.018188	2017-05-10 10:01:31.395203	78	\N	8Z_rfXYNI6tHivUx4uZ2tQ	abc@gmail.com	\N	\N
81	new	58.8286000000000005498	t	3.8486000000000005498	54.98	25.0	order-0b00a5b6d3	8d8f30a10d	2017-05-10 05:52:45.565204	2017-05-10 05:57:45.225582	73	\N	4ukOUt2nsDavZVUGQvIDNg	abc@gmail.com	\N	\N
82	new	27.8093000000000002599	t	1.8193000000000002599	25.99	\N	order-6ed8698548	c2841db45e	2017-05-10 06:15:55.393022	2017-05-10 06:39:09.025059	75	\N	TxFjsRkhTf2BLQgKbZ-Jeg	abc@gmail.com	\N	\N
89	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-54954620a8	d542de5ae7	2017-05-10 10:05:52.415367	2017-05-10 10:06:52.606315	79	\N	fIsxRfjjdCO-MDRHUxQwBg	abc@gmail.com	3692	\N
84	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-ee8fb9bf80	308428b283	2017-05-10 07:03:36.884454	2017-05-10 07:03:36.884454	\N	\N	\N	abc@gmail.com	\N	\N
83	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-e236d6efe0	aef320b299	2017-05-10 06:42:38.37344	2017-05-10 06:43:32.143037	76	\N	p9ax7_NGz0hJKipg9bZwhg	abc@gmail.com	\N	\N
94	new	33.1593000000000003099	t	2.1693000000000003099	30.99	15.0	order-a32cdb7e76	9bb57ed1d1	2017-05-10 11:27:34.004129	2017-05-10 11:28:39.391222	86	\N	ckj3bd2dYqs9VGaOTFFfcQ	abc@gmail.com	4151	\N
92	new	91.9879000000000008597	t	6.0179000000000008597	85.97	\N	order-4df220d553	9d2df85868	2017-05-10 10:47:34.654366	2017-05-10 11:26:07.699856	85	\N	oV7NvVkvY7h-qb6g_ol0jw	abc@gmail.com	7996	\N
91	new	91.9879000000000008597	t	6.0179000000000008597	85.97	\N	order-a4664b0bfd	b0ceb7fce8	2017-05-10 10:39:03.51022	2017-05-10 10:46:02.476178	83	\N	6TKGwxFNNpD5uOPpxcc2xA	abc@gmail.com	\N	\N
97	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-8a95b71d9c	d075e8da3d	2017-05-10 11:38:09.274074	2017-05-10 11:39:07.988581	93	\N	_68jRBDRflboPrmhUxz5dw	abc@gmail.com	2346	\N
99	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-b18ab8edcd	23cf7f522e	2017-05-10 11:42:59.881343	2017-05-10 11:42:59.881343	\N	\N	\N	abc@gmail.com	\N	\N
96	new	66.3186000000000006198	t	4.3386000000000006198	61.98	\N	order-c072b9297e	dac3b3d735	2017-05-10 11:33:17.864196	2017-05-10 11:36:51.568553	92	\N	Bnl5ImQu7bC-a_LuLvVa5w	abc@gmail.com	\N	\N
98	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-6b7131c3f5	706f1176fd	2017-05-10 11:41:17.795717	2017-05-10 11:42:32.518444	94	\N	I-jrTpePvLL58Mg0HMAQzQ	abc@gmail.com	\N	\N
100	new	165.7965000000000015495	t	10.8465000000000015495	154.95	25.0	order-6b0cffa3ed	cb207adca8	2017-05-10 12:04:32.214326	2017-05-10 12:12:46.243391	95	\N	VLUtyNh3-nEmebjp-qJojw	abc@gmail.com	\N	\N
101	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-78cf6efbfd	d814e5fc15	2017-05-10 12:16:14.730443	2017-05-10 12:16:50.470392	96	\N	JrulV8MZym8xfaYylV6rrg	abc@gmail.com	5803	\N
102	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-a306de0090	bea27eefba	2017-05-10 12:16:58.713827	2017-05-10 12:17:27.133711	97	\N	BlqqGA-vxva9ee5ZwWHmOg	abc@gmail.com	\N	\N
103	new	33.1593000000000003099	t	2.1693000000000003099	30.99	15.0	order-e7fb6f4668	471b899e7e	2017-05-10 12:18:41.477793	2017-05-10 12:20:31.10771	98	\N	9Y2ReeVyCCqWwgUHbCCGmw	abc@gmail.com	\N	\N
105	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-07ae73a3c5	2523856565	2017-05-10 12:24:30.749205	2017-05-10 12:25:11.256148	100	\N	9FD_QDgpGg2BZdTOr4RH_g	abc@gmail.com	\N	\N
106	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-0668ba0688	c160b8e19f	2017-05-10 12:25:19.532779	2017-05-10 12:27:30.483797	102	\N	ZybvcIzyjKhnVGUVJF-mUw	abc@gmail.com	\N	\N
108	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-e776e896b7	acfcbe9595	2017-05-10 12:30:10.458803	2017-05-10 12:30:10.458803	\N	\N	\N	abc@gmail.com	\N	\N
104	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-b9d5529578	42dfe6ef28	2017-05-10 12:20:37.692385	2017-05-10 12:23:17.869321	99	\N	TPF8JrnrgbFpssT0-iDNMg	abc@gmail.com	1884	\N
125	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-9cae3d0204	2b461f8a70	2017-05-15 06:18:40.354966	2017-05-15 06:25:27.974349	115	\N	pcg2pu4QEvlDwPh0WjAeug	abc@gmail.com	7972	\N
107	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-63d07febd9	32a3815708	2017-05-10 12:27:41.065947	2017-05-10 12:28:00.37775	103	\N	GCd2k-NiSni4SscgvEwgSQ	abc@gmail.com	\N	\N
117	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-71e331c9cd	28547091c9	2017-05-10 14:51:08.871228	2017-05-10 14:57:17.582107	109	\N	10tFiEn7xJ2G_TClf8YsaA	abc@gmail.com	3045	\N
143	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-1fd1f5d19c	92ab1d13d8	2017-05-16 06:37:00.909693	2017-05-16 06:42:07.210175	126	\N	D_huVA9K_z66fnsMC7f6DQ	abc@gmail.com	2602	\N
118	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-00003a7748	fee686c55c	2017-05-10 15:22:56.483124	2017-05-10 15:26:52.766884	110	\N	7WwEfajy4WL961y3nKMiAA	abc@gmail.com	2139	\N
109	new	66.3186000000000006198	t	4.3386000000000006198	61.98	15.0	order-6e681392e8	c29c842990	2017-05-10 12:40:17.751088	2017-05-10 13:29:48.531341	104	\N	9FH83MS2bO5HvfTGX5NWLA	zxczxc@czxc.ccc	5572	\N
126	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-fca38fc1f5	ecec5c5e94	2017-05-15 06:27:38.446259	2017-05-15 06:28:18.108381	116	\N	rLJhqVjfZ1itgGB8xmjWLQ	abc@gmail.com	8404	\N
110	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-097991ec62	60871c1d87	2017-05-10 13:45:10.650841	2017-05-10 13:45:53.452045	105	\N	iIGAcgVUUJrrZTRtourhiA	abc@gmail.com	\N	\N
136	new	66.3186000000000006198	t	4.3386000000000006198	61.98	25.0	order-8d178761be	9dce5773eb	2017-05-15 10:50:15.44749	2017-05-16 04:37:37.813003	119	\N	kjP1_osJVJCbC-rtZIiMdA	abc@gmail.com	7003	\N
119	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-9d92f97e90	7db64c34b8	2017-05-11 10:24:45.634801	2017-05-11 11:20:04.696971	110	\N	\N	abc@gmail.com	876	\N
112	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-d73eace274	a38d51e338	2017-05-10 13:48:37.185652	2017-05-10 13:48:37.185652	\N	\N	\N	abc@gmail.com	\N	\N
120	new	25.6693000000000002399	f	1.6793000000000002399	23.99	0.0	order-5bac271d3e	59b65b4bac	2017-05-11 12:56:20.097221	2017-05-11 12:56:20.097221	\N	\N	\N	abc@gmail.com	\N	\N
127	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-33b834ab61	9b0c3f1dad	2017-05-15 06:29:25.899624	2017-05-15 06:40:06.097789	\N	\N	\N	abc@gmail.com	5218	\N
121	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-972fa0b363	ef35d65b39	2017-05-15 05:52:38.911565	2017-05-15 05:56:51.567824	111	\N	jgr4Wa4S4sSvgiFv1mZnBg	abc@gmail.com	\N	\N
122	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-8eab7d80d4	bed8a99d28	2017-05-15 05:57:02.157506	2017-05-15 06:03:25.845545	112	\N	KbacEoTlgDsLBZaQ-XvdEA	abc@gmail.com	5007	\N
128	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-6ad09a12ec	bc66ec7d59	2017-05-15 06:40:55.736576	2017-05-15 06:41:47.085448	117	\N	3FnSW_ulr3Z1Gbbtp2HmIA	abc@gmail.com	4183	\N
111	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-c5f939e83b	070f05c107	2017-05-10 13:46:21.899088	2017-05-10 13:47:08.884142	106	\N	8PBazDqxnO-5eKta3St2Ow	abc@gmail.com	5332	\N
129	new	0.0	f	0.0	0.0	0.0	\N	\N	2017-05-15 06:42:20.889966	2017-05-15 06:42:20.889966	\N	\N	\N	\N	8009	\N
113	new	186.1158000000000017394	f	12.1758000000000017394	173.94	\N	order-12de2f8407	d19164f506	2017-05-10 13:50:01.498939	2017-05-10 14:34:21.338638	107	\N	\N	abc@gmail.com	5352	\N
123	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-eb038e66e0	85ae5bca55	2017-05-15 06:04:22.172085	2017-05-15 06:09:14.252154	113	\N	_SzBKPuyHIDTlCAtjB1XRQ	abc@gmail.com	802	\N
114	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-8f3096b670	cef37452ec	2017-05-10 14:37:43.954879	2017-05-10 14:39:11.465928	108	\N	iMOxzIVfl3s1jXhxtbrDuQ	abc@gmail.com	5223	\N
115	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-c93dff1e0f	68af14b4e7	2017-05-10 14:48:11.638849	2017-05-10 14:48:11.638849	\N	\N	\N	abc@gmail.com	\N	\N
116	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-7da18fbc60	fa774ebdf5	2017-05-10 14:50:15.963626	2017-05-10 14:50:15.963626	\N	\N	\N	abc@gmail.com	\N	\N
137	new	66.3186000000000006198	t	4.3386000000000006198	61.98	25.0	order-2277da9c0a	62c6518336	2017-05-16 04:38:11.883997	2017-05-16 06:01:07.383135	120	\N	4v770EfIQUXKv47XHKYIRw	abc@gmail.com	\N	\N
148	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-2859988716	8e423a6d08	2017-05-16 07:00:59.412217	2017-05-16 07:01:35.195147	131	\N	iSRL7A4TeY00A_Mly1_UXA	abc@gmail.com	\N	\N
124	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-ecb1ecb714	c6e921500e	2017-05-15 06:09:29.203692	2017-05-15 06:10:11.969151	114	\N	9Z5xnwXFcovlH2o38uGvEQ	abc@gmail.com	9463	\N
138	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-c09fa1446d	34410d66f6	2017-05-16 06:03:34.409367	2017-05-16 06:04:24.175112	121	\N	_mQocEVLtm7o-ZQUGNwPfw	abc@gmail.com	\N	\N
130	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-3de5ef56ed	9a0ecb3442	2017-05-15 06:49:30.557455	2017-05-15 07:06:22.594532	118	\N	_d1or0lhn7CaWzRBXx-9Wg	abc@gmail.com	7785	\N
134	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-f796007773	aecf0fe963	2017-05-15 07:06:56.781324	2017-05-15 07:06:56.781324	\N	\N	\N	abc@gmail.com	\N	\N
135	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-0c39a29023	4be417e56a	2017-05-15 07:10:10.944931	2017-05-15 07:10:10.944931	\N	\N	\N	abc@gmail.com	\N	\N
141	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-0b949ffd14	f6340dae26	2017-05-16 06:22:25.315379	2017-05-16 06:24:54.536719	124	\N	0WwIo8GHylyR5nugjoOWbQ	abc@gmail.com	1549	\N
139	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-7c68d4a403	122d214be7	2017-05-16 06:04:41.994606	2017-05-16 06:05:40.751378	122	\N	5dILqOB4w8xWAs5Gx1tW1w	abc@gmail.com	\N	\N
144	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-5edbf2babe	e811e25536	2017-05-16 06:42:12.588804	2017-05-16 06:44:23.869083	127	\N	mkGlJlVlFqwGlFs1CfR27w	abc@gmail.com	7451	\N
140	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-3dc2018139	c80c42eefd	2017-05-16 06:07:34.499229	2017-05-16 06:22:13.645568	123	\N	aOgjjtw5kP94kUijaivJMQ	abc@gmail.com	7004	\N
142	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-15a42559c7	ce513ab3a5	2017-05-16 06:26:59.836186	2017-05-16 06:36:53.583068	125	\N	-v9zKcTuVYIEiWnauMB6iw	abc@gmail.com	1013	\N
146	new	66.3186000000000006198	t	4.3386000000000006198	61.98	\N	order-7ec6ccbf49	45c9ba6e5b	2017-05-16 06:54:20.076149	2017-05-16 06:57:53.322162	129	\N	8QXn4bx-BXDfITLO0WppIw	abc@gmail.com	3114	\N
145	new	66.3186000000000006198	t	4.3386000000000006198	61.98	\N	order-282e10738d	cc9cb8a0eb	2017-05-16 06:44:27.08154	2017-05-16 06:54:13.080241	128	\N	T9xw6QMJmzKal6Ra2oFbzQ	abc@gmail.com	\N	\N
149	new	66.3186000000000006198	t	4.3386000000000006198	61.98	25.0	order-425215bd26	56c26a9048	2017-05-16 07:01:47.398295	2017-05-16 07:10:12.855667	132	\N	eOUvhXMSR_ys3CQv7YS6eA	abc@gmail.com	9555	\N
150	new	66.3186000000000006198	t	4.3386000000000006198	61.98	\N	order-0101686763	fd185a0e67	2017-05-16 07:10:18.966154	2017-05-16 07:29:42.91479	133	\N	fKfzLK2hwQw9TPqMV_oa6w	abc@gmail.com	\N	\N
151	new	33.1593000000000003099	t	2.1693000000000003099	30.99	15.0	order-a7c51ff07c	84e98b9e37	2017-05-16 07:29:56.583799	2017-05-16 07:31:36.222264	134	\N	y33_jv_d8wY3EvecFQr9aQ	abc@gmail.com	6736	\N
152	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-91b65762c8	ec42e3a55c	2017-05-16 07:32:22.907229	2017-05-16 07:34:32.246886	135	\N	9w1jmjK4fwnpyWECyQoLXA	abc@gmail.com	326	\N
147	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-86b3ed96b2	f54181a22a	2017-05-16 06:58:01.327076	2017-05-16 07:33:43.495837	130	\N	za3EYl5wj6DbESJawwbi5w	abc@gmail.com	6326	\N
153	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-61ff6c4911	cd0dd667ba	2017-05-16 07:34:37.600735	2017-05-16 07:35:06.861253	136	\N	kyTdJy4UIEdBt1ySZE5p_w	abc@gmail.com	\N	\N
154	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-54d3d1f8cd	7512f98c20	2017-05-16 07:48:30.638583	2017-05-16 07:49:11.932983	137	\N	\N	abc@gmail.com	\N	\N
180	new	66.3186000000000006198	f	4.3386000000000006198	61.98	15.0	order-bf0de015ef	15e0b6f452	2017-05-18 07:33:52.215733	2017-05-18 08:30:26.550959	164	\N	\N	dfsd@xcxc.ccc	\N	\N
187	new	0.0	f	0.0	0.0	\N	order-833cf6b31f	5e7f60a879	2017-05-19 13:11:52.811959	2017-05-19 13:12:21.952578	171	\N	\N	abc@gmail.com	\N	\N
156	new	66.3186000000000006198	t	4.3386000000000006198	61.98	25.0	order-2e674208cc	c92fb10587	2017-05-17 05:26:19.386557	2017-05-17 05:45:52.56997	139	\N	F53GdEFM9FjVB2iMlKSDEQ	abc@gmail.com	5376	\N
169	new	33.1593000000000003099	t	2.1693000000000003099	30.99	\N	order-5a15c38074	d3cddbe5bf	2017-05-17 12:43:44.649837	2017-05-17 12:46:46.18156	152	\N	OTSe9joRnjgiTHVUjAQhfQ	abc@gmail.com	4409	\N
170	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-7fb1e23f8e	8f59a2632f	2017-05-17 12:49:35.807077	2017-05-17 12:50:24.893586	154	\N	\N	abc@gmail.com	\N	\N
155	new	0.0	f	0.0	0.0	0.0	order-502f914fda	c853ac1081	2017-05-17 05:22:56.183145	2017-05-17 05:47:27.657895	138	\N	\N	abc@gmail.com	\N	\N
157	new	33.1593000000000003099	f	2.1693000000000003099	30.99	6.0	order-44fc08f7da	bf8b2fb001	2017-05-17 05:48:15.279302	2017-05-17 05:51:17.741371	140	\N	\N	abc@gmail.com	\N	\N
158	new	33.1593000000000003099	f	2.1693000000000003099	30.99	25.0	order-fe0839c627	9247d5d293	2017-05-17 05:52:02.521171	2017-05-17 05:52:14.351552	141	\N	\N	abc@gmail.com	\N	\N
188	new	0.0	f	0.0	0.0	\N	order-b7b7a75a01	3ca06bca86	2017-05-19 14:10:46.861179	2017-05-19 14:12:56.70344	172	\N	\N	abc@gmail.com	\N	\N
159	new	66.3186000000000006198	t	4.3386000000000006198	61.98	15.0	order-2b3beb8146	29e75dee29	2017-05-17 05:59:54.072435	2017-05-17 06:00:42.233112	142	\N	d6Plaau6FTZjxYji0hzicw	abc@gmail.com	7842	\N
160	new	33.1593000000000003099	f	2.1693000000000003099	30.99	25.0	order-5f82932c46	8929661189	2017-05-17 06:00:46.00507	2017-05-17 06:00:57.566664	143	\N	\N	abc@gmail.com	\N	\N
161	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-7e9d811109	8e4b9aa4ad	2017-05-17 06:01:15.992167	2017-05-17 06:01:29.32278	144	\N	\N	abc@gmail.com	\N	\N
162	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-7eb87a7c1c	efed34c9a7	2017-05-17 06:10:02.848559	2017-05-17 06:10:14.576175	145	\N	\N	abc@gmail.com	\N	\N
181	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-fab13f4f33	b94bd384df	2017-05-18 08:31:10.09059	2017-05-18 09:00:53.815157	165	\N	7TQ34GxBM48d4QoSr2JTKw	zcxzc@zxczxc.cccc	7163	\N
164	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-0d98eaac7d	1c49228d65	2017-05-17 06:24:52.368783	2017-05-17 06:25:37.343252	147	\N	\N	abc@gmail.com	\N	\N
176	new	114.4472000000000010696	f	7.4872000000000010696	106.96	25.0	order-2261b0a77c	1010f7c5de	2017-05-17 13:29:36.475106	2017-05-17 14:17:47.908705	161	\N	\N	abc@gmail.com	\N	\N
163	new	66.3186000000000006198	t	4.3386000000000006198	61.98	15.0	order-870c1b562b	6cea9ebff8	2017-05-17 06:10:27.250736	2017-05-17 06:31:04.142125	146	\N	bMrZTtTzUSjr__vuJ61kGA	abc@gmail.com	4437	\N
165	new	33.1593000000000003099	f	2.1693000000000003099	30.99	\N	order-e58437cece	761505862c	2017-05-17 06:32:45.890496	2017-05-17 06:32:58.989753	148	\N	\N	abc@gmail.com	\N	\N
177	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-5e9e0fb86c	befd3a4143	2017-05-18 04:38:33.703646	2017-05-18 04:38:33.703646	\N	\N	\N	abc@gmail.com	\N	\N
166	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-c2705e4082	f6458e3645	2017-05-17 08:31:23.599122	2017-05-17 08:32:09.021465	149	\N	1McrEsoOl3P5owo4oIa_og	abc@gmail.com	2242	\N
171	new	33.1593000000000003099	t	2.1693000000000003099	30.99	15.0	order-384d938dbd	b25b5df831	2017-05-17 12:53:38.877299	2017-05-17 13:00:11.026225	157	\N	4Pgjni6OUcdIBaIJxA3_zg	deshbhratarakash@gmail.com	1508	\N
167	new	27.8093000000000002599	t	1.8193000000000002599	25.99	25.0	order-6335f8c468	288b7c5d23	2017-05-17 08:32:25.188339	2017-05-17 08:34:19.070497	150	\N	cwg08eX8IsnVAT5kjsHsWQ	abc@gmail.com	3598	\N
184	new	129.47000000000000121	t	8.47000000000000121	121.0	25.0	order-2cb13a51a4	a899dc5c11	2017-05-19 08:39:00.55788	2017-05-19 08:55:11.113439	167	\N	UjD19Y0YO2dTRIxnHv0mqg	abc@gmail.com	\N	\N
172	new	33.1593000000000003099	t	2.1693000000000003099	30.99	15.0	order-98f231aa06	af92d0424f	2017-05-17 13:00:18.960513	2017-05-17 13:05:36.343738	158	\N	gaxI3EVMiOYqth3CMNecrQ	deshbhratarakash@gmail.com	2849	\N
178	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-c3a2668f4e	5e8e166790	2017-05-18 04:38:45.333202	2017-05-18 04:54:21.076112	162	\N	152atUtsRuJUpHNsxXsjwA	xyz@gmail.com	7382	\N
173	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-30b17c38b1	3f92b3dea2	2017-05-17 13:06:00.948733	2017-05-17 13:06:41.557943	159	\N	iMdsLk7LZo0t3_ucgupzCg	abc@gmail.com	\N	\N
189	new	129.47000000000000121	t	8.47000000000000121	121.0	\N	order-8bd47eea40	80349d3e9b	2017-05-19 14:29:14.561784	2017-05-19 14:31:21.151885	173	\N	TJ5dWAG9GnV8kpbjF_87SA	abc@gmail.com	\N	\N
174	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-20371ac3bf	56a92efcd3	2017-05-17 13:06:49.872735	2017-05-17 13:08:42.770098	160	\N	aRKWdEJ4paxhazUx-UmQmA	abc@gmail.com	7844	\N
175	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-1174fcd6bd	cbc7f4a971	2017-05-17 13:08:47.773837	2017-05-17 13:08:47.773837	\N	\N	\N	abc@gmail.com	\N	\N
182	new	66.3186000000000006198	t	4.3386000000000006198	61.98	25.0	order-4ff40ae1fb	bbc3a25370	2017-05-18 09:00:57.236124	2017-05-18 11:24:08.477695	166	\N	-YQ1Zo6EDFLLkYO6hnwong	abc@gmail.com	3202	\N
183	new	33.1593000000000003099	f	2.1693000000000003099	30.99	0.0	order-9ae80823a5	ee5cade0b0	2017-05-19 06:56:20.327105	2017-05-19 06:56:20.327105	\N	\N	\N	abc@gmail.com	\N	\N
179	new	33.1593000000000003099	t	2.1693000000000003099	30.99	25.0	order-8b4fedcf5e	9eef50fab7	2017-05-18 04:57:02.894964	2017-05-18 04:59:07.586848	163	\N	L6bN2Tg4uFXE3_Z6Ud31tA	xyz@gmail.com	581	\N
185	new	129.47000000000000121	f	8.47000000000000121	121.0	\N	order-33641b1a8d	a2a7e9d61d	2017-05-19 08:55:18.945715	2017-05-19 09:15:51.56938	168	\N	\N	abc@gmail.com	\N	\N
192	new	0.0	f	0.0	0.0	25.0	order-aaf83b6601	2417d39968	2017-05-19 14:37:41.784046	2017-05-19 14:37:50.105976	176	\N	\N	abc@gmail.com	\N	\N
190	new	129.47000000000000121	t	8.47000000000000121	121.0	\N	order-95dd366b72	fdb3474b80	2017-05-19 14:31:33.984133	2017-05-19 14:32:15.357475	174	\N	F7hTGWg3tqLBJhxciORiMw	abc@gmail.com	\N	\N
186	new	0.0	f	0.0	0.0	25.0	order-c6643ed92b	bc7dd61fbf	2017-05-19 11:45:48.385968	2017-05-19 11:47:20.556418	170	\N	\N	cczx@zczxc.cccc	\N	\N
191	new	129.47000000000000121	t	8.47000000000000121	121.0	25.0	order-c55740b885	c4a4039a63	2017-05-19 14:32:21.896823	2017-05-19 14:37:32.138791	175	\N	6kke3rWlMvEAeK_UNVvYeg	abc@gmail.com	\N	\N
193	new	0.0	t	0.0	0.0	\N	order-cab3f16369	2f41d1bd5b	2017-05-22 10:27:07.080625	2017-05-22 12:59:03.913074	177	\N	xQuOuRgL9hvHijTpp9cD5w	abc@gmail.com	\N	\N
194	new	0.0	t	0.0	0.0	0.0	\N	\N	2017-05-22 13:00:22.7484	2017-05-22 13:00:22.7484	\N	\N	jYDxnz3CT6e_uiXJnCDyOA	\N	\N	\N
195	new	0.0	t	0.0	0.0	\N	order-a34be8ea59	c91d628821	2017-05-22 13:01:18.145496	2017-05-22 13:01:45.619654	178	\N	JIphayHB3IkldcSbK-xIug	abc@gmail.com	\N	\N
196	new	0.0	t	0.0	0.0	\N	order-06b6679c3c	d4e5626404	2017-05-22 13:01:55.984291	2017-05-22 13:31:58.875787	179	\N	RKYIsJAD9A_BpWJCxQwgPw	abc@gmail.com	\N	\N
197	new	0.0	t	0.0	0.0	\N	order-23a6267d91	c6fec2cbf0	2017-05-22 13:32:03.266216	2017-05-22 14:44:22.205589	181	\N	x6w5HocPHcZgslJNQdgaoA	abc@gmail.com	\N	\N
198	new	0.0	t	0.0	0.0	\N	order-ac96593019	04d855a2d4	2017-05-22 14:48:23.0668	2017-05-22 14:58:27.702855	182	\N	oQ76Pi0t4DW81jtFQZoEEg	abc@gmail.com	\N	\N
199	new	129.47000000000000121	f	8.47000000000000121	121.0	\N	order-036ae30f6e	48b738ce17	2017-05-23 04:54:04.61182	2017-05-23 04:54:44.161509	183	\N	\N	abc@gmail.com	\N	\N
200	new	267.5000000000000025	t	17.5000000000000025	250.0	25.0	order-551177ba85	fd78d26e09	2017-05-23 07:20:35.893549	2017-05-23 08:06:31.517522	184	\N	6fXrvKG9jLJ2P8kgjV-C6A	xyz@gmail.com	\N	\N
201	new	0.0	t	0.0	0.0	25.0	order-dcb76fcb35	991e69049d	2017-05-23 08:07:00.966123	2017-05-23 08:08:26.535887	185	\N	UF4pzbBXE-FkPZ-lR1nuOQ	abc@gmail.com	\N	\N
202	new	0.0	t	0.0	0.0	\N	order-eaeca3f8be	e8bc82071c	2017-05-23 08:08:29.840385	2017-05-23 08:09:44.853793	186	\N	UQkJlt88b6uUm2SNKJbEXw	abc@gmail.com	\N	\N
203	new	0.0	t	0.0	0.0	\N	order-0b855ac7f2	ba0b2c71dd	2017-05-23 08:10:10.554861	2017-05-23 08:11:56.386554	187	\N	IxouuA790vSQlK4bTuyBew	abc@gmail.com	\N	\N
204	new	0.0	t	0.0	0.0	\N	order-b9d841b458	16da7b170c	2017-05-23 08:12:01.79119	2017-05-23 08:12:27.39972	188	\N	p45CL43eSSosiuVWiAAAFQ	abc@gmail.com	\N	\N
205	new	0.0	t	0.0	0.0	25.0	order-f224bfca5d	dc31990d52	2017-05-23 08:13:07.190664	2017-05-23 08:14:42.155386	189	\N	fGiW1dDJZwOHDpn9GyvmrA	xyz@gmail.com	9885	\N
206	new	0.0	f	0.0	0.0	0.0	order-1e22e16cdf	8cb4b65ab3	2017-05-23 13:32:49.709666	2017-05-23 13:32:49.709666	\N	\N	\N	abc@gmail.com	\N	\N
207	new	0.0	f	0.0	0.0	25.0	order-5d515754e7	2ab4163063	2017-05-23 14:21:39.778777	2017-05-23 14:23:09.459367	190	\N	\N	abc@gmail.com	\N	\N
208	new	3127.61000000000002923	f	204.61000000000002923	2923.0	\N	order-595c461388	d6526fdfa6	2017-05-24 13:47:58.127553	2017-05-24 14:54:51.298917	191	\N	\N	abc@gmail.com	\N	\N
209	new	0.0	f	0.0	0.0	0.0	order-6019649a9f	fc3d7778fd	2017-05-25 07:36:26.550079	2017-05-25 07:36:42.637763	\N	\N	\N	abc@gmail.com	\N	\N
210	new	428.000000000000004	t	28.000000000000004	400.0	25.0	order-22b84f4601	80e4ad86cb	2017-05-26 14:54:55.528425	2017-05-26 14:56:43.172172	192	\N	3Sc1wMlO-YOo9RCxMdqddA	abc@gmail.com	\N	\N
211	new	214.000000000000002	t	14.000000000000002	200.0	25.0	order-72d9743adb	5c6c5b723c	2017-05-26 14:58:20.266417	2017-05-26 14:58:47.281033	193	\N	_FCKdLYbRJcOMlaQCij2Tg	abc@gmail.com	\N	\N
212	new	0.0	f	0.0	0.0	0.0	\N	\N	2017-05-26 15:02:01.423946	2017-05-26 15:02:01.423946	\N	\N	\N	\N	\N	\N
213	new	642.000000000000006	t	42.000000000000006	600.0	25.0	order-ca271d5f5b	064090c8fc	2017-05-26 15:02:19.549186	2017-05-26 15:04:43.669636	194	\N	JeiMK8KuIalsuhdUlyTj1w	abc@gmail.com	\N	\N
214	new	214.000000000000002	t	14.000000000000002	200.0	\N	order-9d33b4f6fd	4084438714	2017-05-26 15:05:40.70798	2017-05-26 15:06:25.071451	195	\N	gSGmAAM2z1Q8nkotia21hA	abc@gmail.com	\N	\N
215	new	535.000000000000005	t	35.000000000000005	500.0	25.0	order-33d8768cbd	b480083905	2017-05-26 15:07:46.726627	2017-05-26 15:08:12.84645	196	\N	FoYOqAoPaATMYsZgBHd7Eg	abc@gmail.com	\N	\N
216	new	\N	t	\N	\N	\N	order-1e3df6f09d	cdce7f8eb2	2017-05-27 06:41:16.279014	2017-05-27 09:09:45.943964	197	\N	yFtS2rJqQeGl3W9OoA7Wbg	abc@gmail.com	\N	\N
217	new	\N	t	\N	\N	\N	order-94a8db0a88	0a121e96ed	2017-05-27 09:21:08.054503	2017-05-27 09:41:01.514583	198	\N	kRzW4NqdZZL96ZmJrGdE2w	abc@gmail.com	\N	\N
218	new	\N	f	\N	\N	\N	order-c7f0469bcb	430ce0056a	2017-05-27 09:42:15.45739	2017-05-27 09:42:15.45739	\N	\N	\N	abc@gmail.com	\N	\N
219	new	\N	f	\N	\N	\N	order-6d5e66fb17	90f6d86a76	2017-05-27 09:42:56.322171	2017-05-27 09:42:56.322171	\N	\N	\N	abc@gmail.com	\N	\N
220	new	\N	t	\N	\N	\N	order-4abed92adc	a283d31be3	2017-05-27 10:42:52.906026	2017-05-27 10:43:39.248668	199	\N	_3RJaaI3Q3EW8zFyDbHvHA	abc@gmail.com	\N	\N
221	new	\N	f	\N	\N	\N	order-af2fad39b6	22a566fbc6	2017-05-27 11:01:24.784689	2017-05-27 11:01:24.784689	\N	\N	\N	abc@gmail.com	\N	\N
222	new	\N	t	\N	\N	\N	order-59aaa612d9	92a5120840	2017-05-27 13:43:23.683627	2017-05-27 13:44:18.587872	200	\N	mUFLsanTmsQlK3KIQAYaYA	abc@gmail.com	\N	\N
244	new	\N	t	\N	\N	\N	order-32f3a6d976	cf1374a4a4	2017-05-30 13:06:42.131214	2017-05-30 13:52:54.640599	208	\N	Hyv4ILv2W2_Pv92JsXj1Pw	abc@gmail.com	\N	\N
223	new	\N	t	\N	\N	\N	order-4aab701448	3c3d29b515	2017-05-27 13:45:09.815297	2017-05-27 13:47:30.53261	201	\N	BeXHknO_K6Fv41_ovwrkxA	abc@gmail.com	\N	\N
224	new	\N	f	\N	\N	\N	order-8381ffcd3c	bb54126810	2017-05-27 13:48:13.675045	2017-05-27 13:48:13.675045	\N	\N	\N	abc@gmail.com	\N	\N
225	new	\N	f	\N	\N	\N	order-ad48fd0a74	852c6b0daf	2017-05-27 16:37:10.331366	2017-05-27 16:37:10.331366	\N	\N	\N	abc@gmail.com	\N	\N
226	new	\N	f	\N	\N	\N	order-91fefe8fbd	c6cca8df49	2017-05-27 17:18:38.963001	2017-05-27 17:18:38.963001	\N	\N	\N	abc@gmail.com	\N	\N
227	new	\N	t	\N	\N	\N	order-67ec7f26ae	796769db7d	2017-05-27 17:57:11.713141	2017-05-27 17:58:03.783584	202	\N	H_IOe-XDB7HDnhqm9dcdLA	abc@gmail.com	\N	\N
228	new	\N	f	\N	\N	\N	order-c13b0fbfd7	263eda12d5	2017-05-27 18:03:31.076391	2017-05-27 18:03:31.076391	\N	\N	\N	abc@gmail.com	\N	\N
229	new	\N	f	\N	\N	\N	order-2221e51737	fd1ad3e790	2017-05-29 09:47:03.56362	2017-05-29 09:47:03.56362	\N	\N	\N	abc@gmail.com	\N	\N
230	new	\N	f	\N	\N	\N	order-380434aac1	9506a837f5	2017-05-29 12:57:35.251935	2017-05-29 12:57:35.251935	\N	\N	\N	abc@gmail.com	\N	\N
231	new	\N	f	\N	\N	\N	order-9a44a7ccab	0900de6241	2017-05-29 13:04:53.396107	2017-05-29 13:04:53.396107	\N	\N	\N	abc@gmail.com	\N	\N
245	new	\N	f	\N	\N	\N	order-4ebe557664	140225a10c	2017-05-30 14:14:33.346062	2017-05-30 14:25:14.122435	209	\N	\N	abc@gmail.com	\N	\N
246	new	\N	f	\N	\N	\N	order-02d5696e5e	b12c1009b7	2017-05-30 19:10:11.603793	2017-05-30 19:10:11.603793	\N	\N	\N	abc@gmail.com	\N	\N
232	new	\N	t	\N	\N	\N	order-dbb46fd2e1	31a5982667	2017-05-29 13:58:20.74546	2017-05-29 14:00:14.196894	203	\N	VyfIePH11xufRR_xx4nvMg	iop@gmail.com	\N	\N
247	new	\N	f	\N	\N	\N	order-21c909c8c4	e275cea337	2017-05-31 08:30:22.062697	2017-05-31 08:30:22.062697	\N	\N	\N	abc@gmail.com	\N	\N
233	new	\N	t	\N	\N	\N	order-21f38da135	acf9c2155b	2017-05-29 14:02:18.749482	2017-05-29 14:08:50.935269	204	\N	XiIUlNjr02SKco-lkWhWzQ	abcd@gmail.com	\N	\N
248	new	\N	t	\N	\N	\N	order-3d531fce01	ca530af7e9	2017-05-31 13:44:00.732569	2017-05-31 13:45:21.047094	210	\N	yk0hYXqG9nwOE3Jrg8Wesw	abc@gmail.com	\N	75
249	new	\N	f	\N	\N	\N	order-3b185a506d	802292e334	2017-06-01 13:55:23.255784	2017-06-01 13:55:23.255784	\N	\N	\N	abc@gmail.com	\N	\N
250	new	\N	f	\N	\N	\N	order-c8d17549e4	ee61d05c86	2017-06-02 14:20:31.465943	2017-06-02 14:20:31.465943	\N	\N	\N	abc@gmail.com	\N	\N
234	new	\N	t	\N	\N	\N	order-9e0f0bd389	8e70ac6513	2017-05-29 14:09:41.660672	2017-05-29 14:12:55.777526	205	\N	p8tRAafa8GoRwJM7BRkC7Q	qwe@gmail.com	7212	\N
251	new	\N	f	\N	\N	\N	order-1bc3473b17	fd4a12aed1	2017-06-02 20:38:56.772142	2017-06-03 07:32:09.135399	\N	\N	\N	shekhar.singh@msn.com	\N	\N
235	new	\N	t	\N	\N	\N	order-80b412388b	61bce37e25	2017-05-29 14:13:27.350786	2017-05-29 14:14:45.39261	206	\N	6C-NxUMBvlTyFcGweOqc-g	abc@gmail.com	\N	\N
236	new	\N	f	\N	\N	\N	order-1e8f352505	7d0ce032e9	2017-05-29 18:35:36.303061	2017-05-29 19:20:50.431513	\N	\N	\N		\N	\N
237	new	\N	f	\N	\N	\N	order-a997fe0a9e	fd895b75c7	2017-05-29 20:22:39.413671	2017-05-29 20:22:39.413671	\N	\N	\N	abc@gmail.com	\N	\N
238	new	\N	f	\N	\N	\N	order-4daf858e9d	71685e166b	2017-05-29 20:25:14.326611	2017-05-29 20:25:28.39665	\N	\N	\N		\N	\N
239	new	\N	f	\N	\N	\N	order-e228ceda87	586e3fd393	2017-05-29 20:34:18.101481	2017-05-29 20:34:18.101481	\N	\N	\N	abc@gmail.com	\N	\N
240	new	\N	f	\N	\N	\N	order-014773edbc	db25eea535	2017-05-29 22:08:32.9344	2017-05-29 22:08:32.9344	\N	\N	\N	abc@gmail.com	\N	\N
241	new	\N	f	\N	\N	\N	order-5691021b7a	31775f8d53	2017-05-30 07:13:03.256987	2017-05-30 07:13:03.256987	\N	\N	\N	abc@gmail.com	\N	\N
242	new	\N	f	\N	\N	\N	order-2afe221909	fb80c98271	2017-05-30 07:14:04.421977	2017-05-30 07:14:04.421977	\N	\N	\N	abc@gmail.com	\N	\N
243	new	\N	f	\N	\N	\N	order-557f1f8619	56dfdbbb1a	2017-05-30 12:19:14.6241	2017-05-30 12:19:14.6241	\N	\N	\N	abc@gmail.com	\N	\N
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('orders_id_seq', 251, true);


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY payments (id, transaction_id, location_id, amount, card_brand, card_last_4, order_id, created_at, updated_at, subscription_id, card_exp_month, card_exp_year, user_id, tender_id) FROM stdin;
27	99d3fcbc-80e3-5646-793d-a18aa98e40e8	CBASEMpple_uhhLP4Efrt0zPbaggAQ	2700	VISA	1111	82	2017-05-10 06:39:08.480297	2017-05-10 06:39:08.480297	\N	\N	\N	\N	\N
28	a98dfd96-9067-5b40-5a2d-a169bf3f2d2f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	83	2017-05-10 06:43:30.578293	2017-05-10 06:43:30.578293	\N	\N	\N	\N	\N
29	e054ef74-a0a9-575b-67f3-52c07654153e	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	87	2017-05-10 09:55:39.849095	2017-05-10 09:55:39.849095	\N	\N	\N	\N	\N
30	04aa4df7-3d37-5df3-7a4e-35dbeb6c5196	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	88	2017-05-10 10:01:31.254883	2017-05-10 10:01:31.254883	\N	\N	\N	\N	\N
31	0b69446d-c2f4-550c-4b64-fef84372b2ec	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	89	2017-05-10 10:06:44.190743	2017-05-10 10:06:44.190743	\N	\N	\N	\N	\N
32	e2007027-b73f-5c4a-7e60-77ffd9011d09	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	90	2017-05-10 10:38:44.270666	2017-05-10 10:38:44.270666	\N	\N	\N	\N	\N
33	88146673-e4a4-5008-7c9c-8a8ace017018	CBASEMpple_uhhLP4Efrt0zPbaggAQ	9100	VISA	1111	91	2017-05-10 10:46:02.382997	2017-05-10 10:46:02.382997	\N	\N	\N	\N	\N
34	30b5c1bd-3a17-56b2-4a3a-c7efd88287b8	CBASEMpple_uhhLP4Efrt0zPbaggAQ	9100	VISA	1111	92	2017-05-10 11:26:00.348011	2017-05-10 11:26:00.348011	\N	\N	\N	\N	\N
35	767860fa-bd7e-5e97-41df-99eb9823d300	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	94	2017-05-10 11:28:29.264262	2017-05-10 11:28:29.264262	\N	\N	\N	\N	\N
36	86217c22-15b8-5013-678e-eb50630c84a5	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	95	2017-05-10 11:32:01.172426	2017-05-10 11:32:01.172426	\N	\N	\N	\N	\N
37	3e2472ea-999f-515f-589d-6e7ad95e11bf	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	96	2017-05-10 11:36:51.424459	2017-05-10 11:36:51.424459	\N	\N	\N	\N	\N
38	92de60b2-6cfc-5b02-5971-314de2762ddd	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	97	2017-05-10 11:39:03.152919	2017-05-10 11:39:03.152919	\N	\N	\N	\N	\N
39	6ce55274-c4fc-5502-4370-136cca25f06b	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	98	2017-05-10 11:42:32.474161	2017-05-10 11:42:32.474161	\N	\N	\N	\N	\N
40	7f4fdec7-614c-5199-6d59-7c16d2f3eb1a	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	100	2017-05-10 12:12:46.105157	2017-05-10 12:12:46.105157	\N	\N	\N	\N	\N
41	768462fe-c30e-5a12-66de-5ccb4a3227d1	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	101	2017-05-10 12:16:48.659107	2017-05-10 12:16:48.659107	\N	\N	\N	\N	\N
42	6b5064dd-faee-532f-722d-1e130aa1d08b	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	102	2017-05-10 12:17:27.029422	2017-05-10 12:17:27.029422	\N	\N	\N	\N	\N
43	ad19b5cb-0b34-53c0-5f73-73a419f43557	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	103	2017-05-10 12:20:31.019964	2017-05-10 12:20:31.019964	\N	\N	\N	\N	\N
44	78cd2402-ae01-59dc-7ca4-ab2e945dcc5e	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	104	2017-05-10 12:23:15.134418	2017-05-10 12:23:15.134418	\N	\N	\N	\N	\N
45	24417348-472a-5f31-5d9f-3f8bf32e2927	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	105	2017-05-10 12:25:11.222555	2017-05-10 12:25:11.222555	\N	\N	\N	\N	\N
46	35630c1a-a78f-5d2c-6ac1-2e8a350e1e8f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	106	2017-05-10 12:27:30.452423	2017-05-10 12:27:30.452423	\N	\N	\N	\N	\N
47	4576b2f3-037a-591f-589a-90798710895b	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	107	2017-05-10 12:28:00.342657	2017-05-10 12:28:00.342657	\N	\N	\N	\N	\N
48	da5e325a-b194-5489-4cbe-e4d508ed2b79	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	109	2017-05-10 13:29:46.362983	2017-05-10 13:29:46.362983	\N	\N	\N	\N	\N
49	93fefcdc-a25a-5fdc-6dee-2edebe3b2f03	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	110	2017-05-10 13:45:53.304144	2017-05-10 13:45:53.304144	\N	\N	\N	\N	\N
50	2001fdea-e65a-5cdd-4df5-3af36b90d78e	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	111	2017-05-10 13:47:03.242455	2017-05-10 13:47:03.242455	\N	\N	\N	\N	\N
51	e4fd2e04-b092-5778-4290-b2be31b5dd84	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	114	2017-05-10 14:38:26.534415	2017-05-10 14:38:26.534415	\N	\N	\N	\N	\N
52	1cc6a233-0184-5276-61e6-111df880e017	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	117	2017-05-10 14:54:58.623689	2017-05-10 14:54:58.623689	\N	\N	\N	\N	\N
54	4d7894ee-e03d-579f-6e6d-4e628d3bc092	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	118	2017-05-10 15:25:46.852615	2017-05-10 15:25:46.852615	\N	\N	\N	\N	7a96b34f-4979-5dea-4639-fd033df760a9
55	6bfb7905-7819-5ab6-5269-faa8e4d1e0c1	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	121	2017-05-15 05:56:34.567452	2017-05-15 05:56:34.567452	\N	\N	\N	\N	fcda35b1-66c6-57c2-47d1-1b6cdab0ace7
56	89e9e9f9-bea2-54c9-4d62-e774fd4a8a8b	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	122	2017-05-15 06:00:27.918867	2017-05-15 06:00:27.918867	\N	\N	\N	\N	ffc241cb-183d-523e-524c-76ea037c24cf
57	adbc28e0-40d9-581d-655f-e48a463a0e8c	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	123	2017-05-15 06:04:56.277496	2017-05-15 06:04:56.277496	\N	\N	\N	\N	4dc8e3e4-f008-5a71-6720-1f1f53a8e60d
58	3857e537-95d2-5f05-5491-c9ae3eec01e7	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	124	2017-05-15 06:10:02.937763	2017-05-15 06:10:02.937763	\N	\N	\N	\N	5097c914-8bee-54a7-6e4e-553d82d034f7
59	9ca34402-ec45-598e-5625-173b5c5036bf	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	125	2017-05-15 06:25:18.432627	2017-05-15 06:25:18.432627	\N	\N	\N	\N	efd1896c-c8c9-507a-5558-d7de6b3eeb7f
60	4bccbc79-1a00-549d-7058-c5f47b85b1c3	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	126	2017-05-15 06:28:12.208843	2017-05-15 06:28:12.208843	\N	\N	\N	\N	120510f9-ad92-5262-7855-3f985a2dd803
61	40f60aac-e60f-595c-5a14-9e8d8e0ebe33	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	128	2017-05-15 06:41:39.043584	2017-05-15 06:41:39.043584	\N	\N	\N	\N	b3659aa3-702e-50b5-6856-b0c1e9a53caf
62	d84eb9aa-f9b4-522b-7078-f5f68e8247b9	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	130	2017-05-15 06:51:14.222278	2017-05-15 06:51:14.222278	\N	\N	\N	\N	e047e099-b13d-505a-653e-8262d8026d13
63	3c99e997-cb1d-50b9-5158-a916544c44ef	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	136	2017-05-16 04:34:53.305795	2017-05-16 04:34:53.305795	\N	\N	\N	\N	dc4e5550-6cc8-5f7c-6c4d-4c4625581966
64	ddeec2e0-a183-52a6-40e2-d62dc4890b5f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	137	2017-05-16 06:00:52.381425	2017-05-16 06:00:52.381425	\N	\N	\N	\N	ea924fd0-cb8b-5916-66b5-a281804867f9
65	dc4d7bab-6f75-5dc0-560e-b813caeec335	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	138	2017-05-16 06:04:13.011095	2017-05-16 06:04:13.011095	\N	\N	\N	\N	bab409bd-c92e-5fa4-5f4c-3d1527303b65
66	6dfc16f4-3580-56c5-4d3b-d08c4e465ea6	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	139	2017-05-16 06:05:24.612079	2017-05-16 06:05:24.612079	\N	\N	\N	\N	9d9d1844-f716-5d5b-5ac6-06abe92860c1
67	286bda68-d282-5add-695d-15babdfb369f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	140	2017-05-16 06:22:07.800892	2017-05-16 06:22:07.800892	\N	\N	\N	\N	99db38bd-2d19-53f2-5b40-1c867629c259
68	f2c97c1f-1581-5158-51f3-b0bf7d481d08	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	141	2017-05-16 06:22:51.407646	2017-05-16 06:22:51.407646	\N	\N	\N	\N	4d755793-55f1-5c57-7444-061f7dde8c3f
69	1538e787-768c-537c-5897-73478b5f180e	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	142	2017-05-16 06:36:47.424638	2017-05-16 06:36:47.424638	\N	\N	\N	\N	0dc9b288-1a81-5b2d-53df-801cf96bc119
70	ab22cc19-a48a-59d6-5324-90f1051d2520	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	143	2017-05-16 06:41:52.447114	2017-05-16 06:41:52.447114	\N	\N	\N	\N	c1050d03-30c4-5152-68a2-48649041b6d7
71	63db5f72-fe00-5220-5104-9915fdc4db18	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	144	2017-05-16 06:44:10.736898	2017-05-16 06:44:10.736898	\N	\N	\N	\N	c4eaadb6-0e47-5545-6aad-89ae45b7e134
72	069b44d9-5ec1-5fd8-6666-13f11c4c93fe	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	145	2017-05-16 06:53:58.637821	2017-05-16 06:53:58.637821	\N	\N	\N	\N	4fe7c643-d9d6-519f-51d5-af431de41984
73	ec3390e4-e180-59ad-7314-6cb36c72121a	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	146	2017-05-16 06:57:46.152641	2017-05-16 06:57:46.152641	\N	\N	\N	\N	9e60969f-3b8f-56cd-4339-275afc590ced
74	edc41fc4-1bcb-5c2c-5df5-d4d363f9806f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	147	2017-05-16 07:00:06.866593	2017-05-16 07:00:06.866593	\N	\N	\N	\N	537f84c8-51a5-5b70-6c90-21eb938fc724
75	981c094e-b711-52b7-6519-56fa19c2e97e	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	148	2017-05-16 07:01:29.006774	2017-05-16 07:01:29.006774	\N	\N	\N	\N	1ba0df4a-e618-5edd-771f-543106e12c37
76	e4d6ac8e-1872-5293-50e6-af7ed7223234	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	149	2017-05-16 07:10:08.318934	2017-05-16 07:10:08.318934	\N	\N	\N	\N	fd1b143c-8fe5-5bbf-7fde-62c809949a86
77	d4fc3991-3f0d-5918-542d-22947bcfa5b8	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	150	2017-05-16 07:29:35.307004	2017-05-16 07:29:35.307004	\N	\N	\N	\N	0fbf443f-3d23-5a16-6758-28bf0e432e3d
78	983d94ee-deaf-5cb2-544c-bdb7410fbea9	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	151	2017-05-16 07:31:29.74763	2017-05-16 07:31:29.74763	\N	\N	\N	\N	a4f2acb5-2293-59d3-6b58-73e58f93e604
79	d297a621-77f6-562a-599e-3a0bb7710c76	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	152	2017-05-16 07:32:57.72649	2017-05-16 07:32:57.72649	\N	\N	\N	\N	2e36174d-f4ac-58ee-65e8-f4d1926b343e
80	354c53d3-323a-577c-6a10-220b51955f15	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	153	2017-05-16 07:35:02.493525	2017-05-16 07:35:02.493525	\N	\N	\N	\N	5908881a-864a-5cd8-4265-52a5c823f97b
81	0f5ec87b-74c3-5f6f-705b-e5146210e5aa	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	156	2017-05-17 05:45:45.100813	2017-05-17 05:45:45.100813	\N	\N	\N	\N	c24ef7cd-b2f7-5e05-7bb1-06f7e69c6ebf
82	ee7cad79-d695-5b2b-4c3d-2209528253bb	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	159	2017-05-17 06:00:35.961113	2017-05-17 06:00:35.961113	\N	\N	\N	\N	e540abfa-bc03-5a0b-6824-f630ba7e409e
83	9f3bdfb7-cd4a-501c-4fc6-3ed8ab8ab337	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	163	2017-05-17 06:30:57.223715	2017-05-17 06:30:57.223715	\N	\N	\N	\N	f7b82e30-80b3-5c9c-41f6-f5e8108d43ed
84	c4369a1b-ee72-51e6-6de5-ff4d0c6d456e	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	166	2017-05-17 08:32:00.102641	2017-05-17 08:32:00.102641	\N	\N	\N	\N	0a0690ac-0a1c-5681-7671-eb9713548d05
85	05447fdd-f98e-500b-6c11-7d744be542cf	CBASEMpple_uhhLP4Efrt0zPbaggAQ	2700	VISA	1111	167	2017-05-17 08:32:49.082587	2017-05-17 08:32:49.082587	\N	\N	\N	\N	b17ed87e-0f6d-5e84-7aad-5ed5011010eb
86	4b5e036b-16d9-550a-7223-dcc293f02a6d	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	169	2017-05-17 12:45:36.919669	2017-05-17 12:45:36.919669	\N	\N	\N	\N	45cb2be7-40a2-5dd4-6dad-10e0346082cc
87	5fe77815-c4c6-5feb-7f66-87df60a74091	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	171	2017-05-17 13:00:04.629141	2017-05-17 13:00:04.629141	\N	\N	\N	\N	d1b91c6d-5016-5762-6f48-b7be57e51eff
88	e276c331-a35a-53e0-443c-943b64d8809b	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	172	2017-05-17 13:04:28.33035	2017-05-17 13:04:28.33035	\N	\N	\N	\N	1a6edee5-443c-54c3-4f53-5a0ab036bdac
89	c0cd516e-3125-50c4-6689-1fda76364406	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	173	2017-05-17 13:06:37.381556	2017-05-17 13:06:37.381556	\N	\N	\N	\N	7b35baf4-37b3-5382-69b8-35a49418a49b
90	f91b9b12-ebcb-5ddf-6276-6373c6910fda	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	174	2017-05-17 13:07:44.740548	2017-05-17 13:07:44.740548	\N	\N	\N	\N	0c942ee3-8fa7-5568-5a6b-ac536ed84285
91	dd971dfd-baef-5712-4a39-e92ec07c7d05	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	178	2017-05-18 04:52:21.259537	2017-05-18 04:52:21.259537	\N	\N	\N	\N	62311776-426a-591b-49d2-b91e100486e1
92	cd1c25b2-a41b-5a71-6019-33ef89709af1	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	179	2017-05-18 04:58:07.480287	2017-05-18 04:58:07.480287	\N	\N	\N	\N	13b61330-5f7b-5df2-7287-ff023260a1a2
93	f662f4cf-9ef9-5f5c-4890-143875b5cff2	CBASEMpple_uhhLP4Efrt0zPbaggAQ	3300	VISA	1111	181	2017-05-18 09:00:46.509255	2017-05-18 09:00:46.509255	\N	\N	\N	\N	fa9aeded-bc07-57fe-72b4-f5b52d36b494
94	145910a0-125a-5ccc-7452-d0525d5cd590	CBASEMpple_uhhLP4Efrt0zPbaggAQ	6600	VISA	1111	182	2017-05-18 11:21:42.110679	2017-05-18 11:21:42.110679	\N	\N	\N	\N	d469cfbb-7216-544b-6c2b-e1d94065df9f
95	3205d089-0ec7-5aca-4a31-4c17b2eacda6	CBASEMpple_uhhLP4Efrt0zPbaggAQ	12900	VISA	1111	184	2017-05-19 08:55:05.394811	2017-05-19 08:55:05.394811	\N	\N	\N	\N	e7a5ad84-7751-56ab-69ba-55ef939e674f
96	b0b34fa4-04de-5e6d-4247-ab920cc2e875	CBASEMpple_uhhLP4Efrt0zPbaggAQ	12900	VISA	1111	189	2017-05-19 14:31:15.055411	2017-05-19 14:31:15.055411	\N	\N	\N	\N	700ec53d-58c1-5243-77ca-9b1ad9235661
97	672f94e9-b521-50e0-63e5-dfc4612bda3f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	12900	VISA	1111	190	2017-05-19 14:32:01.713049	2017-05-19 14:32:01.713049	\N	\N	\N	\N	7e061a66-54d4-52c2-60ee-d02c9d0a5d00
98	2d0c9992-8d60-5cd5-706c-d2bcf14e0d1f	CBASEMpple_uhhLP4Efrt0zPbaggAQ	12900	VISA	1111	191	2017-05-19 14:37:26.01646	2017-05-19 14:37:26.01646	\N	\N	\N	\N	8bcb4180-5dc4-58ec-4d8d-28e836a1c61c
99	60024080732	C31B696DCED1824493AB268AA550A7BE	2	Visa	1111	\N	2017-05-23 10:50:40.1946	2017-05-23 10:50:40.1946	\N	\N	\N	\N	YNQW7S
100	60024086073	414A15DCDEBA660F6B21980F334C149C	3	Visa	1111	\N	2017-05-23 12:42:37.768599	2017-05-23 12:42:37.768599	\N	12	2019	76	EQP6XS
104	60024096961	0100F4783A8E2FB4E06969C7E295ADC6	3	Visa	1111	\N	2017-05-23 14:45:34.498418	2017-05-23 14:45:42.519643	5	12	2019	76	QKOA43
106	60024351776	93ABCC1E43A52C4A57698CB4004A3694	453	Visa	1111	210	2017-05-26 14:56:38.557268	2017-05-26 14:56:38.557268	\N	\N	\N	\N	M7GMSQ
107	60024351818	914EC5522B174260252A7B38B12D0937	239	Visa	1111	211	2017-05-26 14:58:43.690727	2017-05-26 14:58:43.690727	\N	\N	\N	\N	2VOF75
108	60024351884	3FC08F70158489145ABBFE607EC90C87	239	Visa	1111	212	2017-05-26 15:02:01.451953	2017-05-26 15:02:01.451953	\N	\N	\N	\N	AYSH7M
109	60024351978	0CE7C3642D696B738850C102B8DF1375	639	Visa	1111	213	2017-05-26 15:04:39.772807	2017-05-26 15:04:39.772807	\N	\N	\N	\N	7JMVVE
110	60024352046	67A3A7F696F460C8D8BD6807F58DEE2B	229	Visa	1111	214	2017-05-26 15:06:21.346649	2017-05-26 15:06:21.346649	\N	\N	\N	\N	XXFOXU
111	60024352132	513406A8335DEB32BBB6EC817E82BB08	560	Visa	1111	215	2017-05-26 15:08:08.90766	2017-05-26 15:08:08.90766	\N	\N	\N	\N	71UKAJ
112	60024387939	F2FED219C43A6334B416E401C8FF78EC	160	Visa	1111	216	2017-05-27 09:09:40.872207	2017-05-27 09:09:40.872207	\N	\N	\N	\N	IPKNOG
113	60024388094	C4C6B1939B043BB4B9FDD4E63418E350	355	Visa	1111	217	2017-05-27 09:40:48.643543	2017-05-27 09:40:48.643543	\N	\N	\N	\N	Z1GWIV
114	60024388489	F8862378EC6DFC2779F423303EBD1122	75	Visa	1111	220	2017-05-27 10:43:39.16913	2017-05-27 10:43:39.16913	\N	\N	\N	\N	IN26BC
115	60024390432	B080D36D67485ACB977DC5181910C2FE	75	Visa	1111	222	2017-05-27 13:44:18.553928	2017-05-27 13:44:18.553928	\N	\N	\N	\N	URKK5O
116	60024390462	785282C3255F4D6E2ED764FCE251A83F	115	Visa	1111	223	2017-05-27 13:47:30.474043	2017-05-27 13:47:30.474043	\N	\N	\N	\N	ZPZ8AJ
117	60024391598	A22A1D42EC1FB4E20F7ED2D20B15D13C	122	Visa	1111	227	2017-05-27 17:58:03.746525	2017-05-27 17:58:03.746525	\N	\N	\N	\N	UQJUQW
118	60024457224	38CBAEE47790F09E77EE11CBCD650EBE	84	Visa	1111	232	2017-05-29 14:00:14.172359	2017-05-29 14:00:14.172359	\N	\N	\N	\N	D1FVYU
119	60024457430	91E5F51776E4A88640C54D4A7EC0613A	50	Visa	1111	233	2017-05-29 14:08:50.897989	2017-05-29 14:08:50.897989	\N	\N	\N	\N	JVHSYA
120	60024457449	22D8FBFBB76E7486C69007EB88BD4E07	94	Visa	1111	234	2017-05-29 14:10:57.221556	2017-05-29 14:10:57.221556	\N	\N	\N	\N	SR59GZ
121	60024457505	2325F80A8C5576B147F7743E4603FB56	94	Visa	1111	235	2017-05-29 14:14:45.342984	2017-05-29 14:14:45.342984	\N	\N	\N	\N	QGHNXJ
122	60024486733	E28C1DC234F49EEB421C9F1B7D881AFB	35	Visa	1111	244	2017-05-30 13:52:54.616596	2017-05-30 13:52:54.616596	\N	\N	\N	\N	XAL5EW
123	60024522962	5D11FDE0B2320848F159BB8F27F15717	35	Visa	1111	248	2017-05-31 13:45:21.028012	2017-05-31 13:45:21.028012	\N	\N	\N	\N	BRW11N
124	60024628147	454D30C4198D57DF2C023DFCBD84427E	3	Visa	1111	\N	2017-06-02 13:30:33.509545	2017-06-02 13:30:33.529402	7	12	2019	\N	W4B7EY
\.


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('payments_id_seq', 124, true);


--
-- Data for Name: product_prices; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY product_prices (id, product_id, price, created_at, updated_at, book_type) FROM stdin;
109	36	0.0	2017-05-29 06:45:41.030618	2017-05-29 06:45:41.030618	Hardcover
110	36	0.0	2017-05-29 06:45:41.036251	2017-05-29 06:45:41.036251	Paperback
111	36	0.0	2017-05-29 06:45:41.040576	2017-05-29 06:45:41.040576	Hardcover
112	36	0.0	2017-05-29 06:45:41.044954	2017-05-29 06:45:41.044954	Paperback
113	36	34.95	2017-05-29 06:45:41.04794	2017-05-29 06:45:41.04794	Audio
115	37	37.95	2017-05-29 06:46:36.497271	2017-05-29 06:46:36.497271	Hardcover
116	37	29.95	2017-05-29 06:46:36.501574	2017-05-29 06:46:36.501574	Paperback
117	37	0.0	2017-05-29 06:46:36.50537	2017-05-29 06:46:36.50537	Hardcover
118	37	0.0	2017-05-29 06:46:36.511053	2017-05-29 06:46:36.511053	Paperback
119	37	0.0	2017-05-29 06:46:36.514056	2017-05-29 06:46:36.514056	Audio
120	37	0.0	2017-05-29 06:46:36.517404	2017-05-29 06:46:36.517404	Ebook
121	38	34.95	2017-05-29 06:47:09.726803	2017-05-29 06:47:09.726803	Hardcover
122	38	26.95	2017-05-29 06:47:09.730964	2017-05-29 06:47:09.730964	Paperback
123	38	0.0	2017-05-29 06:47:09.735459	2017-05-29 06:47:09.735459	Hardcover
124	38	0.0	2017-05-29 06:47:09.73935	2017-05-29 06:47:09.73935	Paperback
125	38	0.0	2017-05-29 06:47:09.742416	2017-05-29 06:47:09.742416	Audio
126	38	0.0	2017-05-29 06:47:09.745364	2017-05-29 06:47:09.745364	Ebook
114	36	26.95	2017-05-29 06:45:41.051229	2017-05-29 12:37:55.168652	Ebook
\.


--
-- Name: product_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('product_prices_id_seq', 126, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY products (id, name, price, description, created_at, updated_at, image_id, image_filename, image_size, image_content_type, book_download_id, book_download_filename, book_download_content_type, book_types_id, book_versions_id) FROM stdin;
36	Downloadable Versions	\N	 Ebook and Audio Versions 	2017-05-29 06:45:41.01781	2017-05-29 06:45:41.01781	c445f29b3335d7d9de670b96dd20663aa7bbc1aea020af04610dc0ecf4a5	book.png	89788	image/png	\N	\N	\N	\N	\N
37	Colored Version	\N	Colored Version 	2017-05-29 06:46:36.48778	2017-05-29 06:46:36.48778	57377142a73cdd9893cd1c79463b4e35550ad6be47925242edf1662d529e	book.png	89788	image/png	\N	\N	\N	\N	\N
38	Black & White Version	\N	Black & White Version	2017-05-29 06:47:09.721147	2017-05-29 06:47:09.721147	db1a990798a11b7e3e3e986705d442bccf95da2434502afbfb6bf6539846	book.png	89788	image/png	\N	\N	\N	\N	\N
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('products_id_seq', 38, true);


--
-- Data for Name: project_categories; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY project_categories (id, project_id, category_id, created_at, updated_at) FROM stdin;
14	19	2	2017-05-27 14:10:19.758881	2017-05-27 14:10:19.758881
15	20	2	2017-05-27 14:32:46.483965	2017-05-27 14:32:46.483965
16	20	4	2017-05-27 14:32:46.486246	2017-05-27 14:32:46.486246
17	21	2	2017-05-29 14:20:01.334041	2017-05-29 14:20:01.334041
\.


--
-- Name: project_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('project_categories_id_seq', 17, true);


--
-- Data for Name: project_users; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY project_users (id, project_id, user_id, admin, created_at, updated_at) FROM stdin;
15	19	75	t	2017-05-27 14:10:19.763912	2017-05-27 14:10:19.763912
16	20	75	t	2017-05-27 14:32:46.489867	2017-05-27 14:32:46.489867
17	21	79	t	2017-05-29 14:20:01.338724	2017-05-29 14:20:01.338724
\.


--
-- Name: project_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('project_users_id_seq', 17, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY projects (id, name, body, contest_id, votes_count, created_at, updated_at, video_id, video_mp4_id, video_webm_id, tagline, step, finalized, video_filename, video_size, video_content_type, audio_file_name, audio_content_type, audio_file_size, audio_updated_at) FROM stdin;
19	xczz	<p>zxcxzc</p>	2	1	2017-05-27 14:10:19.754803	2017-06-02 16:12:58.925127	b01825a97924148d9822e9beb7e83e3fb9efdcea21fb515cce13b631575e	\N	\N	czxcxz	2	t	TEST VIDEO.mp4	540049	video/mp4	Shape_of_You_-_Ed_Sheeran_(DJJOhAL.Com).mp3	audio/mpeg	1403161	2017-05-27 14:10:19.650484
20	Abcd	<p>Test1</p>	1	1	2017-05-27 14:32:46.481645	2017-06-02 16:16:41.528031	a6bfa3e3edb49e9614f98ba881629cef1f4c1c4d3a1ebe5b627406e0e7ce	\N	\N	Tag1	2	t	TEST VIDEO.mp4	540049	video/mp4	Shape_of_You_-_Ed_Sheeran_(DJJOhAL.Com).mp3	audio/mpeg	1403161	2017-05-27 14:32:46.454845
22	My 4th Proj	<p>Nature earth</p>	1	1	2017-06-02 14:04:40.113648	2017-06-02 16:16:41.546637	0c906b69a967ba487dae55deba624b017641cda979b2eab980caa187de1a	\N	\N	My 4th proj	1	f	SampleVideo_1280x720_1mb.mp4	1055736	video/mp4	Shape_of_You_-_Ed_Sheeran_(DJJOhAL.Com).mp3	audio/mpeg	1403161	2017-06-02 14:04:40.077162
21	Project 3	<p>tEST</p>	2	1	2017-05-29 14:20:01.331176	2017-06-02 16:12:58.90522	2986e9c8c047b3243bcd208ae73c971d28b1c6333bb0eef535aac9de1605	\N	\N	tAGLINE1	2	f	TEST VIDEO.mp4	540049	video/mp4	Shape_of_You_-_Ed_Sheeran_(DJJOhAL.Com).mp3	audio/mpeg	1403161	2017-05-29 14:20:01.304973
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('projects_id_seq', 22, true);


--
-- Data for Name: redemption_codes; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY redemption_codes (id, code, created_at, updated_at, order_id) FROM stdin;
1	PsZGXpeUVY5kRMo0hw9VQg	2017-03-07 17:15:07.72302	2017-03-07 17:15:07.72302	1
2	eEJ-KRucggdEWejSv2vYug	2017-03-07 17:15:07.734268	2017-03-07 17:15:07.734268	1
3	e5ji5A3xI2cAWhKQnJ4EgA	2017-03-07 17:15:07.742543	2017-03-07 17:15:07.742543	1
4	Cihn93etxXh2GXirf4IHiA	2017-03-07 17:15:07.749963	2017-03-07 17:15:07.749963	1
5	PWvvthSEa2nPhnE_99djPw	2017-03-07 19:29:10.937199	2017-03-07 19:29:10.937199	3
6	0fiL6mlb5T4mQEdpUQSMEg	2017-03-07 21:19:25.292239	2017-03-07 21:19:25.292239	4
7	-lNpYpsf25cI9qBovbF6mA	2017-03-07 21:24:44.114048	2017-03-07 21:24:44.114048	5
8	aa2_jKHBL4_URiMye-0atA	2017-03-07 21:28:35.588395	2017-03-07 21:28:35.588395	6
9	KYQK2sTWTMCrOfw84dz2nA	2017-03-07 21:28:35.60018	2017-03-07 21:28:35.60018	6
10	H0hvZGlf3mUSIC92XA2NeA	2017-03-07 21:28:35.607027	2017-03-07 21:28:35.607027	6
11	-UH_-xiQxMYi7bDKR8vHxg	2017-03-07 21:28:35.620081	2017-03-07 21:28:35.620081	6
12	s7vp1dxBqbtlfDD00uaJpw	2017-03-07 21:28:35.627303	2017-03-07 21:28:35.627303	6
13	97usqpKTGBOcGwz9w8pQsw	2017-03-07 21:28:35.634171	2017-03-07 21:28:35.634171	6
14	viSIzI4gYT4RKkzoNiuKKg	2017-03-07 21:28:35.64113	2017-03-07 21:28:35.64113	6
15	sEn8HYLwmOsvLFQY2DxaoQ	2017-03-07 21:28:35.647735	2017-03-07 21:28:35.647735	6
16	Zr7pV1uVcR-ocKNaDfT39w	2017-03-07 21:28:35.65489	2017-03-07 21:28:35.65489	6
17	-n46x2GUqlzsapFY_I0ZgQ	2017-03-07 21:28:35.662035	2017-03-07 21:28:35.662035	6
18	TqWtpSLXVaIqfdiq2cdjoA	2017-03-07 21:28:35.670226	2017-03-07 21:28:35.670226	6
19	8dF_I-e4-ROm9sHn5s-umA	2017-03-07 21:28:35.679131	2017-03-07 21:28:35.679131	6
20	UE9hrl-vcYAp_r_72fExlA	2017-03-07 21:28:35.687078	2017-03-07 21:28:35.687078	6
21	JI0iOkYsCIHddajVMZOS0A	2017-03-07 21:28:35.694746	2017-03-07 21:28:35.694746	6
22	8qTJmA0E00WDksN6Re2pKw	2017-03-07 21:28:35.70223	2017-03-07 21:28:35.70223	6
23	Lg5uWEwy2EVkAY3l-Gon2g	2017-03-07 21:28:35.709181	2017-03-07 21:28:35.709181	6
24	Tb1JBhYtjCiza2hU9TsGCg	2017-03-07 21:28:35.718311	2017-03-07 21:28:35.718311	6
25	JPtFzC5_dwun5lmMqEsn-A	2017-03-07 21:28:35.725775	2017-03-07 21:28:35.725775	6
26	iFE4B2cw0FKk-WSWhodBOA	2017-03-07 21:28:35.733771	2017-03-07 21:28:35.733771	6
27	wtPfoeLbutxEU3EnnKQwZg	2017-03-07 21:28:35.74125	2017-03-07 21:28:35.74125	6
28	Q3tUF43roU2oKFEodM_iyA	2017-03-07 21:28:35.75065	2017-03-07 21:28:35.75065	6
29	xYh21sxgrRp_G3qBKjDYMw	2017-03-07 21:28:35.759912	2017-03-07 21:28:35.759912	6
30	Ob45LryflXLOVh-AKIyGUQ	2017-03-07 21:28:35.768633	2017-03-07 21:28:35.768633	6
31	PkqiUjxoKpp70e6zUJjF1g	2017-03-07 21:28:35.777159	2017-03-07 21:28:35.777159	6
32	gzY8besHpoJEzWckxZpjvw	2017-03-07 21:28:35.785481	2017-03-07 21:28:35.785481	6
33	3AJW2HQU6vXSJWVQZAE0qg	2017-03-07 21:28:35.794598	2017-03-07 21:28:35.794598	6
34	XKe5qcRlkZUD4J_slXeuhA	2017-03-07 21:28:35.802624	2017-03-07 21:28:35.802624	6
35	4Ryc1OpxgXr6PzCVzfXxvw	2017-03-07 21:28:35.811575	2017-03-07 21:28:35.811575	6
36	1OxGio0G1Z09RPkOuMUFGA	2017-03-07 21:28:35.819788	2017-03-07 21:28:35.819788	6
37	XkbUcMy_9U2wHbYA6tZeFQ	2017-03-07 21:28:35.827397	2017-03-07 21:28:35.827397	6
38	1GI_62zyKqAk0x1-1oYXhg	2017-03-07 21:28:35.836856	2017-03-07 21:28:35.836856	6
39	W9iviIGKFWXUDBGF5-X2Bw	2017-03-07 21:28:35.845967	2017-03-07 21:28:35.845967	6
40	3wFptWSfmR3icb6zEaPQag	2017-03-07 21:28:35.855288	2017-03-07 21:28:35.855288	6
41	eX4YaS99Gc0UnBC4wNxYqg	2017-03-07 21:28:35.86406	2017-03-07 21:28:35.86406	6
42	CwUyuAjPvmXt_oQu0urqrg	2017-03-07 21:28:35.871342	2017-03-07 21:28:35.871342	6
43	avCVq_lK_YkPonHBhNWRsQ	2017-03-07 21:28:35.8787	2017-03-07 21:28:35.8787	6
44	9rXQK4CiOySG73C-X6nH4A	2017-03-07 21:28:35.886215	2017-03-07 21:28:35.886215	6
45	6Yo2vTjZ0azLS0vW7j8S8g	2017-03-07 21:28:35.893644	2017-03-07 21:28:35.893644	6
46	OGziwuj1lcfZhItvxu14Tg	2017-03-07 21:28:35.901114	2017-03-07 21:28:35.901114	6
47	lVQCzXZ-B7knHlHnm4t4Lg	2017-03-07 21:28:35.908786	2017-03-07 21:28:35.908786	6
48	ZGdQIrVomMeYMC3V_aaoCw	2017-03-07 21:28:35.916213	2017-03-07 21:28:35.916213	6
49	bxq3lkiLa8wme8MakZ1Jfw	2017-03-07 21:28:35.92452	2017-03-07 21:28:35.92452	6
50	BSlYDWyRBjauImw_yZCqpA	2017-03-07 21:28:35.93204	2017-03-07 21:28:35.93204	6
51	Yd6EO3uC6fMZVqxSRqRdmA	2017-03-07 21:28:35.939155	2017-03-07 21:28:35.939155	6
52	hY0sg75wvNr9Tuoez7OGrw	2017-03-07 21:28:35.946459	2017-03-07 21:28:35.946459	6
53	cb8xrOilw-LDdu_9Xmg2sg	2017-03-07 21:28:35.954461	2017-03-07 21:28:35.954461	6
54	tNYnumXsXjQgHX3Up1fmtw	2017-03-07 21:28:35.961703	2017-03-07 21:28:35.961703	6
55	PMFgCo4KeSPw9xV6baO8Dg	2017-03-07 21:28:35.969102	2017-03-07 21:28:35.969102	6
56	Yt3xdeH3xvzWwOpGrQMc9g	2017-03-07 21:28:35.978733	2017-03-07 21:28:35.978733	6
57	H1fGbTYr5F5xVph6-IdTGQ	2017-03-07 21:28:35.987806	2017-03-07 21:28:35.987806	6
58	Tlt20Wq5zPJL1davNvXc2w	2017-03-07 21:28:35.995654	2017-03-07 21:28:35.995654	6
59	f5gZP1kNVI-xPDOlP1j6Xw	2017-03-07 21:28:36.003114	2017-03-07 21:28:36.003114	6
60	w4NZISGurXUYYDcxKota_A	2017-03-07 21:28:36.010452	2017-03-07 21:28:36.010452	6
61	jSy3aYAHEVV9qXk-hRl9ig	2017-03-07 21:28:36.017851	2017-03-07 21:28:36.017851	6
62	57GDLsvnZN8YcbeNsqUOHg	2017-03-07 21:28:36.025162	2017-03-07 21:28:36.025162	6
63	bV9kJ7Jhpoqqfbbnf4vz7A	2017-03-07 21:28:36.032983	2017-03-07 21:28:36.032983	6
64	aDCas-LNXj6ESZroJ1qB8w	2017-03-07 21:28:36.040344	2017-03-07 21:28:36.040344	6
65	5xB8eocxWq78AhI8XmQgoQ	2017-03-07 21:28:36.047563	2017-03-07 21:28:36.047563	6
66	FWjMHOIwqr5aV_8K4AHRfg	2017-03-07 21:28:36.054813	2017-03-07 21:28:36.054813	6
67	GQVqTw6U7n3VweZnFFbwHw	2017-03-07 21:28:36.062059	2017-03-07 21:28:36.062059	6
68	cb-mMbfe-oCgn98C_Bj5bA	2017-03-07 22:14:54.925738	2017-03-07 22:14:54.925738	2
69	g-Q3Wl4jbNpw-cmPUWtN4w	2017-03-08 02:17:37.087168	2017-03-08 02:17:37.087168	8
70	HC2jnzyeRNQmmS3E0abg8A	2017-03-08 02:20:11.248199	2017-03-08 02:20:11.248199	7
71	CcflVL9ODYGg8eIxMVD1AA	2017-03-08 03:28:43.603785	2017-03-08 03:28:43.603785	9
72	do9eFTcZt6ZSiarkC20Utw	2017-03-08 03:38:31.663569	2017-03-08 03:38:31.663569	10
73	jWdfLva95GsnZFDKNKRL_w	2017-03-08 03:38:31.673886	2017-03-08 03:38:31.673886	10
74	Fjivso8_fKeJzScYfhnJzQ	2017-03-08 03:38:31.68305	2017-03-08 03:38:31.68305	10
75	_9Xp_CgUR0VxFL7ZYyn_JQ	2017-03-08 17:56:49.234596	2017-03-08 17:56:49.234596	13
76	jMOMasUiP67z4TzdJ4W6CQ	2017-03-15 18:45:23.980162	2017-03-15 18:45:23.980162	19
77	_SoVYd3ewGCYbDHh4zdFWA	2017-03-15 18:45:23.995581	2017-03-15 18:45:23.995581	19
78	uSsGwWdG4Y0zG4EkyI-sWA	2017-03-15 18:45:24.009681	2017-03-15 18:45:24.009681	19
79	IXOpO_54a6k0oWKUvFulSw	2017-03-15 18:45:24.017387	2017-03-15 18:45:24.017387	19
80	lRTfQe9_NR2XoxEcLKzRrg	2017-03-15 18:45:24.035241	2017-03-15 18:45:24.035241	19
81	2j_F3VVMOdFmXUD-S3GTQQ	2017-03-15 18:45:24.043842	2017-03-15 18:45:24.043842	19
82	-rDnM-aemkSaD_aUzwsP9g	2017-03-15 18:45:24.070956	2017-03-15 18:45:24.070956	19
83	7Tm8SMhdo1_CL0C43PtdcQ	2017-03-15 18:45:24.328787	2017-03-15 18:45:24.328787	19
84	RquS5kbkp15G8dYR2ycmHw	2017-03-15 18:45:24.342065	2017-03-15 18:45:24.342065	19
85	oP6SkfyPyOKfACJKPYTQHA	2017-03-15 18:45:24.349833	2017-03-15 18:45:24.349833	19
86	uHCpZbxGRrms-Wk3pYdLyA	2017-03-15 18:45:24.356803	2017-03-15 18:45:24.356803	19
87	crbRsBnhJMg68J2bsMSK0A	2017-03-15 18:45:24.364151	2017-03-15 18:45:24.364151	19
88	u0Boq7MjR9FlwP1nqtkqIg	2017-03-15 18:45:24.370914	2017-03-15 18:45:24.370914	19
89	uEeAubMc6Inlnbk6twNV9Q	2017-03-15 18:45:24.377738	2017-03-15 18:45:24.377738	19
90	ft2FpPvRNfqtqwb6HdXSrQ	2017-03-15 18:45:24.386582	2017-03-15 18:45:24.386582	19
91	CStASRajeFYd_nwNgpLpXw	2017-03-15 18:45:24.393804	2017-03-15 18:45:24.393804	19
92	Q5bAtD3YhRpROXZzI9WL2Q	2017-03-15 18:45:24.40043	2017-03-15 18:45:24.40043	19
93	ndPcig4-KDTxs4vi_eEXaA	2017-03-15 18:45:24.407197	2017-03-15 18:45:24.407197	19
94	WmUpQyF7c-oJzI7hwkMgjg	2017-03-15 18:45:24.414685	2017-03-15 18:45:24.414685	19
95	cyGT8JHG6Y8gYayqwClsUw	2017-03-15 18:45:24.421485	2017-03-15 18:45:24.421485	19
96	q28Jp5Gi4ORV-8ZxEprv1w	2017-03-15 18:45:24.428471	2017-03-15 18:45:24.428471	19
97	XN46YwcyvSW-YIqa_OY_jA	2017-03-15 18:45:24.435534	2017-03-15 18:45:24.435534	19
98	spuCwx2hOpmLXSVdzjWJVw	2017-03-15 18:45:24.442187	2017-03-15 18:45:24.442187	19
99	Eha473WD8tMILww7FdlXvg	2017-03-15 18:45:24.449287	2017-03-15 18:45:24.449287	19
100	lUR_oTrvqJBd-gcvd7lNnw	2017-03-15 18:45:24.4563	2017-03-15 18:45:24.4563	19
101	2e9W8r_t0PU9lGA9_MSLUA	2017-03-15 18:45:24.463493	2017-03-15 18:45:24.463493	19
102	43bM6OxEihT_9vSpACattA	2017-03-15 18:45:24.472048	2017-03-15 18:45:24.472048	19
103	sWPnlRn3JaRI1UUFd64yvg	2017-03-15 18:45:24.478891	2017-03-15 18:45:24.478891	19
104	myXZ56PorcPsay8BrN4OGQ	2017-03-15 18:45:24.48567	2017-03-15 18:45:24.48567	19
105	UI9socXdhc7lLR2doxpriw	2017-03-16 21:16:25.884678	2017-03-16 21:16:25.884678	21
106	BghiyiP6cGlsPdBCbh5aJA	2017-03-16 21:16:25.894308	2017-03-16 21:16:25.894308	21
107	FK09svwLsDP3xgor-YIaFQ	2017-03-16 21:16:25.901615	2017-03-16 21:16:25.901615	21
108	OhbxCNc-IAdkJBMKxHGecQ	2017-03-16 21:16:25.91292	2017-03-16 21:16:25.91292	21
109	kLc0KLmUq6Pr_cVciu09sw	2017-03-16 21:16:25.926814	2017-03-16 21:16:25.926814	21
110	Qz0UIGENe6g9o75Ctz55hQ	2017-03-16 21:16:25.934182	2017-03-16 21:16:25.934182	21
111	D5D0G4YwHTHZYDU21M-SjA	2017-03-16 21:16:25.941322	2017-03-16 21:16:25.941322	21
112	Zf8gMpFvE8R7rNJLhGzb9A	2017-03-16 21:16:25.949435	2017-03-16 21:16:25.949435	21
113	wJQIksqspF7GzLvBSwwk_g	2017-03-16 21:16:25.956735	2017-03-16 21:16:25.956735	21
114	OYK1NWYXfeIyjzGuN2GtSA	2017-03-16 21:16:25.964422	2017-03-16 21:16:25.964422	21
115	eGuE-C5NvW_DULptcmonBA	2017-03-16 21:16:25.971221	2017-03-16 21:16:25.971221	21
116	r8QS0mqIXb1kfQAYZMt3TA	2017-03-16 21:16:25.977813	2017-03-16 21:16:25.977813	21
117	8dUG385W9gqHO4lsfBf2qg	2017-03-16 21:16:25.984736	2017-03-16 21:16:25.984736	21
118	40dD9V4tuDweXMkwqdYiAQ	2017-03-16 21:16:25.991895	2017-03-16 21:16:25.991895	21
119	dboxLS3nxzqPzzz8TQvIUQ	2017-03-16 21:16:25.999237	2017-03-16 21:16:25.999237	21
120	YtXorQoAV8b3Eild7EmFQw	2017-03-16 21:16:26.006159	2017-03-16 21:16:26.006159	21
121	cvoqOFx0nGVjZ0PM1S_ApQ	2017-03-16 21:16:26.014065	2017-03-16 21:16:26.014065	21
122	nwSmG3lw9v35ZplSoNROqQ	2017-03-16 21:16:26.021358	2017-03-16 21:16:26.021358	21
123	aeHNv_Qk2FrIuFOMB8xhpw	2017-03-16 21:16:26.028503	2017-03-16 21:16:26.028503	21
124	TaYbcI9_760yU6Gft22MBw	2017-03-16 21:16:26.035423	2017-03-16 21:16:26.035423	21
125	tfdpmiihIpfQ_Nm69Ld_XQ	2017-03-16 21:16:26.042319	2017-03-16 21:16:26.042319	21
126	D771uqtXvSdVTUhaE9xrkw	2017-03-16 21:16:26.056294	2017-03-16 21:16:26.056294	21
127	2AaO8_zd28k0zGQBCEfx-A	2017-03-16 21:16:26.063019	2017-03-16 21:16:26.063019	21
128	bIPqOkEfKRJeYYFdvRIGeA	2017-03-16 21:16:26.069814	2017-03-16 21:16:26.069814	21
129	GBzKdmyB7TZu0_j_pFD_BQ	2017-03-16 21:16:26.076861	2017-03-16 21:16:26.076861	21
130	Z5pKpM1n8afLQ6IjP8JStg	2017-03-16 21:16:26.083508	2017-03-16 21:16:26.083508	21
131	Ic1kN_lMmGOhMH5isnwN-w	2017-03-16 21:16:26.090315	2017-03-16 21:16:26.090315	21
132	8T9NDxAD6bfZ0X8M2R_y2A	2017-03-16 21:16:26.09714	2017-03-16 21:16:26.09714	21
133	5_7dG5KkwHKpAx7Obh7eRA	2017-03-16 21:16:26.104326	2017-03-16 21:16:26.104326	21
134	TRuzNOOX-gPBYsDbpSSSSw	2017-03-16 21:16:26.111123	2017-03-16 21:16:26.111123	21
135	M8ROfhImpODfoZT4MOs3ZQ	2017-03-16 21:16:26.117752	2017-03-16 21:16:26.117752	21
136	si7c2DdYFR5VdUchHXrQag	2017-03-16 21:16:26.12468	2017-03-16 21:16:26.12468	21
137	vJnHCyAJO2aV6AlrnFvI7g	2017-03-16 21:16:26.131512	2017-03-16 21:16:26.131512	21
138	ZKxfa_2hkOfUbG4_oF7ecA	2017-03-22 17:02:54.733887	2017-03-22 17:02:54.733887	22
139	fQHUvIEZDyZHppWpB-_B2A	2017-03-23 02:38:12.896652	2017-03-23 02:38:12.896652	23
140	udb3fLt6LW69wswwZBW5lA	2017-03-23 02:38:12.904964	2017-03-23 02:38:12.904964	23
141	0fOKyO8Ynhbgkkdj_WVmtg	2017-03-23 02:38:12.911966	2017-03-23 02:38:12.911966	23
142	FRhoh6QvF6AzmIC20qhQWw	2017-03-23 02:38:12.919444	2017-03-23 02:38:12.919444	23
143	DVyAUZk8ZZcgHmIjgTnS1A	2017-03-23 02:38:12.926679	2017-03-23 02:38:12.926679	23
144	oP6y9knitiiVkhEaqYEBJg	2017-03-23 02:38:12.934011	2017-03-23 02:38:12.934011	23
145	PLZULVd4jjoI2QX4xaBaxQ	2017-03-23 02:38:12.942614	2017-03-23 02:38:12.942614	23
146	JezZ8V-d3JzCvwLIWBeSEQ	2017-03-23 02:38:12.950077	2017-03-23 02:38:12.950077	23
147	7WXeTXCcXvitgm3NYjU0Yg	2017-03-23 02:38:12.962337	2017-03-23 02:38:12.962337	23
148	RpqP2GS3HBKzQf_VZl9h6Q	2017-03-23 02:38:12.969761	2017-03-23 02:38:12.969761	23
149	60IspcS9h7g00X39KRjPlg	2017-03-23 02:41:03.047633	2017-03-23 02:41:03.047633	24
150	erjgH08aEErhxpx6tdaCAA	2017-03-23 02:41:03.055794	2017-03-23 02:41:03.055794	24
151	tjoILNdjAx7mIkCep8RfoQ	2017-03-23 02:41:03.073165	2017-03-23 02:41:03.073165	24
152	E9tGvgjHSWq_OE56qLaiZQ	2017-03-23 02:41:03.08136	2017-03-23 02:41:03.08136	24
153	Md-76-4YGZdrLuWLyQxLrQ	2017-03-23 02:41:03.106367	2017-03-23 02:41:03.106367	24
154	Ok8zput88Tl89iF9gETbCw	2017-03-23 02:41:03.114632	2017-03-23 02:41:03.114632	24
155	Zjw_de2q3OOwQpoegL-3aQ	2017-03-23 02:41:03.123218	2017-03-23 02:41:03.123218	24
156	u476ICw_S_EABz6lUNdUGg	2017-03-23 02:41:03.134433	2017-03-23 02:41:03.134433	24
157	7a-Os6kq7wbuQWAx9a5E5Q	2017-03-23 02:41:03.143562	2017-03-23 02:41:03.143562	24
158	_M3esvUfl9G5iuSl4hPxBQ	2017-03-23 02:41:03.156083	2017-03-23 02:41:03.156083	24
159	6v47m54iBRTzno2h1rPQdQ	2017-03-23 16:31:18.526829	2017-03-23 16:31:18.526829	25
160	i197IJ4YplSB7x1dn2cOKw	2017-03-23 16:31:18.535288	2017-03-23 16:31:18.535288	25
161	qwTJGeio2yt3PKN6S7w2Ow	2017-03-23 16:31:18.542324	2017-03-23 16:31:18.542324	25
162	7PK-7HrSC8zXF27TE7V8BQ	2017-03-23 16:31:18.549368	2017-03-23 16:31:18.549368	25
163	fGw6ebDQI6BVmwq1m3nYkg	2017-03-23 16:31:18.556529	2017-03-23 16:31:18.556529	25
164	J_BC0qNwD_jQLsSkylvIsQ	2017-03-23 16:31:18.566657	2017-03-23 16:31:18.566657	25
165	-NMdGDQpYOtXLVv8WRVFRg	2017-03-23 16:31:18.575242	2017-03-23 16:31:18.575242	25
166	PW2axfst9oCCXswMGyH5ww	2017-03-23 16:31:18.58337	2017-03-23 16:31:18.58337	25
167	SdJgLk3xK-vRcjIB-gSq_A	2017-03-23 16:31:18.590771	2017-03-23 16:31:18.590771	25
168	hPdywTrqjMeqBZRd8ump5Q	2017-03-23 16:31:18.59769	2017-03-23 16:31:18.59769	25
169	7Doih6UMsdl-yXdWTjRJgw	2017-03-23 16:34:14.769772	2017-03-23 16:34:14.769772	26
170	Kwn4DuPP0-0twzRkWoInhA	2017-03-23 16:34:14.779021	2017-03-23 16:34:14.779021	26
171	u1ywBkbDUff4gUSCND7kaA	2017-03-23 16:34:14.785884	2017-03-23 16:34:14.785884	26
172	MlmhtJ_ouTEaqziWuKwCNg	2017-03-23 16:34:14.798835	2017-03-23 16:34:14.798835	26
173	88yfgv6UTs0cxf37hLDVuw	2017-03-23 16:34:14.806484	2017-03-23 16:34:14.806484	26
174	PZ30Afdis7NrT2Umexqrfg	2017-03-23 16:34:14.813673	2017-03-23 16:34:14.813673	26
175	qNewyiO3phbK3-FUboHeZw	2017-03-23 16:34:14.820961	2017-03-23 16:34:14.820961	26
176	Yc7Y6v8sE5Xs6W2wElZ24Q	2017-03-23 16:34:14.828341	2017-03-23 16:34:14.828341	26
177	oMswE3NBg32XSbxHDYPoLQ	2017-03-23 16:34:14.835125	2017-03-23 16:34:14.835125	26
178	zu-B_mS6FK8Rs-slb6MVnQ	2017-03-23 16:34:14.842143	2017-03-23 16:34:14.842143	26
179	_vZtTk46Un4JM9Z32OQyJQ	2017-03-23 16:34:14.849519	2017-03-23 16:34:14.849519	26
180	5g4yxVNEXtWJLscCFfA4Ug	2017-03-23 16:34:14.856628	2017-03-23 16:34:14.856628	26
181	30WU8ydjNaaxmObFBe-BfA	2017-03-23 16:56:02.83366	2017-03-23 16:56:02.83366	27
182	1Qgvgl9ss4gAFJqfdEv50A	2017-03-23 16:56:02.843053	2017-03-23 16:56:02.843053	27
183	VgegWYGqerXYzZ2X5YQ9xw	2017-03-23 16:56:02.861294	2017-03-23 16:56:02.861294	27
184	Xkgjzwahv-M0-wxQxDLNhg	2017-03-23 16:56:02.869328	2017-03-23 16:56:02.869328	27
185	jh5eQW3p3pbb3Nm4-Je9CQ	2017-03-23 16:56:02.87647	2017-03-23 16:56:02.87647	27
186	AzeKgem8aG7mrmtBql_u-g	2017-03-23 16:56:02.897304	2017-03-23 16:56:02.897304	27
187	tQI_dnl5m7t1YGlifPb4dw	2017-03-23 16:56:02.904857	2017-03-23 16:56:02.904857	27
188	rcvcyToAEf10Tojkhj96zw	2017-03-23 16:56:02.914446	2017-03-23 16:56:02.914446	27
189	eCF4sNMp6sqtfOMNqwZmpg	2017-03-23 16:56:02.939689	2017-03-23 16:56:02.939689	27
190	0u8_6yomnn0OT_SAn2C3tw	2017-03-23 16:56:02.947147	2017-03-23 16:56:02.947147	27
191	FHRxtzZJ-O_e2lvzwergAw	2017-03-23 16:56:02.954692	2017-03-23 16:56:02.954692	27
192	-CTmVVm-tvGhurNnz-6XZw	2017-03-23 16:56:02.961755	2017-03-23 16:56:02.961755	27
193	nCea32XM7rCwYfvaQAcSqw	2017-03-23 16:56:02.968823	2017-03-23 16:56:02.968823	27
194	iZzqDRLHWfvD7HQkj1Wzgw	2017-03-23 16:56:02.976214	2017-03-23 16:56:02.976214	27
195	klZhrgCpxUWQEZmGyBFvJw	2017-03-23 16:56:02.984483	2017-03-23 16:56:02.984483	27
196	XMhEZL-tM3PFa_GP3xorBg	2017-03-24 15:23:06.936992	2017-03-24 15:23:06.936992	28
197	KfcmDRlEQdBHeGGehG14ZA	2017-03-24 15:23:06.950655	2017-03-24 15:23:06.950655	28
198	9WDgfAf37Oy8im-352V3rg	2017-03-24 15:23:06.957796	2017-03-24 15:23:06.957796	28
199	f-1EN4P6nfXX5dBMJitIkw	2017-03-24 15:23:06.965159	2017-03-24 15:23:06.965159	28
200	tM8_-rXesMlNs9TwT9eDRA	2017-03-24 15:23:06.972466	2017-03-24 15:23:06.972466	28
201	Y0q4OHA4YodnXKdIlZZ0ZA	2017-03-24 15:23:06.979504	2017-03-24 15:23:06.979504	28
202	p1Orwf53wEDov6fmb43I1g	2017-03-24 15:23:06.987006	2017-03-24 15:23:06.987006	28
203	9AZNX0GDwwA69TRGgKFSrw	2017-03-24 15:23:06.993712	2017-03-24 15:23:06.993712	28
204	6v6HQqjF-gFRbS4ZDtCpKw	2017-03-24 15:23:07.00051	2017-03-24 15:23:07.00051	28
205	uSEBRUsKQN-bX3jKuyD2DQ	2017-03-24 15:23:07.007529	2017-03-24 15:23:07.007529	28
206	qrtBcSjo17x8E8t6-XcsTw	2017-03-24 15:23:07.014593	2017-03-24 15:23:07.014593	28
207	Go8vf9PdkTrdw12FQLXtnQ	2017-03-24 15:23:07.0228	2017-03-24 15:23:07.0228	28
208	9MJX3Xv1aVIpqupLrBSWdA	2017-03-24 15:23:07.031954	2017-03-24 15:23:07.031954	28
209	suKAArnduAlWUEruLm627g	2017-03-24 15:23:07.041924	2017-03-24 15:23:07.041924	28
210	TcW7dPBAD1WM2-0LHKCl_A	2017-03-24 15:23:07.058311	2017-03-24 15:23:07.058311	28
211	ZtnoRWg0DphM31tvJrPzXg	2017-03-24 15:23:07.074029	2017-03-24 15:23:07.074029	28
212	XKha4VZNo7TjwpsV-f8ZLg	2017-03-24 15:23:07.082251	2017-03-24 15:23:07.082251	28
213	ngJg6g1AIOMRqgEov-fqhA	2017-03-24 15:23:07.089953	2017-03-24 15:23:07.089953	28
214	WoWKj9juMveQ_npMhHsSLw	2017-03-24 15:23:07.097613	2017-03-24 15:23:07.097613	28
215	VsnyxRnTXm2P2SP7XJ1AXQ	2017-03-24 15:23:07.105314	2017-03-24 15:23:07.105314	28
216	7y4_hJg3V9iacw2oE-m0OA	2017-03-24 15:23:07.112819	2017-03-24 15:23:07.112819	28
217	bTnvMBrZ4gckQjZ9kfPunw	2017-03-24 15:23:07.125967	2017-03-24 15:23:07.125967	28
218	LcF0lNLtxvY_0MbvAyrWvg	2017-03-24 15:23:07.13539	2017-03-24 15:23:07.13539	28
219	YmxtGvYTsN_32gDZrUdnuQ	2017-03-24 15:23:07.143057	2017-03-24 15:23:07.143057	28
220	9s8aeHbS_cuBp2IvGzILjg	2017-03-24 15:23:07.150967	2017-03-24 15:23:07.150967	28
221	-ctm61iExd9op_NXb4uFLA	2017-03-24 15:23:07.158421	2017-03-24 15:23:07.158421	28
222	AJHP3tRfOfiQBy6DAL7XJQ	2017-03-24 15:23:07.166088	2017-03-24 15:23:07.166088	28
223	xCh_AlzZgWRF2fPntrmMBA	2017-03-24 15:23:07.172978	2017-03-24 15:23:07.172978	28
224	E8Sp7nRocZfuf4yEm6eOHQ	2017-03-24 15:23:07.181023	2017-03-24 15:23:07.181023	28
225	72iJ2FTDu8vq2751kupkjg	2017-03-24 15:23:07.188261	2017-03-24 15:23:07.188261	28
226	PuSmlYRpEviT5GBHn8QJ2g	2017-03-24 15:23:07.195358	2017-03-24 15:23:07.195358	28
227	KFs5eGXpZgNWKgzHEhKPww	2017-03-24 15:23:07.202924	2017-03-24 15:23:07.202924	28
228	HIqnpQEdWzKUjnGq5jOvaQ	2017-03-24 15:23:07.210372	2017-03-24 15:23:07.210372	28
229	3ool3Le-7QQia_RXGq36Zg	2017-03-24 15:23:07.21848	2017-03-24 15:23:07.21848	28
230	zMZEI_627h_6bz2z-DHxQQ	2017-03-24 15:23:07.226963	2017-03-24 15:23:07.226963	28
231	Za2-_YnmObCSLRBtOcC5Jg	2017-03-24 15:23:07.235372	2017-03-24 15:23:07.235372	28
232	R5mfMt7tknICAlwhXmGn4A	2017-03-24 15:23:07.243338	2017-03-24 15:23:07.243338	28
233	w8gRE8ZSrOFbNPfsI8iiKA	2017-03-24 15:23:07.251037	2017-03-24 15:23:07.251037	28
234	W25gA_4kjXHTLMU8KDCUHw	2017-03-24 15:23:07.25895	2017-03-24 15:23:07.25895	28
235	GMoIj_1TD2v4UAzBC6pwdA	2017-03-24 15:23:07.266566	2017-03-24 15:23:07.266566	28
236	B4AwprkhNzKdJrel8q3DWQ	2017-03-24 15:23:07.274623	2017-03-24 15:23:07.274623	28
237	q4qRp_g_QSENhD_SzAOBPQ	2017-03-24 15:23:07.282093	2017-03-24 15:23:07.282093	28
238	OAQBVXNKCJJSmeZDWcTc-g	2017-03-24 15:23:07.289737	2017-03-24 15:23:07.289737	28
239	4aQhbabmKYtnIEklbWKDhA	2017-03-24 15:23:07.297219	2017-03-24 15:23:07.297219	28
240	Glodgm7BsfbYebeA1Z6qVg	2017-03-24 15:23:07.304528	2017-03-24 15:23:07.304528	28
241	C99hNIlWVtI_fiUpMGkgbA	2017-03-24 15:23:07.312281	2017-03-24 15:23:07.312281	28
242	EPoGenedJdZMR94XU6ddgw	2017-03-24 15:23:07.319564	2017-03-24 15:23:07.319564	28
243	sWha_Yd1UKXYfBsJfcN4ZQ	2017-03-24 15:23:07.328208	2017-03-24 15:23:07.328208	28
244	B32vDtwqLvrfZzXwH5RI8g	2017-03-24 15:23:07.335408	2017-03-24 15:23:07.335408	28
245	bpt_q5Z8v-Pe47XJotlIdg	2017-03-24 15:23:07.349529	2017-03-24 15:23:07.349529	28
246	MF6XAlwPNGF6JXI2grNdBA	2017-03-24 15:23:07.358925	2017-03-24 15:23:07.358925	28
247	4_Gm8-2pIno429n5Fr_dJQ	2017-03-24 15:23:07.366623	2017-03-24 15:23:07.366623	28
248	GpAy8b_K-3AR_l0OttpOCw	2017-03-24 15:23:07.374201	2017-03-24 15:23:07.374201	28
249	P6-CDtZJQ7SeHkjnpBb3YA	2017-03-24 15:23:07.381415	2017-03-24 15:23:07.381415	28
250	cLXmvPrjlELggoHbayfyWw	2017-03-24 15:23:07.4002	2017-03-24 15:23:07.4002	28
251	XGgyqe7nQRQX5EO1iVM7wA	2017-03-24 15:23:07.409904	2017-03-24 15:23:07.409904	28
252	JygDlq785YysR1c5hyGdsg	2017-03-24 15:23:07.417671	2017-03-24 15:23:07.417671	28
253	YD0r1WiA2Z9GZTvuUjvPTg	2017-03-24 15:23:07.425273	2017-03-24 15:23:07.425273	28
254	vE-zwn8aelz-7p-QOEc-bA	2017-03-24 15:23:07.432506	2017-03-24 15:23:07.432506	28
255	M55FDpShabCBi7JZy_FRvg	2017-03-24 15:23:07.439821	2017-03-24 15:23:07.439821	28
256	MBW5vQ3UmO8CRX7Z-K4CQA	2017-03-24 15:23:07.447198	2017-03-24 15:23:07.447198	28
257	I3OTqd-qF8ydszLUehxTlQ	2017-03-24 15:23:07.454299	2017-03-24 15:23:07.454299	28
258	ODR36bJOHYOIt91wn5DZAw	2017-03-24 15:23:07.461524	2017-03-24 15:23:07.461524	28
259	gEcTxQ22ZyMlOu325njXew	2017-03-24 15:23:07.469173	2017-03-24 15:23:07.469173	28
260	II-0UEC-s_liqsk9xQSqCA	2017-03-24 15:23:07.476916	2017-03-24 15:23:07.476916	28
261	tLbu7db1CxmeOAUVohOONg	2017-03-28 10:44:34.794768	2017-03-28 10:44:34.794768	31
262	bEz14n5aBgi6IPth_sKsIw	2017-03-28 10:44:34.80524	2017-03-28 10:44:34.80524	31
263	OznMSAnlce6aHVmW0Wgwrw	2017-03-28 10:44:34.814628	2017-03-28 10:44:34.814628	31
264	O9uecKVgJS-NZ-Q-iqbDEg	2017-03-28 10:44:34.83058	2017-03-28 10:44:34.83058	31
265	bPmpKIFgO6Y7RKsazEUh3A	2017-03-28 10:44:34.837835	2017-03-28 10:44:34.837835	31
266	hoAjtWHU07NUWfes7mF_Fw	2017-03-28 10:44:34.85133	2017-03-28 10:44:34.85133	31
267	tsAYLpuoEz8tgMP1wKXoTA	2017-03-28 10:44:34.859051	2017-03-28 10:44:34.859051	31
268	FfaHVCne3biftjapaNhhQw	2017-03-28 10:44:34.866343	2017-03-28 10:44:34.866343	31
269	OElfRutrMiYgEejvMVXREw	2017-03-28 10:44:34.875299	2017-03-28 10:44:34.875299	31
270	rBs-oJ90hQ4w3xSCDleC5g	2017-03-28 10:44:34.884551	2017-03-28 10:44:34.884551	31
271	a8GC5o1I1huyYZMkR0_RWA	2017-03-28 19:28:25.473093	2017-03-28 19:28:25.473093	32
272	gIVDJUXYldzA-dhAuwePYQ	2017-03-28 19:28:25.482399	2017-03-28 19:28:25.482399	32
273	v2gUoO2XgpTtpt15TDgcEA	2017-03-29 16:37:13.99424	2017-03-29 16:37:13.99424	33
274	8S23HhuUfbDk9itxs4joRw	2017-03-29 16:37:14.00248	2017-03-29 16:37:14.00248	33
275	qpyDfqBBZYTqQuTl7raXaQ	2017-03-29 16:37:14.015642	2017-03-29 16:37:14.015642	33
276	ltDfUJYTEdDnWI9rbzGVcw	2017-03-29 16:37:14.023796	2017-03-29 16:37:14.023796	33
277	bpOe_9GViE4vLGiTbT4M7Q	2017-03-29 16:37:14.032142	2017-03-29 16:37:14.032142	33
278	xvRMXPaANprKCM_3cTrQqw	2017-03-29 16:37:14.039435	2017-03-29 16:37:14.039435	33
279	wVHhd8tL-ZB40NgR_l4_7A	2017-03-29 16:37:14.046632	2017-03-29 16:37:14.046632	33
280	9qw9slYiBYAUXUe7UWHa6A	2017-03-29 16:37:14.053683	2017-03-29 16:37:14.053683	33
281	0y62FaMW_PAZFyyM-5m6Uw	2017-03-29 16:37:14.06079	2017-03-29 16:37:14.06079	33
282	nllJ9166_hvr5grMWJqqzA	2017-03-29 16:37:14.06802	2017-03-29 16:37:14.06802	33
283	ym2oEVnthBZ4Y9KQMhytng	2017-03-29 16:37:14.075215	2017-03-29 16:37:14.075215	33
284	xIR4fwBMteDiLLkkIlszNg	2017-03-29 16:37:14.082683	2017-03-29 16:37:14.082683	33
285	1cUBaH9k8-As9RifSut-sA	2017-03-29 16:37:14.0908	2017-03-29 16:37:14.0908	33
286	jl0cWGGq1RtQVaaPRrfh9A	2017-03-29 16:37:14.099445	2017-03-29 16:37:14.099445	33
287	ioZTw31b80BpnvfnIG17hA	2017-03-29 16:37:14.107413	2017-03-29 16:37:14.107413	33
288	XfXpg78gOjuBLt6UG95KAQ	2017-03-29 16:37:14.114609	2017-03-29 16:37:14.114609	33
289	_o2cZzUzmvgsL_-t9viD4A	2017-03-29 16:37:14.122425	2017-03-29 16:37:14.122425	33
290	dbYnhSuHmxV5pIUZdw64ww	2017-03-29 16:37:14.129704	2017-03-29 16:37:14.129704	33
291	zPs4qp2revXX3wKWsQtdkQ	2017-03-29 16:37:14.137532	2017-03-29 16:37:14.137532	33
292	NTsqmhqSiJ8AzuU3aSstMg	2017-03-29 16:37:14.145025	2017-03-29 16:37:14.145025	33
293	5lfKjdbIVpNvPl7psatUKA	2017-03-29 16:37:14.152217	2017-03-29 16:37:14.152217	33
294	pSn2GQGRbtU40rJmtWCeqQ	2017-03-29 16:37:14.162426	2017-03-29 16:37:14.162426	33
295	9z9ZBsuVjAnkmtUxbqnLgw	2017-03-29 16:37:14.171461	2017-03-29 16:37:14.171461	33
296	WS-N4vsJRa8tU_UWtFw4iA	2017-03-29 16:37:14.179943	2017-03-29 16:37:14.179943	33
297	FsEu4QSttTdGeT0LFzpT2Q	2017-03-29 16:37:14.187324	2017-03-29 16:37:14.187324	33
298	md6-lS4zmLlyAzIIXGNe_g	2017-03-29 16:37:14.19539	2017-03-29 16:37:14.19539	33
299	IFCJ1viMS-oFIUC4UcwTpA	2017-03-29 16:37:14.202631	2017-03-29 16:37:14.202631	33
300	xdzlq5zLyt4CClDC1sdNbw	2017-03-29 16:37:14.210731	2017-03-29 16:37:14.210731	33
301	EZjyk38DechSAZR_6gkqPQ	2017-03-29 16:37:14.218118	2017-03-29 16:37:14.218118	33
302	lsI56BwO-KXrhHWWo-Jhxg	2017-03-29 16:37:14.22561	2017-03-29 16:37:14.22561	33
323	Qk6xKD1A3v0_DL10lT6vnA	2017-04-04 14:37:28.219966	2017-04-04 14:37:28.219966	36
324	w75Jg2lXmwzUnETFg6BCag	2017-04-04 14:37:28.234918	2017-04-04 14:37:28.234918	36
325	xIToWh2pUwPDw6PdAm7n2w	2017-04-04 14:37:28.243027	2017-04-04 14:37:28.243027	36
326	ZzdqsA73kZgR8jfFqID7gw	2017-04-04 14:37:28.250109	2017-04-04 14:37:28.250109	36
327	Cy918m25hCzt6G3fiCeXiA	2017-04-04 14:37:28.257594	2017-04-04 14:37:28.257594	36
328	VfaCFFcDZIUWZgY79fSu7w	2017-04-04 14:37:28.265106	2017-04-04 14:37:28.265106	36
329	oJJR6h_VrdxYazdaH383ZQ	2017-04-04 14:37:28.271955	2017-04-04 14:37:28.271955	36
330	quFTJL_8ikViknTiDFU6cw	2017-04-04 14:37:28.280409	2017-04-04 14:37:28.280409	36
331	mIO6Mmh6I75sl6NnOsV1jA	2017-04-04 14:37:28.288226	2017-04-04 14:37:28.288226	36
332	V2D0PewjxL7oX5iO6I779w	2017-04-04 14:37:28.295784	2017-04-04 14:37:28.295784	36
333	m2vlKu6meJua6NU5DcuxlQ	2017-04-04 14:37:28.303012	2017-04-04 14:37:28.303012	36
334	lETlmjv7PHsCpT0L4QuBFg	2017-04-04 14:37:28.310488	2017-04-04 14:37:28.310488	36
335	3MrSYsPIar7G1R8J5H_pXA	2017-04-04 14:37:28.317514	2017-04-04 14:37:28.317514	36
336	uHHmhEt5ICHXEzMADdgSFg	2017-04-04 14:37:28.325556	2017-04-04 14:37:28.325556	36
337	oAX8E1DhOuMptdMQjvXvhQ	2017-04-04 14:37:28.332733	2017-04-04 14:37:28.332733	36
338	gdoAgrF2trvwIpd_q7zVJQ	2017-04-04 14:37:28.339771	2017-04-04 14:37:28.339771	36
339	Ch6NYJFQH2JhFZTbYgnI6A	2017-04-04 14:37:28.348553	2017-04-04 14:37:28.348553	36
340	I08Sv9re8_z6e0qu_E6X9g	2017-04-04 14:37:28.356333	2017-04-04 14:37:28.356333	36
341	r8A1oi7RSMMTrFOpyCkrlw	2017-04-04 14:37:28.363362	2017-04-04 14:37:28.363362	36
342	ePP9j3qY6Vo6SxgQo1y-Tw	2017-04-04 14:37:28.370541	2017-04-04 14:37:28.370541	36
343	JzzVJrQVavBDUaZx-zhbPw	2017-04-04 14:37:28.377482	2017-04-04 14:37:28.377482	36
344	hQih0KPyZTqgRTavtnzalQ	2017-04-04 14:37:28.386756	2017-04-04 14:37:28.386756	36
345	VF-DIvl6ULr4oWVvfWo68w	2017-04-04 14:37:28.394127	2017-04-04 14:37:28.394127	36
346	bPQZXWx4tY0_EHqU9RVScg	2017-04-04 14:37:28.4014	2017-04-04 14:37:28.4014	36
347	NiJ1SdQ6o8ZS7MrmkDkxUg	2017-04-04 14:37:28.409795	2017-04-04 14:37:28.409795	36
348	F_cr99YLtiFUOmoNfX0haw	2017-04-04 14:37:28.416866	2017-04-04 14:37:28.416866	36
349	wbPfWiX8iCd7ipwuv5uDQw	2017-04-04 14:37:28.423974	2017-04-04 14:37:28.423974	36
350	yMtHzp1nFfOHJyoUgOisqg	2017-04-04 14:37:28.431201	2017-04-04 14:37:28.431201	36
351	vunp_XMU7Ahu_1wzEA3CXA	2017-04-04 14:37:28.445178	2017-04-04 14:37:28.445178	36
352	pWX4ThTShIz0Qh07S3EeOA	2017-04-04 14:37:28.452121	2017-04-04 14:37:28.452121	36
353	LsSHMovTErIg8GHbxZ0vJg	2017-04-04 14:37:28.459447	2017-04-04 14:37:28.459447	36
354	ExQOwUHs8dWAV6bRdpi5HA	2017-04-04 14:37:28.46665	2017-04-04 14:37:28.46665	36
355	ECdu8cPI6AJ-UtIH1GvMOg	2017-04-04 14:37:28.47381	2017-04-04 14:37:28.47381	36
356	hf81I-nJAyk0ZPiKud22mg	2017-04-04 14:37:28.481172	2017-04-04 14:37:28.481172	36
357	fRh1fTdZ9p7xYwuw2DQRpw	2017-04-04 14:37:28.491684	2017-04-04 14:37:28.491684	36
358	4fiJCpXE3r3s0ltvp8ploQ	2017-04-04 14:37:28.499052	2017-04-04 14:37:28.499052	36
359	6DgEf-02BHHEfj7TeW7OkA	2017-04-04 14:37:28.50821	2017-04-04 14:37:28.50821	36
360	d734PdzChKXSbxgUoaAtCA	2017-04-04 14:37:28.516626	2017-04-04 14:37:28.516626	36
361	WbPlDmQVUrfQHq3lPr5HgA	2017-04-04 14:37:28.523884	2017-04-04 14:37:28.523884	36
362	Z0RZPiyCKrAdoHXpWHLMLg	2017-04-04 14:37:28.531076	2017-04-04 14:37:28.531076	36
363	qU1NLKBdkkv87nSEBy6EFA	2017-04-04 14:37:28.538316	2017-04-04 14:37:28.538316	36
303	FibBJC3oSIYLYqq-ERzzhg	2017-04-03 16:06:52.747632	2017-04-03 16:06:52.747632	35
304	MZt2r4VLabALgZ-25DMMZQ	2017-04-03 16:06:52.756922	2017-04-03 16:06:52.756922	35
305	V2ywDoDsnA5VgC5U4R0WeQ	2017-04-03 16:06:52.777897	2017-04-03 16:06:52.777897	35
306	c2POPnk1h2PR9gcfj9snYg	2017-04-03 16:06:52.785085	2017-04-03 16:06:52.785085	35
307	1qc_5BcUXRRn1mEhp-iDoQ	2017-04-03 16:06:52.79219	2017-04-03 16:06:52.79219	35
308	6OxhpVN2ZiLdgPd_yFRpeQ	2017-04-03 16:06:52.798999	2017-04-03 16:06:52.798999	35
309	vdrES6KjWDka6mfndPNMtQ	2017-04-03 16:06:52.805668	2017-04-03 16:06:52.805668	35
310	F-NQpI2-sI9CEKD1UZyGEw	2017-04-03 16:06:52.812369	2017-04-03 16:06:52.812369	35
311	y2fIaTmOhZHg8q1uBMkSpA	2017-04-03 16:06:52.818992	2017-04-03 16:06:52.818992	35
312	Z0TxEDS03lH4wG1bb0l3_Q	2017-04-03 16:06:52.825515	2017-04-03 16:06:52.825515	35
313	lsSe7pnSM-MIZWARqjh3FA	2017-04-03 16:06:52.832251	2017-04-03 16:06:52.832251	35
314	uoU83E9UeIUiCLvFvLWPGA	2017-04-03 16:06:52.838991	2017-04-03 16:06:52.838991	35
315	0yqH1q2rd1f593UxAZ_ufA	2017-04-03 16:06:52.845669	2017-04-03 16:06:52.845669	35
316	mtl2x8QkOfAYgErJal2Ixw	2017-04-03 16:06:52.852213	2017-04-03 16:06:52.852213	35
317	MS7PweBL4HlonLEXefvL5A	2017-04-03 16:06:52.859079	2017-04-03 16:06:52.859079	35
318	ZF2dNwfqwyqfjf0vxUk4cA	2017-04-03 16:06:52.865863	2017-04-03 16:06:52.865863	35
319	4CbISJ5dh_rcX2syIK5xZA	2017-04-03 16:06:52.872801	2017-04-03 16:06:52.872801	35
320	e8R1cnT9K3740JGUnWUudA	2017-04-03 16:06:52.879388	2017-04-03 16:06:52.879388	35
321	EMed5P6htrtHH6wYvGgj-A	2017-04-03 16:06:52.88621	2017-04-03 16:06:52.88621	35
322	IPcsYLgR9TPe3REfHoDktw	2017-04-03 16:06:52.897502	2017-04-03 16:06:52.897502	35
364	_hRslazjYkK95OT2LzS0Jw	2017-04-07 04:50:01.839993	2017-04-07 04:50:01.839993	42
365	POrHDCHYcxCrJzxDQC4Ihw	2017-04-07 04:50:01.851883	2017-04-07 04:50:01.851883	42
366	_y-XGkiRjpTEQQlOwIo2Lw	2017-04-07 04:50:01.859214	2017-04-07 04:50:01.859214	42
367	_2gCV_YcjA5nz91yqvTNkA	2017-04-07 04:50:01.866902	2017-04-07 04:50:01.866902	42
368	jKrB26xXWDM44xqE0H8k1A	2017-04-07 04:50:01.874132	2017-04-07 04:50:01.874132	42
369	YYjIizZ53p-CiaGPsAcK0Q	2017-04-07 04:50:01.88254	2017-04-07 04:50:01.88254	42
370	VdWsXEDBcQGyRRLzWduVVw	2017-04-07 04:50:01.892066	2017-04-07 04:50:01.892066	42
371	T5PpT30mJBLzTWN9iZIQGw	2017-04-07 04:50:01.90128	2017-04-07 04:50:01.90128	42
372	bupZ8Yixd7wzuXXypTs6tA	2017-04-07 04:50:01.909725	2017-04-07 04:50:01.909725	42
373	FVrOH09anG8SEKuRluRxiA	2017-04-07 04:50:01.917797	2017-04-07 04:50:01.917797	42
374	9BgrX12qwfsneTiXNEzDZw	2017-04-07 04:50:01.925137	2017-04-07 04:50:01.925137	42
375	1J8I6ItgnpKKRQki_5tSdw	2017-04-07 04:50:01.937229	2017-04-07 04:50:01.937229	42
376	Ea3gbMtQUqtORGs9gqZdIw	2017-04-07 04:50:01.946493	2017-04-07 04:50:01.946493	42
377	k9lGaaYYDCmFB4x0p-iDLQ	2017-04-07 04:50:01.954554	2017-04-07 04:50:01.954554	42
378	ik45p5ULKi7SxJbJFQQERg	2017-04-07 04:50:01.967197	2017-04-07 04:50:01.967197	42
379	QM1zW-oQYMyBvgK0CbZa-A	2017-04-07 04:50:01.976067	2017-04-07 04:50:01.976067	42
380	xJKhSq4zUlDPobT097sF9g	2017-04-07 04:50:01.985364	2017-04-07 04:50:01.985364	42
381	Vm8aAkum4eGiJIcWendVDw	2017-04-07 04:50:01.994505	2017-04-07 04:50:01.994505	42
382	82lJmApwNUWtmybLSjQIkw	2017-04-07 04:50:02.001955	2017-04-07 04:50:02.001955	42
383	c4iKAspYyXwDLSEeLu__4g	2017-04-07 04:50:02.009897	2017-04-07 04:50:02.009897	42
384	g8SF1WdIaqvsMQzleJVJPA	2017-04-07 04:53:34.55673	2017-04-07 04:53:34.55673	43
385	XA0l_LSBCejxeqbtsK3Qhg	2017-04-07 04:53:34.566348	2017-04-07 04:53:34.566348	43
386	0LIEVxLATFEzhDe9qAPLOA	2017-04-07 04:53:34.592926	2017-04-07 04:53:34.592926	43
387	bS1aL9CtRoiFTTp_F04lCQ	2017-04-07 04:53:34.600259	2017-04-07 04:53:34.600259	43
388	hyIa3D2WyL1uG1FA_VJ8kQ	2017-04-07 04:53:34.607998	2017-04-07 04:53:34.607998	43
389	sTPDSCsjhheNnK1Kv9tO_w	2017-04-07 04:53:34.615332	2017-04-07 04:53:34.615332	43
390	bFTEyaGkiqFf1Y6JuCRLgg	2017-04-07 04:53:34.622368	2017-04-07 04:53:34.622368	43
391	l4QvZ1eoKhO5cp09CiGCLQ	2017-04-07 04:53:34.62945	2017-04-07 04:53:34.62945	43
392	RBgNVicN2CDHvNHZlU-9pQ	2017-04-07 04:53:34.636434	2017-04-07 04:53:34.636434	43
393	7ybX3ohXiksbBxw8C35VQw	2017-04-07 04:53:34.643667	2017-04-07 04:53:34.643667	43
394	exJORnlRM37FYAxJCpJCoQ	2017-04-07 04:53:34.650695	2017-04-07 04:53:34.650695	43
395	8uzxo2yifKMk6ZHZ3CDnlg	2017-04-07 04:53:34.659306	2017-04-07 04:53:34.659306	43
396	ANJJ1fRHk_dNxTYnsfquDg	2017-04-07 04:53:34.667174	2017-04-07 04:53:34.667174	43
397	R4GLNaXlApJlxsigdZHNdw	2017-04-07 04:53:34.674216	2017-04-07 04:53:34.674216	43
398	W1ABnpzv7Gpo_U_pZKJfeA	2017-04-07 04:53:34.681403	2017-04-07 04:53:34.681403	43
399	lHupLKZ9kfjFiIe57fCj6w	2017-04-07 04:53:34.688243	2017-04-07 04:53:34.688243	43
400	7ssAx83oC5yE6egyO6oz1w	2017-04-07 04:53:34.695242	2017-04-07 04:53:34.695242	43
401	FE8o_GRqOlxgc3hnAHQ2Nw	2017-04-07 04:53:34.701784	2017-04-07 04:53:34.701784	43
402	R_3cgxn0vO1PeXQXdSTdJQ	2017-04-07 04:53:34.70843	2017-04-07 04:53:34.70843	43
403	US1reGhEeiGlriw-bJpCZQ	2017-04-07 04:53:34.716612	2017-04-07 04:53:34.716612	43
404	WtN1KrmbhhtyQNKF10DmvQ	2017-04-07 04:53:34.723509	2017-04-07 04:53:34.723509	43
405	V2CaFxhSPSpWk7wQhb5CMw	2017-04-07 04:53:34.730238	2017-04-07 04:53:34.730238	43
406	ATsnFkAq49unY_vXUddnFA	2017-04-07 04:53:34.736971	2017-04-07 04:53:34.736971	43
407	YKD2sbCGXmtF1YLgiApOwg	2017-04-07 04:53:34.794927	2017-04-07 04:53:34.794927	43
408	0Yu-HGIS04psMdMxcyf6FQ	2017-04-07 04:53:34.803466	2017-04-07 04:53:34.803466	43
409	bbeq5hokOdOJwsaCijqk4A	2017-04-07 04:53:34.811397	2017-04-07 04:53:34.811397	43
410	qzBcyCIOLrl3WPXQB-TvyQ	2017-04-07 04:53:34.820079	2017-04-07 04:53:34.820079	43
411	Wig1Vf7etAQBXExLwWzOmw	2017-04-07 04:53:34.827055	2017-04-07 04:53:34.827055	43
412	rtMl_dsjKk7dB_kAsyj36g	2017-04-07 04:53:34.834248	2017-04-07 04:53:34.834248	43
413	ZFB1qKLnLSeCmg7lDnO-fQ	2017-04-07 04:53:34.841495	2017-04-07 04:53:34.841495	43
414	kDTLZGgFpBcwVdORLdcSKg	2017-04-07 04:53:34.849358	2017-04-07 04:53:34.849358	43
415	BQA5o1Mggc0tqu6LM-CX8w	2017-04-07 04:53:34.857657	2017-04-07 04:53:34.857657	43
416	w1GuDNJnnYjicKHG5Zrxnw	2017-04-07 15:17:26.368978	2017-04-07 15:17:26.368978	44
417	__dwSljgcmxEs39YeakxHQ	2017-04-07 15:17:26.378641	2017-04-07 15:17:26.378641	44
418	2BKJv_y_z2bHa1KtrsoSLw	2017-04-07 15:17:26.391178	2017-04-07 15:17:26.391178	44
419	Klh9-_jg4WnzgSj5BzuO0g	2017-04-07 15:17:26.398361	2017-04-07 15:17:26.398361	44
420	ebrXTGUSetNxZsxPl7Ybng	2017-04-07 15:17:26.406979	2017-04-07 15:17:26.406979	44
421	QBu0qEj5eeRIijzz49HA1A	2017-04-07 15:17:26.414158	2017-04-07 15:17:26.414158	44
422	OPqs45EkZKmT9BxcM0sHug	2017-04-07 15:17:26.421369	2017-04-07 15:17:26.421369	44
423	FJviSe8LTDH2kD3KoRNWbA	2017-04-07 15:17:26.428806	2017-04-07 15:17:26.428806	44
424	PMD53E6Mkt0EVVVLGu_kQA	2017-04-07 15:17:26.435562	2017-04-07 15:17:26.435562	44
425	Z_1fSJGnUGDcqtJPNetftA	2017-04-07 15:17:26.445323	2017-04-07 15:17:26.445323	44
426	b7Icq1Ifd5VYIJzFr_WiAA	2017-04-07 15:17:26.453813	2017-04-07 15:17:26.453813	44
427	R-Uef6TPMV6ITwQ2mYlx3g	2017-04-07 15:17:26.461153	2017-04-07 15:17:26.461153	44
428	hxc93RP9LB9uG4XGq91Vlg	2017-04-07 15:17:26.468467	2017-04-07 15:17:26.468467	44
429	mfzB18YcVNxLRMIOWCBfoQ	2017-04-07 15:17:26.475761	2017-04-07 15:17:26.475761	44
430	quUHdx8Sado2tiODUhOEhA	2017-04-07 15:17:26.483491	2017-04-07 15:17:26.483491	44
431	ztvzUHweBNeLY3zneFcnnQ	2017-04-07 15:17:26.498484	2017-04-07 15:17:26.498484	44
432	euAyCyzAVUhcm9xPXfFTfQ	2017-04-07 15:17:26.505441	2017-04-07 15:17:26.505441	44
433	1oEVdRf_ujy_Le3yqS8Sbg	2017-04-07 15:17:26.512706	2017-04-07 15:17:26.512706	44
434	SBDtHFcEbCluvKIt5sBiJg	2017-04-07 15:17:26.520782	2017-04-07 15:17:26.520782	44
435	ayEFgi81IcprAQy8b08krA	2017-04-07 15:17:26.527405	2017-04-07 15:17:26.527405	44
436	zbcYHucbp63rDADjW9KMXQ	2017-04-07 15:17:26.537074	2017-04-07 15:17:26.537074	44
437	095WTeXRrJUU6XkEfLO_NQ	2017-04-07 15:17:26.545612	2017-04-07 15:17:26.545612	44
438	BWkwnVgpeRc82lUT-RNGxw	2017-04-07 15:17:26.555497	2017-04-07 15:17:26.555497	44
439	B8ULYFqoPEt3Li_0e_DOgw	2017-04-07 15:17:26.563717	2017-04-07 15:17:26.563717	44
440	nmBzdqGtxJT5spnKtbCuuA	2017-04-07 15:17:26.5846	2017-04-07 15:17:26.5846	44
441	U6BcYCutwdrIlM-_SxB1wQ	2017-04-07 15:17:26.593688	2017-04-07 15:17:26.593688	44
442	mjFhfByyYYXx2eiq3eOURw	2017-04-07 15:17:26.601885	2017-04-07 15:17:26.601885	44
443	KUjVZNWcOKRdj_nzo5kUVQ	2017-04-07 15:17:26.610614	2017-04-07 15:17:26.610614	44
444	w9gdUWlsHHr87-74QAgSXg	2017-04-07 15:17:26.636935	2017-04-07 15:17:26.636935	44
445	AQi3O3bqT7O-aL-4yW6jcg	2017-04-07 15:17:26.652348	2017-04-07 15:17:26.652348	44
446	rtQrMiwzEVk17VUK9nedSA	2017-04-07 15:17:26.660606	2017-04-07 15:17:26.660606	44
447	1bQkXTmbdAH7gGmEPMQOOg	2017-04-07 18:21:35.105269	2017-04-07 18:21:35.105269	45
448	xvtW7jloDGh_EfumHbcsrg	2017-04-07 18:21:35.12309	2017-04-07 18:21:35.12309	45
449	N242q-5JLM6F-LhB8T3ZcA	2017-04-07 18:21:35.130305	2017-04-07 18:21:35.130305	45
450	7PIm4FZlXDpeP96lVJNyIA	2017-04-07 18:21:35.142661	2017-04-07 18:21:35.142661	45
451	4asVy9eCkC6UR-0LgEwVHQ	2017-04-07 18:21:35.1496	2017-04-07 18:21:35.1496	45
452	SfFjMRvVIzNhnOFE3kD2Aw	2017-04-07 18:21:35.156798	2017-04-07 18:21:35.156798	45
453	3GhTTqSVoPfLc6ZN4vBARA	2017-04-07 18:21:35.165927	2017-04-07 18:21:35.165927	45
454	MZr3r8FZ-GG8nAtuQ33MBQ	2017-04-07 18:21:35.173097	2017-04-07 18:21:35.173097	45
455	5UxKATHURjA1f6ESa79uZQ	2017-04-07 18:21:35.180216	2017-04-07 18:21:35.180216	45
456	_EO1hgG-Q8FWpH7fxFLLqw	2017-04-07 18:21:35.187289	2017-04-07 18:21:35.187289	45
457	mur1jXX5KgOU-eRQmK1dxA	2017-04-07 18:21:35.194725	2017-04-07 18:21:35.194725	45
458	ugeqfhqsrrLMuM6mLFbVJw	2017-04-07 18:21:35.20178	2017-04-07 18:21:35.20178	45
459	KySwvXTFIhzZCQTYIQIJtg	2017-04-07 18:21:35.209098	2017-04-07 18:21:35.209098	45
460	8w0cMpHAYawHrSqSqPj_kQ	2017-04-07 18:21:35.216572	2017-04-07 18:21:35.216572	45
461	-C2Y7v4KZHus7q1XWTmh5w	2017-04-07 18:21:35.224255	2017-04-07 18:21:35.224255	45
462	v5SXW0FxC52VmAAzyZ8XJw	2017-04-07 18:21:35.231354	2017-04-07 18:21:35.231354	45
463	cfoIcg7HUgluMcKPmkdGCA	2017-04-07 18:21:35.239246	2017-04-07 18:21:35.239246	45
464	3EGytx084QWXjg3OpqxcQQ	2017-04-07 18:21:35.246639	2017-04-07 18:21:35.246639	45
465	fdKSAn0RRDitNjYzF7JTyw	2017-04-07 18:21:35.253665	2017-04-07 18:21:35.253665	45
466	usBm9Qkmb8ddiqLlP7GsBg	2017-04-07 18:21:35.260726	2017-04-07 18:21:35.260726	45
467	7gD2iQmCWbw5nm5Hcp5-WA	2017-04-07 18:21:35.27174	2017-04-07 18:21:35.27174	45
468	RgUKLFcsGbOAZbxbtLU1_A	2017-04-07 18:21:35.278854	2017-04-07 18:21:35.278854	45
470	5qQjiLsgKcznoRx4BOKsxw	2017-05-09 12:37:32.905713	2017-05-09 12:37:32.905713	56
471	kkozZn8yLEKkqSo9nN3Qdw	2017-05-09 12:48:57.007859	2017-05-09 12:48:57.007859	57
472	2pW6vC5P_K5vVgxUbDJwDA	2017-05-09 12:50:56.044627	2017-05-09 12:50:56.044627	58
473	DaT3RRm9RpvBPhCFZ61E2g	2017-05-09 15:00:47.388252	2017-05-09 15:00:47.388252	59
474	tmFjnZbd4U72gLxbKKr6Ww	2017-05-09 15:00:47.402896	2017-05-09 15:00:47.402896	59
475	NsYkrUD5LWJ7edVcUa5H0g	2017-05-09 15:00:47.411124	2017-05-09 15:00:47.411124	59
476	NCcJz5-EMEA7yQYpf8kZzQ	2017-05-09 15:11:51.594349	2017-05-09 15:11:51.594349	60
477	NguIRz44XHfpZ32qXC1BCQ	2017-05-09 15:58:11.643699	2017-05-09 15:58:11.643699	61
478	8K7c9r6YMnX9-dWRu_YfEA	2017-05-09 16:06:00.123561	2017-05-09 16:06:00.123561	62
479	x639BVcWg6UX5a9aFXdYuQ	2017-05-09 16:08:56.309879	2017-05-09 16:08:56.309879	63
480	Ifpvmdgt180n79jI51en9Q	2017-05-09 16:13:57.373419	2017-05-09 16:13:57.373419	64
481	yYUgs2ON4bT8M6uD9gNraA	2017-05-09 16:26:51.327289	2017-05-09 16:26:51.327289	65
482	_ePRHYcKyjWvsXmM07LH0Q	2017-05-09 16:29:10.133274	2017-05-09 16:29:10.133274	66
483	xCsiCxnJaHfru6XYTLfxSQ	2017-05-09 16:31:57.147271	2017-05-09 16:31:57.147271	67
484	c6rLoVCposXruJlLTakAIw	2017-05-09 16:34:02.381149	2017-05-09 16:34:02.381149	68
485	vy8kskgzcQb05Ax_SrU-Tg	2017-05-09 16:35:57.066653	2017-05-09 16:35:57.066653	69
486	xlgATMZjKAXAcmDjF7F1ZQ	2017-05-09 16:42:44.070412	2017-05-09 16:42:44.070412	70
487	80BrRuAFBkVTwLKTROb-PQ	2017-05-09 16:48:37.946086	2017-05-09 16:48:37.946086	71
488	bXCmpQq0ASxno4vmR-TIuQ	2017-05-09 16:48:37.965094	2017-05-09 16:48:37.965094	71
489	1HGhQdCNoZJ7kSlEh7I0Zg	2017-05-09 16:52:23.29239	2017-05-09 16:52:23.29239	72
490	Bw0bx3TDNpl-xzPD-kQQcg	2017-05-09 16:57:48.826864	2017-05-09 16:57:48.826864	73
491	HELXFzMEyMt_jGOJ_6zAlA	2017-05-09 16:59:33.232903	2017-05-09 16:59:33.232903	74
492	rCM15QmZ2NBc5LV0M4kM-w	2017-05-09 17:05:13.951573	2017-05-09 17:05:13.951573	75
493	MwC16azP-fuil_rhAoILYw	2017-05-09 17:09:28.487887	2017-05-09 17:09:28.487887	76
494	5r--wrIiUdFNixatr-9SSQ	2017-05-09 17:13:07.326786	2017-05-09 17:13:07.326786	77
495	lks-z2VwVo7iJgW8e6H2zg	2017-05-10 05:30:45.684444	2017-05-10 05:30:45.684444	78
496	qDXkI4KsbpIYsteCx6ADUA	2017-05-10 05:30:45.788634	2017-05-10 05:30:45.788634	78
497	AF7iHZ0j_raAvY_GrJuOig	2017-05-10 05:36:01.42996	2017-05-10 05:36:01.42996	79
498	R9rSvQjTHJ3DKH324IVFnQ	2017-05-10 05:38:36.401781	2017-05-10 05:38:36.401781	80
499	cbuta5lJr9C-PIz4jJz7WQ	2017-05-10 05:57:45.196794	2017-05-10 05:57:45.196794	81
500	O85n0Nar4Hh9Ii5xicgR5w	2017-05-10 05:57:45.21295	2017-05-10 05:57:45.21295	81
501	NEAXDAuuJeWLkGpZtNYSeg	2017-05-10 06:39:08.551927	2017-05-10 06:39:08.551927	82
502	gTElwExtOi_c8844E6Rq3g	2017-05-10 06:43:30.608558	2017-05-10 06:43:30.608558	83
503	RlGkPNWLSVMFPivlfLIc1g	2017-05-10 09:55:39.91536	2017-05-10 09:55:39.91536	87
504	gz7vCjJ5xwovsgHSoPsOyQ	2017-05-10 10:01:31.296508	2017-05-10 10:01:31.296508	88
505	lQRIoWHqx0lfCv0YrivBDA	2017-05-10 10:06:44.22815	2017-05-10 10:06:44.22815	89
506	1rBy_JkEuCxi7FPu95KOnw	2017-05-10 10:38:44.387206	2017-05-10 10:38:44.387206	90
507	QAUf-NNXD8ClVl9JgasiCw	2017-05-10 10:38:44.397474	2017-05-10 10:38:44.397474	90
508	G8ZyVakyeZYeIM25Hn50Hw	2017-05-10 10:38:44.405563	2017-05-10 10:38:44.405563	90
509	wCkiocdsAHrxW7vINV7uOw	2017-05-10 10:46:02.418337	2017-05-10 10:46:02.418337	91
510	gGQFhn2YVqWG1iDeQyal7A	2017-05-10 10:46:02.433313	2017-05-10 10:46:02.433313	91
511	EDywXna6eBbWsKV9ivYsYQ	2017-05-10 10:46:02.441724	2017-05-10 10:46:02.441724	91
512	bslg3lAR73PH4dZkSPCNag	2017-05-10 11:26:00.386549	2017-05-10 11:26:00.386549	92
513	Gir_QEI2Y9orrtJ51X-4eA	2017-05-10 11:26:00.47828	2017-05-10 11:26:00.47828	92
514	8hvZN7bUClP5TeWvWPsoKA	2017-05-10 11:26:00.486428	2017-05-10 11:26:00.486428	92
515	zcsrULlOFE3UOFQDBCRb6A	2017-05-10 11:28:29.298857	2017-05-10 11:28:29.298857	94
516	0JgbQglkREusKaurZQ8PiQ	2017-05-10 11:32:01.19855	2017-05-10 11:32:01.19855	95
517	YiGG57Wv4GbS9EPT6kKEDA	2017-05-10 11:36:51.464393	2017-05-10 11:36:51.464393	96
518	sCNTMfP4-SY5E_iJ03tN5Q	2017-05-10 11:36:51.537973	2017-05-10 11:36:51.537973	96
519	AqzlE-IH3AUY9ZYye3brwA	2017-05-10 11:39:03.184104	2017-05-10 11:39:03.184104	97
520	C-2I5-ZRzJKoaItd9jyTeg	2017-05-10 11:42:32.50674	2017-05-10 11:42:32.50674	98
521	6_qtI0QvQW-vMzMYqfo1zQ	2017-05-10 12:12:46.197715	2017-05-10 12:12:46.197715	100
522	saqoNnwZTE37szkn8WAHBQ	2017-05-10 12:12:46.20528	2017-05-10 12:12:46.20528	100
523	UW6tibAF-NY3JAiJuqmKow	2017-05-10 12:12:46.213854	2017-05-10 12:12:46.213854	100
524	pk1X_tKMNpe3mUFsLo9UIA	2017-05-10 12:12:46.222373	2017-05-10 12:12:46.222373	100
525	GF8f9ykfLzas51NR0AmpUQ	2017-05-10 12:12:46.230291	2017-05-10 12:12:46.230291	100
526	HkkFm_DCAxzXtLqybScuOw	2017-05-10 12:16:48.691954	2017-05-10 12:16:48.691954	101
527	bNupReifTTDLbn2XGAhj0Q	2017-05-10 12:17:27.053581	2017-05-10 12:17:27.053581	102
528	BTTzjMm68nlWYNvpk0GrnA	2017-05-10 12:20:31.066617	2017-05-10 12:20:31.066617	103
529	349ZcLO5WSUGFlDIpqQ6RA	2017-05-10 12:23:15.157084	2017-05-10 12:23:15.157084	104
530	hpVFmd-ByH0cNKhWM0kxAA	2017-05-10 12:25:11.243446	2017-05-10 12:25:11.243446	105
531	5kTnBi4D2yxpL4fSvpfl_Q	2017-05-10 12:27:30.469982	2017-05-10 12:27:30.469982	106
532	AHNGYCE40hxZQrhfs1OxgA	2017-05-10 12:28:00.360521	2017-05-10 12:28:00.360521	107
533	oGiwtr2xK4GXGCdzKeH1DQ	2017-05-10 13:29:46.446265	2017-05-10 13:29:46.446265	109
534	_lWTv9rGZIkT07aPHgStnQ	2017-05-10 13:29:46.523778	2017-05-10 13:29:46.523778	109
535	D16SB3aZ4Qm2AAK7xe8BaQ	2017-05-10 13:45:53.353669	2017-05-10 13:45:53.353669	110
536	25y-tr_TZEoBH8uzCT1PJw	2017-05-10 13:47:03.331795	2017-05-10 13:47:03.331795	111
537	_auaHL3-o5RvC9uQhLdqCA	2017-05-10 14:38:26.729035	2017-05-10 14:38:26.729035	114
538	mpjBVedeXzDGlUYGWoVt2w	2017-05-10 14:54:58.727252	2017-05-10 14:54:58.727252	117
539	sxHhnIk1pfg7kjVcJaEXRw	2017-05-10 15:25:51.761118	2017-05-10 15:25:51.761118	118
540	VaO0lPRWuhTivEPKn5MWvA	2017-05-15 05:56:51.414037	2017-05-15 05:56:51.414037	121
541	0P4XSA04Iw1wPF3hD4FjaA	2017-05-15 06:00:40.952844	2017-05-15 06:00:40.952844	122
542	QwadgFiG42uzlEpAOTwD1w	2017-05-15 06:05:00.089984	2017-05-15 06:05:00.089984	123
543	blYfsifL6v4DTcytG7cHKA	2017-05-15 06:10:09.458513	2017-05-15 06:10:09.458513	124
544	4X2QPFCIDIRiFisbItEsNg	2017-05-15 06:25:24.668968	2017-05-15 06:25:24.668968	125
545	K-v8-K4XGhiPQPYW05eB9w	2017-05-15 06:28:16.35665	2017-05-15 06:28:16.35665	126
546	_2fMqk5vazB80ON0AZsQSw	2017-05-15 06:41:43.117875	2017-05-15 06:41:43.117875	128
547	xq3k1PEeoy6nGz_R8mJ9jQ	2017-05-15 06:51:19.421176	2017-05-15 06:51:19.421176	130
548	EW7E2vxQN6pB77WHUV3FrA	2017-05-16 04:35:09.164787	2017-05-16 04:35:09.164787	136
549	YEQJDwncMsMEWs48mnOLGA	2017-05-16 04:35:09.247557	2017-05-16 04:35:09.247557	136
550	vqvZpTqNvC1HX4nlz31oSw	2017-05-16 06:01:07.331892	2017-05-16 06:01:07.331892	137
551	HVRJwR8URTP3ldpcCg-NcA	2017-05-16 06:01:07.372916	2017-05-16 06:01:07.372916	137
552	9w9UMcppyo8UhYmOGSMW1w	2017-05-16 06:04:24.157297	2017-05-16 06:04:24.157297	138
553	3wL4OYCNXrue4sVbRoL1_g	2017-05-16 06:05:40.73034	2017-05-16 06:05:40.73034	139
554	sIxPfXZENMOCudMb7DfSIg	2017-05-16 06:22:11.646814	2017-05-16 06:22:11.646814	140
555	K3meFe-6JBdYvSdSx1PP6A	2017-05-16 06:23:02.739307	2017-05-16 06:23:02.739307	141
556	TGpcL6ZfIjQO-4FlHE5wIw	2017-05-16 06:36:51.754378	2017-05-16 06:36:51.754378	142
557	YnXKT53NrGzkoCn2iFUpsg	2017-05-16 06:42:04.728586	2017-05-16 06:42:04.728586	143
558	bQN89Vuo5kqIrrfuAKwYqQ	2017-05-16 06:44:20.540965	2017-05-16 06:44:20.540965	144
559	qoZSDo4Gtj-0DQrsac9DGA	2017-05-16 06:54:12.978044	2017-05-16 06:54:12.978044	145
560	cmKhlqG8tBbe_hleRWKa6w	2017-05-16 06:54:13.066916	2017-05-16 06:54:13.066916	145
561	7R4ZMeRPB_4ibo-enupE2w	2017-05-16 06:57:51.225978	2017-05-16 06:57:51.225978	146
562	A2tAAOAKbOG_tnwLvgNomQ	2017-05-16 06:57:51.294809	2017-05-16 06:57:51.294809	146
563	cfWS0KTjGinEVZovP1yVAQ	2017-05-16 07:00:15.406702	2017-05-16 07:00:15.406702	147
564	QYvvOYaXVw9J03xGeG17HA	2017-05-16 07:01:35.181248	2017-05-16 07:01:35.181248	148
565	3QW2hmHUorauLqkP673huw	2017-05-16 07:10:12.824897	2017-05-16 07:10:12.824897	149
566	gHziR9kra22HExA7Z6Ud2g	2017-05-16 07:10:12.843062	2017-05-16 07:10:12.843062	149
567	3K_UkTrSh75ixo8I_8votg	2017-05-16 07:29:42.825233	2017-05-16 07:29:42.825233	150
568	AI2GNJYy9HGUTRhCsLGMzg	2017-05-16 07:29:42.900784	2017-05-16 07:29:42.900784	150
569	w3bmv243BLwWM0s4EI8yWg	2017-05-16 07:31:34.204066	2017-05-16 07:31:34.204066	151
570	ZHb_ZSMkhWSG5wpElPIBuA	2017-05-16 07:33:01.898025	2017-05-16 07:33:01.898025	152
571	wu1hd_bqadXdND4x0DwXXQ	2017-05-16 07:35:06.848869	2017-05-16 07:35:06.848869	153
572	mdhmLQOoq5i2nMDeuMvGdg	2017-05-17 05:45:50.160804	2017-05-17 05:45:50.160804	156
573	6KKMCBIrDXiOdxN2vXvSqQ	2017-05-17 05:45:50.310433	2017-05-17 05:45:50.310433	156
574	_ktK_NzDGg8MXriR9FR1Sw	2017-05-17 06:00:40.078719	2017-05-17 06:00:40.078719	159
575	8ZOTj5HEppgKhPF60M0Yzw	2017-05-17 06:00:40.089174	2017-05-17 06:00:40.089174	159
576	3qqulhEMR9GhdqklAmBVow	2017-05-17 06:31:01.795909	2017-05-17 06:31:01.795909	163
577	Sxb6OdjUVltH5uP5fAdEGg	2017-05-17 06:31:01.810375	2017-05-17 06:31:01.810375	163
578	He8BnKr9suRtjs48TltZBw	2017-05-17 08:32:05.578421	2017-05-17 08:32:05.578421	166
579	skhm2r4n3mfnHnhdWoVDfw	2017-05-17 08:32:53.770027	2017-05-17 08:32:53.770027	167
580	G0KQz9ZPwUafVDEhhYpgpg	2017-05-17 12:45:49.10474	2017-05-17 12:45:49.10474	169
581	ypnQVwTeNGsI_vBZYu-xmw	2017-05-17 13:00:09.048648	2017-05-17 13:00:09.048648	171
582	wVlwDILgdxzDDKdUlVuCaA	2017-05-17 13:04:32.229663	2017-05-17 13:04:32.229663	172
583	CjokRcmjN6UmOmp5oUjRvg	2017-05-17 13:06:41.475436	2017-05-17 13:06:41.475436	173
584	CPBKoWAab_rdVdiP-CxkOw	2017-05-17 13:07:48.466205	2017-05-17 13:07:48.466205	174
585	rQp3pnb1HZo5cnW8cIUV2w	2017-05-18 04:52:39.634859	2017-05-18 04:52:39.634859	178
586	6qOAUpsS3rAu_cdwlHJBuw	2017-05-18 04:58:23.716443	2017-05-18 04:58:23.716443	179
587	2l7iFitgfzA8q7QVEww5FA	2017-05-18 09:00:51.632769	2017-05-18 09:00:51.632769	181
588	EtK3ZLkLhXPXdnjh9q1EAw	2017-05-18 11:21:47.241682	2017-05-18 11:21:47.241682	182
589	6oJ9HtxaLsCGyXq7xSn5Fw	2017-05-18 11:21:47.25932	2017-05-18 11:21:47.25932	182
590	UwcsgIvkjnzuNPx-ns_mkw	2017-05-19 08:55:10.903413	2017-05-19 08:55:10.903413	184
591	ip-_pMf0hUJTj3QbDqgXbQ	2017-05-19 08:55:11.00794	2017-05-19 08:55:11.00794	184
592	Bt9K1mR2DnqHsg6zcc9Ouw	2017-05-19 14:31:21.032508	2017-05-19 14:31:21.032508	189
593	IvBvLpqnFIWGGdgsXsizUA	2017-05-19 14:32:15.310799	2017-05-19 14:32:15.310799	190
594	VA_9x7DaQSBuqCsGf72Z_w	2017-05-19 14:37:32.024672	2017-05-19 14:37:32.024672	191
595	odJ10V99dKL8GmVWwkp56w	2017-05-22 12:59:03.690841	2017-05-22 12:59:03.690841	193
596	KdIwiRG_1DNgNNWNTI4wLg	2017-05-22 13:01:45.528383	2017-05-22 13:01:45.528383	195
597	hJR2EcKZfDxwfOZWfF_xqw	2017-05-22 13:31:58.451706	2017-05-22 13:31:58.451706	196
598	1rNrxPtt9rTreIvBISe8kQ	2017-05-22 14:44:22.170002	2017-05-22 14:44:22.170002	197
599	yCflp11VKsmU3yoClQY0Ag	2017-05-22 14:58:27.66803	2017-05-22 14:58:27.66803	198
600	6nLp_cGPAnn0ojQZub0drg	2017-05-23 08:06:31.327399	2017-05-23 08:06:31.327399	200
601	GZKe3L2H0-yVmbsLeYwlQw	2017-05-23 08:06:31.420677	2017-05-23 08:06:31.420677	200
602	MjsGzJ3qA4DK1PxpvKIVHw	2017-05-23 08:06:31.428543	2017-05-23 08:06:31.428543	200
603	oqL8hj6dK74Y_fpiDW7CQw	2017-05-23 08:08:26.460604	2017-05-23 08:08:26.460604	201
604	LpfjoZPftKYc2skw0nSTsg	2017-05-23 08:09:44.823373	2017-05-23 08:09:44.823373	202
605	sdUq8GhvDeq7iuuck4NVxQ	2017-05-23 08:11:56.28728	2017-05-23 08:11:56.28728	203
606	bYiyNtUpeVaBwM30lecDTg	2017-05-23 08:12:27.344476	2017-05-23 08:12:27.344476	204
607	oD7mXlbG_SboBqJF7hXFLA	2017-05-23 08:13:40.12323	2017-05-23 08:13:40.12323	205
608	9p9LZ-fIO1sJLkp3velsKA	2017-05-26 14:56:42.953079	2017-05-26 14:56:42.953079	210
609	_l7YMhFwPllGy2bjGB_Saw	2017-05-26 14:56:43.160371	2017-05-26 14:56:43.160371	210
610	SyT33JZ7S-w_WYlMiQDuEw	2017-05-26 14:58:47.262044	2017-05-26 14:58:47.262044	211
611	IOK726IKb-CQTkqakoEtlQ	2017-05-26 15:04:43.602281	2017-05-26 15:04:43.602281	213
612	hGK9yuNBg_jyUFyQRlgbww	2017-05-26 15:04:43.615399	2017-05-26 15:04:43.615399	213
613	i9zJvpDTODgbW0y0njkCrQ	2017-05-26 15:04:43.629998	2017-05-26 15:04:43.629998	213
614	b_2GgLCDMs4nW8mAjqOWng	2017-05-26 15:06:25.057263	2017-05-26 15:06:25.057263	214
615	w4rDJgNoen8kY4x-LhXj4A	2017-05-26 15:08:12.83086	2017-05-26 15:08:12.83086	215
616	FP0IhLleNDvez2gHPSsRIA	2017-05-27 09:09:45.742433	2017-05-27 09:09:45.742433	216
617	jMC6nTu1PGAHEEVZAorrbg	2017-05-27 09:09:45.857236	2017-05-27 09:09:45.857236	216
618	szjRKqKQed3DlGpehaviag	2017-05-27 09:09:45.90732	2017-05-27 09:09:45.90732	216
619	jeg9ZGL7029RVHNNCHjnRQ	2017-05-27 09:09:45.915247	2017-05-27 09:09:45.915247	216
620	B9kdqwxViQ7X1nUCAAVz6Q	2017-05-27 09:09:45.926456	2017-05-27 09:09:45.926456	216
621	zLdpw6aCMLRa0HG7XM2bmA	2017-05-27 09:09:45.931813	2017-05-27 09:09:45.931813	216
622	5qrxUkfaGMDXYSubW83Uog	2017-05-27 09:41:01.305011	2017-05-27 09:41:01.305011	217
623	b695YmY_H2R_QU3-t9Y4qQ	2017-05-27 09:41:01.397444	2017-05-27 09:41:01.397444	217
624	38Smko-OTVLVsj4z9EgyUw	2017-05-27 09:41:01.405757	2017-05-27 09:41:01.405757	217
625	2-YLSLIr830XRoQgsSY8Pw	2017-05-27 09:41:01.415629	2017-05-27 09:41:01.415629	217
626	CmBO12_LWjvGhRZ0MpDxEA	2017-05-27 10:43:39.191376	2017-05-27 10:43:39.191376	220
627	91lG6Diwo65bAQ2ESXMdSQ	2017-05-27 10:43:39.208957	2017-05-27 10:43:39.208957	220
628	L4g_4_03CinaJ9gsFVLDmA	2017-05-27 10:43:39.217815	2017-05-27 10:43:39.217815	220
629	tnf8nJWM5i5aWnuvd2Ia8g	2017-05-27 13:44:18.570034	2017-05-27 13:44:18.570034	222
630	nzKJ-675pAph5sqI3EKjQQ	2017-05-27 13:44:18.579268	2017-05-27 13:44:18.579268	222
631	snSezu5U33rF7oRmmHP5Gg	2017-05-27 13:44:18.58379	2017-05-27 13:44:18.58379	222
632	TBcqDq2PkZ_GCQqHVizHgQ	2017-05-27 13:47:30.478551	2017-05-27 13:47:30.478551	223
633	gPuIsTnzC9BH4C7aLvHXtw	2017-05-27 13:47:30.48259	2017-05-27 13:47:30.48259	223
634	rie_rqPQr7ftMTMbhJYw-A	2017-05-27 13:47:30.486706	2017-05-27 13:47:30.486706	223
635	WGAHL12sgUH1gqSYrkb5ng	2017-05-27 13:47:30.495936	2017-05-27 13:47:30.495936	223
636	BVEPfEo9qVoiaNagbIDQNQ	2017-05-27 13:47:30.503996	2017-05-27 13:47:30.503996	223
637	AzASorHLjmvz9wm1BRgEdQ	2017-05-27 13:47:30.520703	2017-05-27 13:47:30.520703	223
638	zHYhZRyp8BYMlXh1c9wyug	2017-05-27 17:58:03.760744	2017-05-27 17:58:03.760744	227
639	cTlXNonVKZaes9VAJ0eaGw	2017-05-27 17:58:03.76869	2017-05-27 17:58:03.76869	227
640	Yi3MLfaqULTVFf2BecCuaA	2017-05-27 17:58:03.778841	2017-05-27 17:58:03.778841	227
641	Ql4NeouEBglxEqvqgJ0XkQ	2017-05-29 14:00:14.183056	2017-05-29 14:00:14.183056	232
642	NsgCXhmV-ghf61zR0Cu7IQ	2017-05-29 14:00:14.191466	2017-05-29 14:00:14.191466	232
643	-EyewSubJ7B9Qv8Gke-7Lg	2017-05-29 14:08:50.923189	2017-05-29 14:08:50.923189	233
644	rs8H2W3asE_cygobXh_Qgw	2017-05-29 14:10:57.229294	2017-05-29 14:10:57.229294	234
645	IgJOgxTe33sAZtbfPsuLJg	2017-05-29 14:10:57.236061	2017-05-29 14:10:57.236061	234
646	rOBisMUiI1CZK3vG1GAFOw	2017-05-29 14:14:45.350936	2017-05-29 14:14:45.350936	235
647	5jUlAlAeU1IL7tZ7S0aNBA	2017-05-29 14:14:45.362114	2017-05-29 14:14:45.362114	235
648	H6-0_xInaUzMO0_2x4Wf1g	2017-05-30 13:52:54.628077	2017-05-30 13:52:54.628077	244
649	q3gMGQEU41ekwhAR75YrZQ	2017-05-31 13:45:21.040846	2017-05-31 13:45:21.040846	248
\.


--
-- Name: redemption_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('redemption_codes_id_seq', 649, true);


--
-- Data for Name: refunds; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY refunds (id, refund_id, transaction_id, location_id, tender_id, amount, payment_id, created_at, updated_at, order_id, subscription_id) FROM stdin;
\.


--
-- Name: refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('refunds_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY schema_migrations (version) FROM stdin;
20150217183051
20150217183101
20150217183111
20150217184330
20150218201253
20150218201538
20150218203105
20150305190031
20150305193809
20150311153802
20150311160316
20150311162325
20150311195006
20150311230039
20150311230058
20150312164215
20150312181700
20150313202444
20150313202522
20150316165042
20150318155755
20150318155906
20150320153659
20150320181213
20150320210159
20150321060822
20150323182752
20150323195620
20150324170821
20150327143624
20150327153336
20150327164712
20150330184600
20150331175647
20150331200807
20170214212119
20170215222424
20170224215621
20170224230018
20170301184233
20170301201300
20170301221544
20170301225525
20170302154509
20170302181045
20170306080414
20170306170833
20170306200718
20170307030337
20170307042607
20170307150015
20170307203956
20170308011008
20170308025958
20170317115644
20170317201225
20170428164050
20170428183526
20170501165034
20170501220911
20170502170308
20170505164924
20170505173247
20170508214452
20170508214910
20170509131100
20170509154023
20170509212602
20170509212618
20170509221733
20170509231845
20170509233032
20170510052146
20170510063548
20170510065234
20170510181558
20170519075906
20170519080248
20170524101300
20170524112223
20170524113637
20170526163940
20170527040038
20170527071529
20170529071858
20170531101020
20170531101607
20170531102325
20170531113018
20170531115311
20170601123316
20170602080649
20141001170138
20141001203541
20141002013618
20141002013701
20141002203725
20141017233304
20141026101628
20141026144800
20141029135848
20141105043439
20141106034610
20141107025420
20141109203101
20141112024805
20141114032013
20141114154223
20141114163841
20141122020755
20141213205847
20150930164135
20151205004838
20170509231637
\.


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY sponsors (id, name, email, phone, address_1, address_2, city, state, country, zip, duration, start_date, region, notes, admin_notes, created_at, updated_at) FROM stdin;
1	Test	este	tes	test	teset	tes	tes	TW	test	estes	2015-11-02	sdfsfsdfsdf		\N	2017-06-02 21:01:09.035432	2017-06-02 21:01:09.035432
2	test	test	test	test	test	test	tes	TW	tes	test	2015-11-01	test	test	\N	2017-06-02 21:06:49.76544	2017-06-02 21:06:49.76544
\.


--
-- Name: sponsors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('sponsors_id_seq', 2, true);


--
-- Data for Name: subscription_plans; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY subscription_plans (id, amount, "interval", name, created_at, updated_at) FROM stdin;
1	299	month	Monthly Subscription	2017-03-08 18:51:36.500187	2017-03-20 18:56:43.325538
\.


--
-- Name: subscription_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('subscription_plans_id_seq', 2, true);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY subscriptions (id, name, amount, active, customer_id, card_id, card_brand, card_last_4, card_exp_month, card_exp_year, user_id, created_at, updated_at, subscription_plan_id, email, subscription_otp, sub_mobile_no) FROM stdin;
5	Monthly Subscription	299	t	\N	4111111111111111	Visa	1111	12	2019	76	2017-05-23 14:45:42.42458	2017-05-23 14:45:42.42458	1	\N	\N	\N
7	Monthly Subscription	299	t	\N	4111111111111111	Visa	1111	12	2019	82	2017-06-02 13:30:33.524076	2017-06-02 13:33:23.105739	1	martin@gmail.com	5098	+917387145433
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('subscriptions_id_seq', 7, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY users (id, name, redemption_code, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, device_token, device_platform, authentication_token, token_expires_at, image_id, website, bio, location, longitude, latitude, city, state, country, is_permanent) FROM stdin;
15	David	\N	daveedchun@gmail.com	$2a$10$bqH57LoMPYG/gNFue0GcoeDxh6tLB8iEZ5D7fs4BoGtnbycjHXdea	182f9eaee7bfeb8edfd4ad3555a156c43b6252a5fe1a6e9ea66edcd277be5d60	2017-04-25 19:34:05.742553	\N	1	2017-04-25 15:14:22.673235	2017-04-25 15:14:22.673235	172.248.93.30	172.248.93.30	2017-04-25 15:14:22.656167	2017-04-25 19:34:05.743583	\N	\N	gLtRgeUEJeVBiwm4F-YJ	2017-05-09 15:14:22.655335	\N	\N	\N	Los Angeles	-118.243684900000005	34.0522342000000009	Los Angeles	CA	US	\N
1	Karla Pollowitz	code345	karla.pollowitz@metova.com	$2a$10$jBXWTw1FNq1omskrcbbwn.5zr1jbvP5JuqBFLBRsC7TabmaFZo3lC	\N	\N	\N	14	2017-03-08 19:18:33.5633	2017-03-08 19:15:43.833088	173.10.106.54	173.10.106.54	2017-02-22 18:45:33.436598	2017-03-08 19:18:33.565844	\N	\N	zoRNcLzmYEnGrhNqmCBf	2017-03-22 17:49:22.708806	0fe28063ea988fc843b529923093881a60af6ef4f31de612dfa15744e68a		test	98103	-122.342557499999998	47.6600086999999988	Seattle	WA	US	\N
11	Beunse	\N	ad091313@gmail.com	$2a$10$xKY25aZPClgrORnsAsu0Z.RMC5KNA99QOqnu0gaqgFwcabpjU4xiy	\N	\N	\N	1	2017-04-18 13:24:42.36629	2017-04-18 13:24:42.36629	43.227.133.66	43.227.133.66	2017-04-18 13:24:42.359147	2017-04-18 13:24:42.367864	\N	\N	eZQbowW8skFQjb7V8HRG	2017-05-02 13:24:42.358565	\N	\N	\N	NY	-74.0059413000000035	40.7127837000000028	New York	NY	US	\N
16	asdasd	\N	david@boopis.com	$2a$10$1PI8yM1NWV3rPOcggVBci.1sLbSgI3q6lnhUHM5MVBAKGf2iGsQdS	\N	\N	\N	1	2017-04-26 22:18:13.042495	2017-04-26 22:18:13.042495	172.248.93.30	172.248.93.30	2017-04-26 22:18:13.022756	2017-04-26 22:18:13.044184	\N	\N	xLxhveJEd17MyC8GRyzM	2017-05-10 22:18:13.022004	\N	\N	\N	da	-83.0457538	42.3314269999999979	Detroit	MI	US	\N
10	John		aad80@yahoo.com	$2a$10$h/S0a.Xa6PIqqxDR5IYs4O6f4sPjcGjp3y0dqmO5h1XyuyOh5pK6S	4ef7e8bafc901ca99b792cf7015091bdffb950262679cb01bef022952a738b28	2017-04-18 10:50:52.237598	\N	4	2017-04-18 15:03:15.288997	2017-04-18 11:22:49.839969	43.227.133.66	43.227.133.66	2017-04-18 09:30:52.788971	2017-04-18 15:06:13.838208	\N	\N	cXkTpa6Duadz2JyzFSkb	2017-05-02 09:30:52.788275	\N	\N	\N	NY	-74.0059413000000035	40.7127837000000028	New York	NY	US	\N
8	Pete Dunlap	_9Xp_CgUR0VxFL7ZYyn_JQ	pete.dunlap@metova.com	$2a$10$LaQ5bruQcQKVVRCZ3Q2d.uPV1AAgeO3uH.b4nOPVo7ZNaIABoDRFu	\N	\N	\N	2	2017-03-09 16:24:39.555568	2017-03-08 19:21:14.035665	50.132.224.5	50.202.1.113	2017-03-08 19:21:14.028972	2017-03-09 16:24:39.55793	\N	\N	yQhNFdRHNbhgt6gLt4xH	2017-03-22 18:21:14.028419	\N	\N	\N	Nashville, TN	-86.7816016000000019	36.1626637999999971	Nashville	TN	US	\N
12	John	\N	john@gmail.com	$2a$10$IWWY9HaGa/nItM/uoh7StOG.SReO3wBAGoax4GFe5SedVJLjfPacO	\N	\N	\N	1	2017-04-20 13:14:58.453684	2017-04-20 13:14:58.453684	43.227.133.66	43.227.133.66	2017-04-20 13:14:58.446243	2017-04-20 13:15:38.985582	\N	\N	1zd6Lpz6EGT6WraHhJPL	2017-05-04 13:14:58.445599	9100fc4215f6a6dfdaab103b3e4f6d9c8f0762704013633ed880843f0296			LA	-118.243684900000005	34.0522342000000009	Los Angeles	CA	US	\N
9	Trustwar	\N	xbases@plitkagranit.com	$2a$10$K2GMIBjrwV507OlzADIhluxwZfW321mTnRfHrWpdzJ4c3vuD22kaq	\N	\N	\N	1	2017-04-13 07:08:06.776425	2017-04-13 07:08:06.776425	37.115.208.68	37.115.208.68	2017-04-13 07:08:06.765715	2017-04-13 07:08:06.778057	\N	\N	ceribN88PmLnYBgSWoFz	2017-04-27 07:08:06.765014	\N	\N	\N	Россия	105.318755999999993	61.524009999999997	Taymyrskiy avtonomnyy okrug	Krasnoyarskiy kray	RU	\N
3	Test	g-Q3Wl4jbNpw-cmPUWtN4w	annabanana007@gmail.com	$2a$10$mkcZ7k3i4QeWDGM1Zh1HuuFow4B0tnONAYlQO6nv4TCxGEIWT2Fw.	98079eff1d35ebe4724304fb847c9dbbd984c9b265cef61c61650dd8fedab625	2017-04-23 20:59:36.833364	\N	6	2017-03-12 03:01:36.360992	2017-03-08 19:25:24.502823	24.47.229.230	209.36.90.18	2017-03-08 02:19:24.312693	2017-04-23 20:59:36.836023	\N	\N	c1CTuHzxpcAeT-ZTgxkW	2017-05-07 20:59:36.83536	\N	\N	\N	New York	-74.0059413000000035	40.7127837000000028	New York	NY	US	\N
17	Rupali	\N	1akash@gmail.com	$2a$10$eZ9HFo9t9qvZyz/rF2OhCe9OzUGsS4h0T1POQjPUcDqzd966oJCQq	\N	\N	\N	2	2017-05-10 06:05:31.170758	2017-05-10 06:04:52.470827	127.0.0.1	127.0.0.1	2017-05-10 06:04:52.098414	2017-05-10 06:05:31.172266	\N	\N	savNgJwZZf_wi-T-gLCd	2017-05-24 06:04:52.097677	\N	\N	\N	M	-112.087412099999995	33.4831847999999965	Phoenix	AZ	US	\N
18	asdas	\N	asdas@xcxz.ccc	$2a$10$4.AlwmTb8asfFm23BjFNPu7.liR1Xm53jEy.vH.Dd3NJV5.jQfQ3G	\N	\N	\N	1	2017-05-10 07:02:40.780341	2017-05-10 07:02:40.780341	127.0.0.1	127.0.0.1	2017-05-10 07:02:30.922975	2017-05-10 07:02:40.781488	\N	\N	YbidCNnC6P7FPCy86yx_	2017-05-24 07:02:30.922112	\N	\N	\N	czx	119.783935	31.9120479999999986	Changzhou Shi	Jiangsu Sheng	CN	\N
19	sadas	\N	absc@gmail.com	$2a$10$AS2zBZnc4lxS4oyTt3EnDuw5FxP7P37VatLSxjEMyrWYSETjbQyFi	\N	\N	\N	1	2017-05-10 07:45:06.433286	2017-05-10 07:45:06.433286	127.0.0.1	127.0.0.1	2017-05-10 07:45:06.318046	2017-05-10 07:45:06.434296	\N	\N	xkSUHw6uX3u2auwQxTk_	2017-05-24 07:45:06.317138	\N	\N	\N	asdas	-1.82860749999999994	51.5595222000000035	Swindon	England	GB	\N
20	sadas	\N	sda@zxczx.cc	$2a$10$IEAzOYtKZW1nbDXU/s3FHe6Ovy/CBssFqd4C3IwiMYlgV7UTp/q5O	\N	\N	\N	1	2017-05-10 07:47:02.745349	2017-05-10 07:47:02.745349	127.0.0.1	127.0.0.1	2017-05-10 07:46:29.558688	2017-05-10 07:47:02.746958	\N	\N	HBVmuTyxxDuLWCaKUx1z	2017-05-24 07:46:29.558158	\N	\N	\N	sds	-84.7420667999999893	39.5001273000000026	Oxford	OH	US	\N
21	asdsad	\N	zxzc@zcxzc.cc	$2a$10$Mi43J9hiL44LcVHriS.S0uWLLvCS11HK/qjiUtK1BNAcDoWxRDkGK	\N	\N	\N	1	2017-05-10 07:49:24.049683	2017-05-10 07:49:24.049683	127.0.0.1	127.0.0.1	2017-05-10 07:49:16.931281	2017-05-10 07:49:24.051497	\N	\N	EfWAzt2m3w23GnexWzXD	2017-05-24 07:49:16.93058	\N	\N	\N	asdsa	69.6039079999999899	40.2975743999999878	Khujand	Sughd Province	TJ	\N
22	sdsada	\N	sczx@ccv.vv	$2a$10$bqWyBb.VNI7GkqluXq.u5Ovsk0M2BieCcbFWjeTJWIprYCpFTLTPO	\N	\N	\N	1	2017-05-10 07:52:27.5018	2017-05-10 07:52:27.5018	127.0.0.1	127.0.0.1	2017-05-10 07:51:29.289525	2017-05-10 07:52:27.50279	\N	\N	vsxs_VV8sq7B6f-tki8H	2017-05-24 07:51:29.289012	\N	\N	\N	k	-122.479565800000003	37.7292257000000006	San Francisco	CA	US	\N
24	sczxc	\N	cxzc@cxzxzc.cc	$2a$10$OFCfEINOmsFfRM7SPobwLuht/cmuOVhGHyeBs6eUp3FHMvUqNLHHe	\N	\N	\N	0	\N	\N	\N	\N	2017-05-10 09:08:10.169533	2017-05-10 09:08:10.169533	\N	\N	EG797r5Hi4zWWp1g5YDZ	2017-05-24 09:08:10.168455	\N	\N	\N	vxzv	\N	\N	\N	\N	\N	\N
25	sczxc	\N	sdasd@czxc.cc	$2a$10$g8bse4CVzXNNaTyydhgqfObP7z2SFHUhVeZgrxwK4USY.rRwI.iMa	\N	\N	\N	0	\N	\N	\N	\N	2017-05-10 09:10:20.541095	2017-05-10 09:10:20.541095	\N	\N	RACMQssmE9T-1q4Fs_46	2017-05-24 09:10:20.540605	\N	\N	\N	vxzv	\N	\N	\N	\N	\N	\N
26	sczxc	\N	sxdasd@czxc.cc	$2a$10$r4uP2qtJTC66Px38ah4qQ.c1OQEwqnno9SIbYEIeinvHzjFK75Vsy	\N	\N	\N	0	\N	\N	\N	\N	2017-05-10 09:11:00.934349	2017-05-10 09:11:00.934349	\N	\N	Ry7Nn5SSbXR2ZDXaqv8n	2017-05-24 09:11:00.933618	\N	\N	\N	vxzv	\N	\N	\N	\N	\N	\N
27	sczxc	\N	sxdssasd@czxc.cc	$2a$10$qeGr/ihGjVBK4FSTjty3W.DQbw.68Y/AeGn8NSv0gN6OYhDd6Pa4i	\N	\N	\N	1	2017-05-10 09:14:09.421182	2017-05-10 09:14:09.421182	127.0.0.1	127.0.0.1	2017-05-10 09:13:59.305414	2017-05-10 09:14:09.422451	\N	\N	5SnszTz7wjFFaFsqfDAr	2017-05-24 09:13:59.304413	\N	\N	\N	vxzv	\N	\N	\N	\N	\N	\N
28	zczc	\N	czx@xxc.cc	$2a$10$xJJXnVapaB.J6FaUOZ2H4ObVa6t5XgVf46NhUUIBQNXpV0AuVSq5u	\N	\N	\N	0	\N	\N	\N	\N	2017-05-10 09:18:15.818557	2017-05-10 09:18:15.818557	\N	\N	z2Tfbu89i5PL6drwnd6K	2017-05-24 09:18:15.81741	\N	\N	\N	czxc	20.8614579999999989	52.0577500000000128	Wólka Kosowska	mazowieckie	PL	\N
13	Kevin	\N	hratarakash@gmail.com	$2a$10$hftMKPW8DtOB5i4ksaw35eeUOnQ3GxvyxvJEQY8IGumG92fiIp4/W	7ea587d0bc37bb8edc5dbb83b7f4c413887adc8230e4e55ad0bf2e0c33e2bfed	2017-04-20 13:21:38.712167	\N	1	2017-04-20 13:20:05.515591	2017-04-20 13:20:05.515591	43.227.133.66	43.227.133.66	2017-04-20 13:20:05.506655	2017-04-20 13:21:38.713162	\N	\N	s2Utsf5fbACP4BjmNzCy	2017-05-04 13:20:05.506028	\N	\N	\N	mdfn	\N	\N	\N	\N	\N	\N
76	Kendrik	\N	xyz@gmail.com	$2a$10$V043EEH7FrSZMwqYOH4MSuhDIARf68gZsdyOGCulo412LgEKzcjXi	\N	\N	\N	19	2017-06-01 14:03:10.520788	2017-06-01 13:25:17.962589	43.227.133.66	43.227.133.66	2017-05-23 08:14:42.05968	2017-06-01 14:03:10.522928	\N	\N	DFhmSkWMpD9_b7jUz2rF	2017-06-06 08:14:42.059118	\N	\N	\N	LA	-118.243684900000005	34.0522342000000009	Los Angeles	CA	US	\N
79	qwe	gzY8besHpoJEzWckxZpjvw	qwe@gmail.com	$2a$10$Z8Xp81QWKWFh1TV875XAvOlQZNLLeFJDOiwlhPVxELhq1c28MTCsu	\N	\N	\N	1	2017-05-29 14:12:55.789891	2017-05-29 14:12:55.789891	43.227.133.66	43.227.133.66	2017-05-29 14:12:55.76931	2017-05-29 14:20:18.780448	\N	\N	hqxSFaoMF74_2FdfhFws	2017-06-12 14:12:55.76857	\N	www.xyz.com	test	Mumbai	72.8776558999999935	19.0759836999999983	Mumbai	MH	IN	\N
75	ssadas	oD7mXlbG_SboBqJF7hXFLA	abc@gmail.com	$2a$10$ioG7Gyf9vWXID2fRkASQfOl1MWst.gVy5DTnYMpWO7RR1MZKYQwUG	\N	\N	\N	37	2017-06-02 14:12:18.880632	2017-05-31 13:43:45.890506	43.227.133.66	43.227.133.66	2017-05-18 11:24:08.307112	2017-06-02 14:12:18.887052	\N	\N	Hq1WyZSWhYeh-z1-RE_u	2017-06-16 14:12:18.886274	e1110adee780726296866e0beb0a889a1ec31f7c994f765372c839fa37c5	www.google.com	I love Google.com	sdsa	-118.377993799999999	34.1991638999999878	Los Angeles	CA	US	\N
82	Martin	\N	martin@gmail.com	$2a$10$dmVPyKshAJ5gihEPiwGTweEeFltU2fBdnmRdwKEbYCyNYd7HqovSq	\N	\N	\N	5	2017-06-02 16:16:28.134453	2017-06-02 14:17:13.983198	43.227.133.66	43.227.133.66	2017-06-02 13:33:23.04876	2017-06-02 16:16:28.136615	\N	\N	DYATx5Mi5Dg34CJSA8p7	2017-06-16 13:33:23.047907	\N	\N	\N	LA	-118.243684900000005	34.0522342000000009	Los Angeles	CA	US	f
14	Test	\N	annawharrison@gmail.com	$2a$10$l.Jv1a3tV9hzPI2C0CBeKO9ENgtwgTkH.Zu6a/44yFXEpTZwX5ilK	\N	\N	\N	14	2017-06-02 17:05:03.807479	2017-06-02 14:15:28.75651	86.97.7.47	209.36.90.18	2017-04-23 21:00:30.573944	2017-06-02 17:05:03.810209	\N	\N	Zb4JCepcwSZbDvs2x7oT	2017-06-12 13:42:02.348374	\N		test	Test	-122.677050399999999	45.5121010000000012	Portland	OR	US	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('users_id_seq', 85, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY versions (id, item_type, item_id, event, whodunnit, object, created_at) FROM stdin;
1	Order	1	create	\N	\N	2017-03-06 18:22:25.235612
2	Order	1	update	\N	---\nshipped: new\nid: 1\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-e41a6a794d\npermalink: 386a736581\ncreated_at: 2017-03-06 18:22:25.235612000 Z\nupdated_at: 2017-03-06 18:22:25.235612000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-06 18:22:31.56147
3	Order	1	update	\N	---\nshipped: new\nid: 1\nprice: !ruby/object:BigDecimal 54:0.830079000000000007197E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.50379000000000007197E1\nsubtotal: !ruby/object:BigDecimal 36:0.7197E2\nshipping: \nname: order-e41a6a794d\npermalink: 386a736581\ncreated_at: 2017-03-06 18:22:25.235612000 Z\nupdated_at: 2017-03-06 18:22:31.561470000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-06 18:22:47.537111
4	Order	2	create	\N	\N	2017-03-06 20:31:38.662944
5	Order	2	update	\N	---\nshipped: new\nid: 2\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-f039c94ee1\npermalink: 51b4ed68cc\ncreated_at: 2017-03-06 20:31:38.662944000 Z\nupdated_at: 2017-03-06 20:31:38.662944000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-06 20:35:17.195056
6	Order	2	update	\N	---\nshipped: new\nid: 2\nprice: !ruby/object:BigDecimal 36:0.574786000000000004998E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.34986000000000004998E1\nsubtotal: !ruby/object:BigDecimal 18:0.4998E2\nshipping: \nname: order-f039c94ee1\npermalink: 51b4ed68cc\ncreated_at: 2017-03-06 20:31:38.662944000 Z\nupdated_at: 2017-03-06 20:35:17.195056000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-06 20:40:56.02252
7	Payola::Sale	1	create	\N	\N	2017-03-06 20:52:17.554742
8	Payola::Sale	1	update	\N	---\nstate: pending\nid: 1\nemail: taddaquay@gmail.com\nguid: g70qv1\nproduct_id: 2\nproduct_type: Order\ncreated_at: 2017-03-06 20:52:17.554742000 Z\nupdated_at: 2017-03-06 20:52:17.554742000 Z\nstripe_id: \nstripe_token: tok_19uSoVKyDViFGl99i1uXlHto\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 2980\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-06 20:52:17.652702
9	Payola::Sale	1	update	\N	---\nstate: processing\nid: 1\nemail: taddaquay@gmail.com\nguid: g70qv1\nproduct_id: 2\nproduct_type: Order\ncreated_at: 2017-03-06 20:52:17.554742000 Z\nupdated_at: 2017-03-06 20:52:17.652702612 Z\nstripe_id: \nstripe_token: tok_19uSoVKyDViFGl99i1uXlHto\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 2980\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-06 20:52:20.167432
10	Order	2	update	\N	---\nshipped: new\nid: 2\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-f039c94ee1\npermalink: 51b4ed68cc\ncreated_at: 2017-03-06 20:31:38.662944000 Z\nupdated_at: 2017-03-06 20:40:56.022520000 Z\nshipping_address_id: \nbilling_address_id: 2\n	2017-03-06 20:52:20.720001
11	Order	1	update	\N	---\nshipped: new\nid: 1\nprice: !ruby/object:BigDecimal 54:0.830079000000000007197E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.50379000000000007197E1\nsubtotal: !ruby/object:BigDecimal 36:0.7197E2\nshipping: \nname: order-e41a6a794d\npermalink: 386a736581\ncreated_at: 2017-03-06 18:22:25.235612000 Z\nupdated_at: 2017-03-06 18:22:47.537111000 Z\nshipping_address_id: \nbilling_address_id: 1\n	2017-03-07 17:14:17.385332
12	Payola::Sale	2	create	\N	\N	2017-03-07 17:15:04.018594
13	Payola::Sale	2	update	\N	---\nstate: pending\nid: 2\nemail: holmankarla@gmail.com\nguid: 99vb49\nproduct_id: 1\nproduct_type: Order\ncreated_at: 2017-03-07 17:15:04.018594000 Z\nupdated_at: 2017-03-07 17:15:04.018594000 Z\nstripe_id: \nstripe_token: tok_19ultoKyDViFGl99LBIWvrGD\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 11816\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 17:15:04.170179
14	Payola::Sale	2	update	\N	---\nstate: processing\nid: 2\nemail: holmankarla@gmail.com\nguid: 99vb49\nproduct_id: 1\nproduct_type: Order\ncreated_at: 2017-03-07 17:15:04.018594000 Z\nupdated_at: 2017-03-07 17:15:04.170179145 Z\nstripe_id: \nstripe_token: tok_19ultoKyDViFGl99LBIWvrGD\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 11816\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 17:15:06.745613
15	Order	1	update	\N	---\nshipped: new\nid: 1\nprice: !ruby/object:BigDecimal 54:0.1181672000000000010296E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.72072000000000010296E1\nsubtotal: !ruby/object:BigDecimal 27:0.10296E3\nshipping: \nname: order-e41a6a794d\npermalink: 386a736581\ncreated_at: 2017-03-06 18:22:25.235612000 Z\nupdated_at: 2017-03-07 17:14:17.385332000 Z\nshipping_address_id: \nbilling_address_id: 1\n	2017-03-07 17:15:08.020423
16	Order	3	create	\N	\N	2017-03-07 19:28:39.113494
17	Order	3	update	\N	---\nshipped: new\nid: 3\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-be6ed95e69\npermalink: 1087420f2d\ncreated_at: 2017-03-07 19:28:39.113494000 Z\nupdated_at: 2017-03-07 19:28:39.113494000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-07 19:28:55.195921
18	Payola::Sale	3	create	\N	\N	2017-03-07 19:29:07.315351
19	Payola::Sale	3	update	\N	---\nstate: pending\nid: 3\nemail: holmankarla@gmail.com\nguid: tgm9d4\nproduct_id: 3\nproduct_type: Order\ncreated_at: 2017-03-07 19:29:07.315351000 Z\nupdated_at: 2017-03-07 19:29:07.315351000 Z\nstripe_id: \nstripe_token: tok_19unzYKyDViFGl99vJ4NIDHr\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 19:29:07.444571
20	Payola::Sale	3	update	\N	---\nstate: processing\nid: 3\nemail: holmankarla@gmail.com\nguid: tgm9d4\nproduct_id: 3\nproduct_type: Order\ncreated_at: 2017-03-07 19:29:07.315351000 Z\nupdated_at: 2017-03-07 19:29:07.444571404 Z\nstripe_id: \nstripe_token: tok_19unzYKyDViFGl99vJ4NIDHr\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 19:29:09.767725
21	Order	3	update	\N	---\nshipped: new\nid: 3\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-be6ed95e69\npermalink: 1087420f2d\ncreated_at: 2017-03-07 19:28:39.113494000 Z\nupdated_at: 2017-03-07 19:28:55.195921000 Z\nshipping_address_id: \nbilling_address_id: 3\n	2017-03-07 19:29:11.010779
22	Order	4	create	\N	\N	2017-03-07 21:18:51.663319
24	Payola::Sale	4	create	\N	\N	2017-03-07 21:19:22.583406
77	Order	15	create	\N	\N	2017-03-08 19:08:36.029796
23	Order	4	update	\N	---\nshipped: new\nid: 4\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-64d0247e3d\npermalink: c32d50023a\ncreated_at: 2017-03-07 21:18:51.663319000 Z\nupdated_at: 2017-03-07 21:18:51.663319000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-07 21:19:12.064211
25	Payola::Sale	4	update	\N	---\nstate: pending\nid: 4\nemail: holmankarla@gmail.com\nguid: q0q08\nproduct_id: 4\nproduct_type: Order\ncreated_at: 2017-03-07 21:19:22.583406000 Z\nupdated_at: 2017-03-07 21:19:22.583406000 Z\nstripe_id: \nstripe_token: tok_19upiFKyDViFGl99E3QDd8aM\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 21:19:22.668711
26	Payola::Sale	4	update	\N	---\nstate: processing\nid: 4\nemail: holmankarla@gmail.com\nguid: q0q08\nproduct_id: 4\nproduct_type: Order\ncreated_at: 2017-03-07 21:19:22.583406000 Z\nupdated_at: 2017-03-07 21:19:22.668711763 Z\nstripe_id: \nstripe_token: tok_19upiFKyDViFGl99E3QDd8aM\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 21:19:24.919729
27	Order	4	update	\N	---\nshipped: new\nid: 4\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-64d0247e3d\npermalink: c32d50023a\ncreated_at: 2017-03-07 21:18:51.663319000 Z\nupdated_at: 2017-03-07 21:19:12.064211000 Z\nshipping_address_id: \nbilling_address_id: 4\n	2017-03-07 21:19:25.980351
28	Order	5	create	\N	\N	2017-03-07 21:24:15.84487
29	Order	5	update	\N	---\nshipped: new\nid: 5\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-0fada9d4cc\npermalink: 03b9b9f96e\ncreated_at: 2017-03-07 21:24:15.844870000 Z\nupdated_at: 2017-03-07 21:24:15.844870000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-07 21:24:32.227509
30	Payola::Sale	5	create	\N	\N	2017-03-07 21:24:41.868884
31	Payola::Sale	5	update	\N	---\nstate: pending\nid: 5\nemail: holmankarla@gmail.com\nguid: 6elnc5\nproduct_id: 5\nproduct_type: Order\ncreated_at: 2017-03-07 21:24:41.868884000 Z\nupdated_at: 2017-03-07 21:24:41.868884000 Z\nstripe_id: \nstripe_token: tok_19upnOKyDViFGl99ofoUIqoN\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 21:24:41.975646
32	Payola::Sale	5	update	\N	---\nstate: processing\nid: 5\nemail: holmankarla@gmail.com\nguid: 6elnc5\nproduct_id: 5\nproduct_type: Order\ncreated_at: 2017-03-07 21:24:41.868884000 Z\nupdated_at: 2017-03-07 21:24:41.975646375 Z\nstripe_id: \nstripe_token: tok_19upnOKyDViFGl99ofoUIqoN\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 21:24:43.758639
33	Order	5	update	\N	---\nshipped: new\nid: 5\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-0fada9d4cc\npermalink: 03b9b9f96e\ncreated_at: 2017-03-07 21:24:15.844870000 Z\nupdated_at: 2017-03-07 21:24:32.227509000 Z\nshipping_address_id: \nbilling_address_id: 5\n	2017-03-07 21:24:44.973244
34	Order	6	create	\N	\N	2017-03-07 21:27:00.852147
35	Order	6	update	\N	---\nshipped: new\nid: 6\nprice: !ruby/object:BigDecimal 45:0.1383465000000000011995E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.83965000000000011995E2\nsubtotal: !ruby/object:BigDecimal 36:0.11995E4\nshipping: \nname: order-f46c03c9ff\npermalink: 2a44b386ad\ncreated_at: 2017-03-07 21:27:00.852147000 Z\nupdated_at: 2017-03-07 21:27:00.852147000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-07 21:27:16.855065
36	Order	6	update	\N	---\nshipped: new\nid: 6\nprice: !ruby/object:BigDecimal 45:0.1383465000000000011995E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.83965000000000011995E2\nsubtotal: !ruby/object:BigDecimal 36:0.11995E4\nshipping: \nname: order-f46c03c9ff\npermalink: 2a44b386ad\ncreated_at: 2017-03-07 21:27:00.852147000 Z\nupdated_at: 2017-03-07 21:27:16.855065000 Z\nshipping_address_id: \nbilling_address_id: 6\n	2017-03-07 21:27:26.857183
37	Payola::Sale	6	create	\N	\N	2017-03-07 21:28:33.582396
38	Payola::Sale	6	update	\N	---\nstate: pending\nid: 6\nemail: holmankarla@gmail.com\nguid: 785ij9\nproduct_id: 6\nproduct_type: Order\ncreated_at: 2017-03-07 21:28:33.582396000 Z\nupdated_at: 2017-03-07 21:28:33.582396000 Z\nstripe_id: \nstripe_token: tok_19upr8KyDViFGl99HKzMGOZ2\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 168155\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 21:28:33.604478
39	Payola::Sale	6	update	\N	---\nstate: processing\nid: 6\nemail: holmankarla@gmail.com\nguid: 785ij9\nproduct_id: 6\nproduct_type: Order\ncreated_at: 2017-03-07 21:28:33.582396000 Z\nupdated_at: 2017-03-07 21:28:33.604478457 Z\nstripe_id: \nstripe_token: tok_19upr8KyDViFGl99HKzMGOZ2\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 168155\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-07 21:28:35.391147
40	Order	6	update	\N	---\nshipped: new\nid: 6\nprice: !ruby/object:BigDecimal 45:0.1681558000000000014594E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.102158000000000014594E3\nsubtotal: !ruby/object:BigDecimal 27:0.14594E4\nshipping: \nname: order-f46c03c9ff\npermalink: 2a44b386ad\ncreated_at: 2017-03-07 21:27:00.852147000 Z\nupdated_at: 2017-03-07 21:27:26.857183000 Z\nshipping_address_id: \nbilling_address_id: 6\n	2017-03-07 21:28:35.848136
41	Order	7	create	\N	\N	2017-03-08 01:48:04.106748
42	Order	7	update	\N	---\nshipped: new\nid: 7\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-8a6f55c912\npermalink: 110313de15\ncreated_at: 2017-03-08 01:48:04.106748000 Z\nupdated_at: 2017-03-08 01:48:04.106748000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 01:48:45.22173
43	Order	8	create	\N	\N	2017-03-08 02:13:42.438938
44	Order	8	update	\N	---\nshipped: new\nid: 8\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-72257e85d1\npermalink: d1ebc123b0\ncreated_at: 2017-03-08 02:13:42.438938000 Z\nupdated_at: 2017-03-08 02:13:42.438938000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 02:14:03.130933
45	Payola::Sale	7	create	\N	\N	2017-03-08 02:17:34.528941
66	Order	11	create	\N	\N	2017-03-08 14:42:10.7951
574	Order	122	create	\N	\N	2017-05-15 05:57:02.157506
46	Payola::Sale	7	update	\N	---\nstate: pending\nid: 7\nemail: annabanana007@gmail.com\nguid: 1s2lkc\nproduct_id: 8\nproduct_type: Order\ncreated_at: 2017-03-08 02:17:34.528941000 Z\nupdated_at: 2017-03-08 02:17:34.528941000 Z\nstripe_id: \nstripe_token: tok_19uuMpKyDViFGl99MiD6MCzz\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 2766\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 02:17:34.629982
47	Payola::Sale	7	update	\N	---\nstate: processing\nid: 7\nemail: annabanana007@gmail.com\nguid: 1s2lkc\nproduct_id: 8\nproduct_type: Order\ncreated_at: 2017-03-08 02:17:34.528941000 Z\nupdated_at: 2017-03-08 02:17:34.629982097 Z\nstripe_id: \nstripe_token: tok_19uuMpKyDViFGl99MiD6MCzz\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 2766\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 02:17:36.581838
51	Payola::Sale	8	update	\N	---\nstate: pending\nid: 8\nemail: taddaquay@gmail.com\nguid: le7j71\nproduct_id: 7\nproduct_type: Order\ncreated_at: 2017-03-08 02:20:09.205459000 Z\nupdated_at: 2017-03-08 02:20:09.205459000 Z\nstripe_id: \nstripe_token: tok_19uuPJKyDViFGl99OlbWNwW9\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 02:20:09.223378
52	Payola::Sale	8	update	\N	---\nstate: processing\nid: 8\nemail: taddaquay@gmail.com\nguid: le7j71\nproduct_id: 7\nproduct_type: Order\ncreated_at: 2017-03-08 02:20:09.205459000 Z\nupdated_at: 2017-03-08 02:20:09.223378497 Z\nstripe_id: \nstripe_token: tok_19uuPJKyDViFGl99OlbWNwW9\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 02:20:11.053856
48	Order	8	update	\N	---\nshipped: new\nid: 8\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-72257e85d1\npermalink: d1ebc123b0\ncreated_at: 2017-03-08 02:13:42.438938000 Z\nupdated_at: 2017-03-08 02:14:03.130933000 Z\nshipping_address_id: \nbilling_address_id: 8\n	2017-03-08 02:17:37.867897
50	Payola::Sale	8	create	\N	\N	2017-03-08 02:20:09.205459
53	Order	7	update	\N	---\nshipped: new\nid: 7\nprice: !ruby/object:BigDecimal 36:0.628286000000000005498E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.38486000000000005498E1\nsubtotal: !ruby/object:BigDecimal 18:0.5498E2\nshipping: \nname: order-8a6f55c912\npermalink: 110313de15\ncreated_at: 2017-03-08 01:48:04.106748000 Z\nupdated_at: 2017-03-08 02:18:20.464456000 Z\nshipping_address_id: \nbilling_address_id: 7\n	2017-03-08 02:20:11.775548
49	Order	7	update	\N	---\nshipped: new\nid: 7\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-8a6f55c912\npermalink: 110313de15\ncreated_at: 2017-03-08 01:48:04.106748000 Z\nupdated_at: 2017-03-08 01:48:45.221730000 Z\nshipping_address_id: \nbilling_address_id: 7\n	2017-03-08 02:18:20.464456
54	Order	9	create	\N	\N	2017-03-08 03:27:17.474104
55	Order	9	update	\N	---\nshipped: new\nid: 9\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-a965c4cb98\npermalink: 403cc33486\ncreated_at: 2017-03-08 03:27:17.474104000 Z\nupdated_at: 2017-03-08 03:27:17.474104000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 03:27:44.168471
56	Payola::Sale	9	create	\N	\N	2017-03-08 03:28:41.632617
57	Payola::Sale	9	update	\N	---\nstate: pending\nid: 9\nemail: karla.pollowitz@metova.com\nguid: 5j7i79\nproduct_id: 9\nproduct_type: Order\ncreated_at: 2017-03-08 03:28:41.632617000 Z\nupdated_at: 2017-03-08 03:28:41.632617000 Z\nstripe_id: \nstripe_token: tok_19uvTeKyDViFGl997lH10oO2\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 03:28:41.73418
58	Payola::Sale	9	update	\N	---\nstate: processing\nid: 9\nemail: karla.pollowitz@metova.com\nguid: 5j7i79\nproduct_id: 9\nproduct_type: Order\ncreated_at: 2017-03-08 03:28:41.632617000 Z\nupdated_at: 2017-03-08 03:28:41.734180154 Z\nstripe_id: \nstripe_token: tok_19uvTeKyDViFGl997lH10oO2\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 03:28:43.315276
59	Order	9	update	\N	---\nshipped: new\nid: 9\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-a965c4cb98\npermalink: 403cc33486\ncreated_at: 2017-03-08 03:27:17.474104000 Z\nupdated_at: 2017-03-08 03:27:44.168471000 Z\nshipping_address_id: \nbilling_address_id: 9\n	2017-03-08 03:28:44.103499
60	Order	10	create	\N	\N	2017-03-08 03:37:39.796603
61	Order	10	update	\N	---\nshipped: new\nid: 10\nprice: !ruby/object:BigDecimal 54:0.894279000000000007797E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.54579000000000007797E1\nsubtotal: !ruby/object:BigDecimal 36:0.7797E2\nshipping: \nname: order-d2c5aacf1d\npermalink: 3903ee3254\ncreated_at: 2017-03-08 03:37:39.796603000 Z\nupdated_at: 2017-03-08 03:37:39.796603000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 03:37:59.226544
62	Payola::Sale	10	create	\N	\N	2017-03-08 03:38:29.808985
63	Payola::Sale	10	update	\N	---\nstate: pending\nid: 10\nemail: karla.pollowitz@metova.com\nguid: quutf8\nproduct_id: 10\nproduct_type: Order\ncreated_at: 2017-03-08 03:38:29.808985000 Z\nupdated_at: 2017-03-08 03:38:29.808985000 Z\nstripe_id: \nstripe_token: tok_19uvd8KyDViFGl995BAnRz2A\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 8942\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 03:38:29.837228
64	Payola::Sale	10	update	\N	---\nstate: processing\nid: 10\nemail: karla.pollowitz@metova.com\nguid: quutf8\nproduct_id: 10\nproduct_type: Order\ncreated_at: 2017-03-08 03:38:29.808985000 Z\nupdated_at: 2017-03-08 03:38:29.837228312 Z\nstripe_id: \nstripe_token: tok_19uvd8KyDViFGl995BAnRz2A\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 8942\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 03:38:31.458495
65	Order	10	update	\N	---\nshipped: new\nid: 10\nprice: !ruby/object:BigDecimal 54:0.894279000000000007797E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.54579000000000007797E1\nsubtotal: !ruby/object:BigDecimal 36:0.7797E2\nshipping: \nname: order-d2c5aacf1d\npermalink: 3903ee3254\ncreated_at: 2017-03-08 03:37:39.796603000 Z\nupdated_at: 2017-03-08 03:37:59.226544000 Z\nshipping_address_id: \nbilling_address_id: 10\n	2017-03-08 03:38:32.030681
67	Order	11	update	\N	---\nshipped: new\nid: 11\nprice: !ruby/object:BigDecimal 36:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: \nname: order-464a6d532c\npermalink: d2912a0ab8\ncreated_at: 2017-03-08 14:42:10.795100000 Z\nupdated_at: 2017-03-08 14:42:10.795100000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 14:46:28.746585
68	Order	12	create	\N	\N	2017-03-08 14:59:29.305487
69	Order	13	create	\N	\N	2017-03-08 17:54:12.904947
70	Order	13	update	\N	---\nshipped: new\nid: 13\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-0bbe3a34be\npermalink: 0db8ad2e6b\ncreated_at: 2017-03-08 17:54:12.904947000 Z\nupdated_at: 2017-03-08 17:54:12.904947000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 17:54:27.238231
71	Payola::Sale	11	create	\N	\N	2017-03-08 17:56:46.721966
72	Payola::Sale	11	update	\N	---\nstate: pending\nid: 11\nemail: pete.dunlap@metova.com\nguid: eog6lp\nproduct_id: 13\nproduct_type: Order\ncreated_at: 2017-03-08 17:56:46.721966000 Z\nupdated_at: 2017-03-08 17:56:46.721966000 Z\nstripe_id: \nstripe_token: tok_19v91jKyDViFGl996y0M7VVI\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 17:56:46.889487
73	Payola::Sale	11	update	\N	---\nstate: processing\nid: 11\nemail: pete.dunlap@metova.com\nguid: eog6lp\nproduct_id: 13\nproduct_type: Order\ncreated_at: 2017-03-08 17:56:46.721966000 Z\nupdated_at: 2017-03-08 17:56:46.889487823 Z\nstripe_id: \nstripe_token: tok_19v91jKyDViFGl996y0M7VVI\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 3515\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-08 17:56:48.813825
74	Order	13	update	\N	---\nshipped: new\nid: 13\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-0bbe3a34be\npermalink: 0db8ad2e6b\ncreated_at: 2017-03-08 17:54:12.904947000 Z\nupdated_at: 2017-03-08 17:54:27.238231000 Z\nshipping_address_id: \nbilling_address_id: 11\n	2017-03-08 17:56:49.883719
75	Order	14	create	\N	\N	2017-03-08 18:47:37.045964
76	Order	14	update	\N	---\nshipped: new\nid: 14\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-05620bf4df\npermalink: eabe3038a8\ncreated_at: 2017-03-08 18:47:37.045964000 Z\nupdated_at: 2017-03-08 18:47:37.045964000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 18:47:45.799708
78	Order	15	update	\N	---\nshipped: new\nid: 15\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-6463aff3df\npermalink: 11353d61f9\ncreated_at: 2017-03-08 19:08:36.029796000 Z\nupdated_at: 2017-03-08 19:08:36.029796000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-08 19:08:41.193216
79	Order	16	create	\N	\N	2017-03-10 07:59:38.426863
80	Order	17	create	\N	\N	2017-03-13 17:51:16.329523
81	Order	18	create	\N	\N	2017-03-15 14:13:12.899892
82	Order	19	create	\N	\N	2017-03-15 14:50:30.801161
83	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 45:0.276693000000000002399E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E2\nsubtotal: !ruby/object:BigDecimal 36:0.2399E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 14:50:30.801161000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-15 14:53:15.57061
84	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 45:0.979879000000000008597E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.60179000000000008597E2\nsubtotal: !ruby/object:BigDecimal 27:0.8597E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 14:53:15.570610000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-15 14:59:46.381333
85	Order	20	create	\N	\N	2017-03-15 16:25:34.385066
86	Order	20	update	\N	---\nshipped: new\nid: 20\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-44456e4d3d\npermalink: 0df065b49e\ncreated_at: 2017-03-15 16:25:34.385066000 Z\nupdated_at: 2017-03-15 16:25:34.385066000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-15 16:25:46.402387
87	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 36:0.979879000000000008597E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.60179000000000008597E2\nsubtotal: !ruby/object:BigDecimal 18:0.8597E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 14:59:46.381333000 Z\nshipping_address_id: \nbilling_address_id: 13\n	2017-03-15 18:42:35.668455
88	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 54:0.11556755000000000101465E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.710255000000000101465E2\nsubtotal: !ruby/object:BigDecimal 27:0.101465E4\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 18:42:35.668455000 Z\nshipping_address_id: \nbilling_address_id: 13\n	2017-03-15 18:42:48.886203
89	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 54:0.10150383000000000089069E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.623483000000000089069E2\nsubtotal: !ruby/object:BigDecimal 27:0.89069E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 18:42:48.886203000 Z\nshipping_address_id: \nbilling_address_id: 13\n	2017-03-15 18:43:09.442603
90	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 54:0.9447197000000000082871E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.580097000000000082871E2\nsubtotal: !ruby/object:BigDecimal 27:0.82871E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 18:43:09.442603000 Z\nshipping_address_id: \nbilling_address_id: 13\n	2017-03-15 18:43:18.137297
91	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 45:0.979879000000000008597E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.60179000000000008597E2\nsubtotal: !ruby/object:BigDecimal 27:0.8597E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 18:43:18.137297000 Z\nshipping_address_id: \nbilling_address_id: 13\n	2017-03-15 18:43:24.004662
92	Payola::Sale	12	create	\N	\N	2017-03-15 18:45:20.265679
931	Order	220	update	\N	---\nshipped: new\nid: 220\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-4abed92adc\npermalink: a283d31be3\ncreated_at: 2017-05-27 10:42:52.906026000 Z\nupdated_at: 2017-05-27 10:43:16.221707000 Z\nshipping_address_id: 199\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 10:43:39.248668
93	Payola::Sale	12	update	\N	---\nstate: pending\nid: 12\nemail: tylarborem@gmail.com\nguid: 99k18i\nproduct_id: 19\nproduct_type: Order\ncreated_at: 2017-03-15 18:45:20.265679000 Z\nupdated_at: 2017-03-15 18:45:20.265679000 Z\nstripe_id: \nstripe_token: tok_19xh7ZKyDViFGl991Z6jIh2G\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 94471\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-15 18:45:20.361546
94	Payola::Sale	12	update	\N	---\nstate: processing\nid: 12\nemail: tylarborem@gmail.com\nguid: 99k18i\nproduct_id: 19\nproduct_type: Order\ncreated_at: 2017-03-15 18:45:20.265679000 Z\nupdated_at: 2017-03-15 18:45:20.361546142 Z\nstripe_id: \nstripe_token: tok_19xh7ZKyDViFGl991Z6jIh2G\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 94471\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-15 18:45:23.406639
95	Order	19	update	\N	---\nshipped: new\nid: 19\nprice: !ruby/object:BigDecimal 54:0.9447197000000000082871E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.580097000000000082871E2\nsubtotal: !ruby/object:BigDecimal 27:0.82871E3\nshipping: \nname: order-086d998f14\npermalink: c2ab5ee39f\ncreated_at: 2017-03-15 14:50:30.801161000 Z\nupdated_at: 2017-03-15 18:43:24.004662000 Z\nshipping_address_id: \nbilling_address_id: 13\n	2017-03-15 18:45:24.229494
96	Order	21	create	\N	\N	2017-03-16 21:11:54.664058
97	Order	21	update	\N	---\nshipped: new\nid: 21\nprice: !ruby/object:BigDecimal 54:0.8086639000000000071277E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.498939000000000071277E2\nsubtotal: !ruby/object:BigDecimal 36:0.71277E3\nshipping: \nname: order-0181246ab3\npermalink: 58e965012d\ncreated_at: 2017-03-16 21:11:54.664058000 Z\nupdated_at: 2017-03-16 21:11:54.664058000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-16 21:12:23.752277
98	Order	21	update	\N	---\nshipped: new\nid: 21\nprice: !ruby/object:BigDecimal 45:0.1017329000000000008947E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.62629000000000008947E2\nsubtotal: !ruby/object:BigDecimal 27:0.8947E3\nshipping: \nname: order-0181246ab3\npermalink: 58e965012d\ncreated_at: 2017-03-16 21:11:54.664058000 Z\nupdated_at: 2017-03-16 21:12:23.752277000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-16 21:12:38.33594
99	Order	21	update	\N	---\nshipped: new\nid: 21\nprice: !ruby/object:BigDecimal 54:0.10769476000000000094668E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.662676000000000094668E2\nsubtotal: !ruby/object:BigDecimal 27:0.94668E3\nshipping: \nname: order-0181246ab3\npermalink: 58e965012d\ncreated_at: 2017-03-16 21:11:54.664058000 Z\nupdated_at: 2017-03-16 21:12:38.335940000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-16 21:12:56.658409
100	Order	21	update	\N	---\nshipped: new\nid: 21\nprice: !ruby/object:BigDecimal 54:0.11067569000000000097267E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.680869000000000097267E2\nsubtotal: !ruby/object:BigDecimal 27:0.97267E3\nshipping: \nname: order-0181246ab3\npermalink: 58e965012d\ncreated_at: 2017-03-16 21:11:54.664058000 Z\nupdated_at: 2017-03-16 21:12:56.658409000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-16 21:14:48.4593
101	Payola::Sale	13	create	\N	\N	2017-03-16 21:16:23.141247
102	Payola::Sale	13	update	\N	---\nstate: pending\nid: 13\nemail: tobykorrs@gmail.com\nguid: n7f48n\nproduct_id: 21\nproduct_type: Order\ncreated_at: 2017-03-16 21:16:23.141247000 Z\nupdated_at: 2017-03-16 21:16:23.141247000 Z\nstripe_id: \nstripe_token: tok_19y5xHKyDViFGl99904N8sqn\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 110675\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-16 21:16:23.165596
103	Payola::Sale	13	update	\N	---\nstate: processing\nid: 13\nemail: tobykorrs@gmail.com\nguid: n7f48n\nproduct_id: 21\nproduct_type: Order\ncreated_at: 2017-03-16 21:16:23.141247000 Z\nupdated_at: 2017-03-16 21:16:23.165596847 Z\nstripe_id: \nstripe_token: tok_19y5xHKyDViFGl99904N8sqn\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 110675\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-16 21:16:25.650213
104	Order	21	update	\N	---\nshipped: new\nid: 21\nprice: !ruby/object:BigDecimal 54:0.11067569000000000097267E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.680869000000000097267E2\nsubtotal: !ruby/object:BigDecimal 27:0.97267E3\nshipping: \nname: order-0181246ab3\npermalink: 58e965012d\ncreated_at: 2017-03-16 21:11:54.664058000 Z\nupdated_at: 2017-03-16 21:14:48.459300000 Z\nshipping_address_id: \nbilling_address_id: 15\n	2017-03-16 21:16:27.034725
105	Order	22	create	\N	\N	2017-03-22 16:43:19.120435
106	Order	22	update	\N	---\nshipped: new\nid: 22\nprice: !ruby/object:BigDecimal 54:0.553386000000000004798E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.33586000000000004798E1\nsubtotal: !ruby/object:BigDecimal 36:0.4798E2\nshipping: \nname: order-1e58e55554\npermalink: 50d48b0ee4\ncreated_at: 2017-03-22 16:43:19.120435000 Z\nupdated_at: 2017-03-22 16:43:19.120435000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-22 16:43:42.089995
107	Order	22	update	\N	---\nshipped: new\nid: 22\nprice: !ruby/object:BigDecimal 54:0.904979000000000007897E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.55279000000000007897E1\nsubtotal: !ruby/object:BigDecimal 27:0.7897E2\nshipping: \nname: order-1e58e55554\npermalink: 50d48b0ee4\ncreated_at: 2017-03-22 16:43:19.120435000 Z\nupdated_at: 2017-03-22 16:43:42.089995000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-22 16:43:50.213949
108	Order	22	update	\N	---\nshipped: new\nid: 22\nprice: !ruby/object:BigDecimal 36:0.628286000000000005498E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.38486000000000005498E1\nsubtotal: !ruby/object:BigDecimal 18:0.5498E2\nshipping: \nname: order-1e58e55554\npermalink: 50d48b0ee4\ncreated_at: 2017-03-22 16:43:19.120435000 Z\nupdated_at: 2017-03-22 16:43:50.213949000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-22 16:44:03.993395
109	Order	22	update	\N	---\nshipped: new\nid: 22\nprice: !ruby/object:BigDecimal 54:0.553386000000000004798E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.33586000000000004798E1\nsubtotal: !ruby/object:BigDecimal 36:0.4798E2\nshipping: \nname: order-1e58e55554\npermalink: 50d48b0ee4\ncreated_at: 2017-03-22 16:43:19.120435000 Z\nupdated_at: 2017-03-22 16:44:03.993395000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-22 16:44:38.737385
110	Order	22	update	\N	---\nshipped: new\nid: 22\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-1e58e55554\npermalink: 50d48b0ee4\ncreated_at: 2017-03-22 16:43:19.120435000 Z\nupdated_at: 2017-03-22 16:44:38.737385000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-22 17:02:12.148905
111	Payola::Sale	14	create	\N	\N	2017-03-22 17:02:51.184827
160	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 54:0.22356975000000000194925E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.1364475000000000194925E3\nsubtotal: !ruby/object:BigDecimal 36:0.194925E4\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 15:21:03.175770000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-24 15:21:08.441706
933	Order	222	create	\N	\N	2017-05-27 13:43:23.683627
112	Payola::Sale	14	update	\N	---\nstate: pending\nid: 14\nemail: tarrygriswold@gmail.com\nguid: 2k091b\nproduct_id: 22\nproduct_type: Order\ncreated_at: 2017-03-22 17:02:51.184827000 Z\nupdated_at: 2017-03-22 17:02:51.184827000 Z\nstripe_id: \nstripe_token: tok_1A0CrDKyDViFGl99TszWJvl9\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 2766\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-22 17:02:51.281875
113	Payola::Sale	14	update	\N	---\nstate: processing\nid: 14\nemail: tarrygriswold@gmail.com\nguid: 2k091b\nproduct_id: 22\nproduct_type: Order\ncreated_at: 2017-03-22 17:02:51.184827000 Z\nupdated_at: 2017-03-22 17:02:51.281875249 Z\nstripe_id: \nstripe_token: tok_1A0CrDKyDViFGl99TszWJvl9\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 2766\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-22 17:02:54.344201
114	Order	22	update	\N	---\nshipped: new\nid: 22\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-1e58e55554\npermalink: 50d48b0ee4\ncreated_at: 2017-03-22 16:43:19.120435000 Z\nupdated_at: 2017-03-22 17:02:12.148905000 Z\nshipping_address_id: \nbilling_address_id: 16\n	2017-03-22 17:02:55.392827
115	Order	23	create	\N	\N	2017-03-22 17:05:26.895247
116	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-22 17:05:26.895247000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-22 17:06:24.277825
117	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-22 17:06:24.277825000 Z\nshipping_address_id: \nbilling_address_id: 17\n	2017-03-23 02:35:51.76969
118	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 45:0.649686000000000005698E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.39886000000000005698E2\nsubtotal: !ruby/object:BigDecimal 27:0.5698E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-23 02:35:51.769690000 Z\nshipping_address_id: \nbilling_address_id: 17\n	2017-03-23 02:36:04.402554
119	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 36:0.7093046000000000062178E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.435246000000000062178E2\nsubtotal: !ruby/object:BigDecimal 18:0.62178E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-23 02:36:04.402554000 Z\nshipping_address_id: \nbilling_address_id: 17\n	2017-03-23 02:36:17.984851
120	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-23 02:36:17.984851000 Z\nshipping_address_id: \nbilling_address_id: 17\n	2017-03-23 02:36:21.67626
121	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 54:0.2682837000000000023391E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.163737000000000023391E2\nsubtotal: !ruby/object:BigDecimal 36:0.23391E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-23 02:36:21.676260000 Z\nshipping_address_id: \nbilling_address_id: 17\n	2017-03-23 02:36:31.114556
122	Payola::Sale	15	create	\N	\N	2017-03-23 02:38:10.117865
123	Payola::Sale	15	update	\N	---\nstate: pending\nid: 15\nemail: naylowilde@gmail.com\nguid: n72l1p\nproduct_id: 23\nproduct_type: Order\ncreated_at: 2017-03-23 02:38:10.117865000 Z\nupdated_at: 2017-03-23 02:38:10.117865000 Z\nstripe_id: \nstripe_token: tok_1A0LpyKyDViFGl991EaUYB2J\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 29809\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 02:38:10.138832
126	Order	24	create	\N	\N	2017-03-23 02:39:52.096914
132	Order	25	create	\N	\N	2017-03-23 16:27:00.476084
124	Payola::Sale	15	update	\N	---\nstate: processing\nid: 15\nemail: naylowilde@gmail.com\nguid: n72l1p\nproduct_id: 23\nproduct_type: Order\ncreated_at: 2017-03-23 02:38:10.117865000 Z\nupdated_at: 2017-03-23 02:38:10.138832398 Z\nstripe_id: \nstripe_token: tok_1A0LpyKyDViFGl991EaUYB2J\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 29809\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 02:38:12.773317
129	Payola::Sale	16	update	\N	---\nstate: pending\nid: 16\nemail: naylowilde@gmail.com\nguid: 4a5n76\nproduct_id: 24\nproduct_type: Order\ncreated_at: 2017-03-23 02:41:00.413645000 Z\nupdated_at: 2017-03-23 02:41:00.413645000 Z\nstripe_id: \nstripe_token: tok_1A0LsiKyDViFGl99KIpSFk1D\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 35159\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 02:41:00.444706
130	Payola::Sale	16	update	\N	---\nstate: processing\nid: 16\nemail: naylowilde@gmail.com\nguid: 4a5n76\nproduct_id: 24\nproduct_type: Order\ncreated_at: 2017-03-23 02:41:00.413645000 Z\nupdated_at: 2017-03-23 02:41:00.444706092 Z\nstripe_id: \nstripe_token: tok_1A0LsiKyDViFGl99KIpSFk1D\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 35159\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 02:41:02.886965
135	Payola::Sale	17	update	\N	---\nstate: pending\nid: 17\nemail: asamyounge@gmail.com\nguid: 3k1gbf\nproduct_id: 25\nproduct_type: Order\ncreated_at: 2017-03-23 16:31:15.409593000 Z\nupdated_at: 2017-03-23 16:31:15.409593000 Z\nstripe_id: \nstripe_token: tok_1A0YqCKyDViFGl994loYKKaB\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 35159\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 16:31:15.429076
136	Payola::Sale	17	update	\N	---\nstate: processing\nid: 17\nemail: asamyounge@gmail.com\nguid: 3k1gbf\nproduct_id: 25\nproduct_type: Order\ncreated_at: 2017-03-23 16:31:15.409593000 Z\nupdated_at: 2017-03-23 16:31:15.429076684 Z\nstripe_id: \nstripe_token: tok_1A0YqCKyDViFGl994loYKKaB\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 35159\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 16:31:18.264045
399	Order	75	create	\N	\N	2017-05-09 17:04:27.83076
145	Payola::Sale	18	update	\N	---\nstate: pending\nid: 18\nemail: asamyounge@gmail.com\nguid: 5gs0ba\nproduct_id: 26\nproduct_type: Order\ncreated_at: 2017-03-23 16:34:11.782707000 Z\nupdated_at: 2017-03-23 16:34:11.782707000 Z\nstripe_id: \nstripe_token: tok_1A0Yt2KyDViFGl99yKIRmTnO\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 33631\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 16:34:11.800891
146	Payola::Sale	18	update	\N	---\nstate: processing\nid: 18\nemail: asamyounge@gmail.com\nguid: 5gs0ba\nproduct_id: 26\nproduct_type: Order\ncreated_at: 2017-03-23 16:34:11.782707000 Z\nupdated_at: 2017-03-23 16:34:11.800891630 Z\nstripe_id: \nstripe_token: tok_1A0Yt2KyDViFGl99yKIRmTnO\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 33631\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 16:34:14.573403
153	Payola::Sale	19	update	\N	---\nstate: pending\nid: 19\nemail: kenedonwilde@gmail.com\nguid: 1u3ojf\nproduct_id: 27\nproduct_type: Order\ncreated_at: 2017-03-23 16:55:59.804731000 Z\nupdated_at: 2017-03-23 16:55:59.804731000 Z\nstripe_id: \nstripe_token: tok_1A0ZE8KyDViFGl99ZDkqfcDj\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 46318\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 16:55:59.822872
154	Payola::Sale	19	update	\N	---\nstate: processing\nid: 19\nemail: kenedonwilde@gmail.com\nguid: 1u3ojf\nproduct_id: 27\nproduct_type: Order\ncreated_at: 2017-03-23 16:55:59.804731000 Z\nupdated_at: 2017-03-23 16:55:59.822872265 Z\nstripe_id: \nstripe_token: tok_1A0ZE8KyDViFGl99ZDkqfcDj\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 46318\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-23 16:56:02.475575
125	Order	23	update	\N	---\nshipped: new\nid: 23\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-274a527903\npermalink: 21992a420e\ncreated_at: 2017-03-22 17:05:26.895247000 Z\nupdated_at: 2017-03-23 02:36:31.114556000 Z\nshipping_address_id: \nbilling_address_id: 17\n	2017-03-23 02:38:14.19988
127	Order	24	update	\N	---\nshipped: new\nid: 24\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-54eb2bbeab\npermalink: fb85b78d52\ncreated_at: 2017-03-23 02:39:52.096914000 Z\nupdated_at: 2017-03-23 02:39:52.096914000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 02:40:26.566135
128	Payola::Sale	16	create	\N	\N	2017-03-23 02:41:00.413645
131	Order	24	update	\N	---\nshipped: new\nid: 24\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-54eb2bbeab\npermalink: fb85b78d52\ncreated_at: 2017-03-23 02:39:52.096914000 Z\nupdated_at: 2017-03-23 02:40:26.566135000 Z\nshipping_address_id: \nbilling_address_id: 18\n	2017-03-23 02:41:03.228052
139	Order	26	update	\N	---\nshipped: new\nid: 26\nprice: !ruby/object:BigDecimal 54:0.3320316000000000028788E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.201516000000000028788E2\nsubtotal: !ruby/object:BigDecimal 36:0.28788E3\nshipping: \nname: order-34e0da3705\npermalink: e7055bbaca\ncreated_at: 2017-03-23 16:32:06.010817000 Z\nupdated_at: 2017-03-23 16:32:06.010817000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:32:26.102775
140	Order	26	update	\N	---\nshipped: new\nid: 26\nprice: !ruby/object:BigDecimal 54:0.4810781000000000041783E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.292481000000000041783E2\nsubtotal: !ruby/object:BigDecimal 27:0.41783E3\nshipping: \nname: order-34e0da3705\npermalink: e7055bbaca\ncreated_at: 2017-03-23 16:32:06.010817000 Z\nupdated_at: 2017-03-23 16:32:26.102775000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:32:34.748097
142	Order	26	update	\N	---\nshipped: new\nid: 26\nprice: !ruby/object:BigDecimal 54:0.3661209000000000031787E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.222509000000000031787E2\nsubtotal: !ruby/object:BigDecimal 27:0.31787E3\nshipping: \nname: order-34e0da3705\npermalink: e7055bbaca\ncreated_at: 2017-03-23 16:32:06.010817000 Z\nupdated_at: 2017-03-23 16:32:43.306972000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:32:48.948235
143	Order	26	update	\N	---\nshipped: new\nid: 26\nprice: !ruby/object:BigDecimal 54:0.3363116000000000029188E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.204316000000000029188E2\nsubtotal: !ruby/object:BigDecimal 27:0.29188E3\nshipping: \nname: order-34e0da3705\npermalink: e7055bbaca\ncreated_at: 2017-03-23 16:32:06.010817000 Z\nupdated_at: 2017-03-23 16:32:48.948235000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:33:34.830309
144	Payola::Sale	18	create	\N	\N	2017-03-23 16:34:11.782707
147	Order	26	update	\N	---\nshipped: new\nid: 26\nprice: !ruby/object:BigDecimal 54:0.3363116000000000029188E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.204316000000000029188E2\nsubtotal: !ruby/object:BigDecimal 27:0.29188E3\nshipping: \nname: order-34e0da3705\npermalink: e7055bbaca\ncreated_at: 2017-03-23 16:32:06.010817000 Z\nupdated_at: 2017-03-23 16:33:34.830309000 Z\nshipping_address_id: \nbilling_address_id: 20\n	2017-03-23 16:34:15.509265
150	Order	27	update	\N	---\nshipped: new\nid: 27\nprice: !ruby/object:BigDecimal 54:0.1490465000000000012995E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.90965000000000012995E1\nsubtotal: !ruby/object:BigDecimal 36:0.12995E3\nshipping: \nname: order-93e81cdfef\npermalink: ce50705f70\ncreated_at: 2017-03-23 16:49:03.730410000 Z\nupdated_at: 2017-03-23 16:49:03.730410000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:49:04.753819
151	Order	27	update	\N	---\nshipped: new\nid: 27\nprice: !ruby/object:BigDecimal 36:0.287393000000000002499E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.17493000000000002499E2\nsubtotal: !ruby/object:BigDecimal 18:0.2499E3\nshipping: \nname: order-93e81cdfef\npermalink: ce50705f70\ncreated_at: 2017-03-23 16:49:03.730410000 Z\nupdated_at: 2017-03-23 16:49:04.753819000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:49:57.609577
156	Order	28	create	\N	\N	2017-03-24 14:45:28.803795
157	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 54:0.276693000000000002399E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 14:45:28.803795000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-24 15:20:43.037491
158	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 36:0.7729018000000000067374E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.471618000000000067374E2\nsubtotal: !ruby/object:BigDecimal 18:0.67374E3\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 15:20:43.037491000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-24 15:20:57.643912
161	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 45:0.2086651000000000018193E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.127351000000000018193E3\nsubtotal: !ruby/object:BigDecimal 36:0.18193E4\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 15:21:08.441706000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-24 15:21:12.712352
133	Order	25	update	\N	---\nshipped: new\nid: 25\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-d321aa4c12\npermalink: db885c80dc\ncreated_at: 2017-03-23 16:27:00.476084000 Z\nupdated_at: 2017-03-23 16:27:00.476084000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:29:14.177748
134	Payola::Sale	17	create	\N	\N	2017-03-23 16:31:15.409593
137	Order	25	update	\N	---\nshipped: new\nid: 25\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-d321aa4c12\npermalink: db885c80dc\ncreated_at: 2017-03-23 16:27:00.476084000 Z\nupdated_at: 2017-03-23 16:29:14.177748000 Z\nshipping_address_id: \nbilling_address_id: 19\n	2017-03-23 16:31:18.987118
138	Order	26	create	\N	\N	2017-03-23 16:32:06.010817
141	Order	26	update	\N	---\nshipped: new\nid: 26\nprice: !ruby/object:BigDecimal 54:0.4214595000000000036585E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.256095000000000036585E2\nsubtotal: !ruby/object:BigDecimal 27:0.36585E3\nshipping: \nname: order-34e0da3705\npermalink: e7055bbaca\ncreated_at: 2017-03-23 16:32:06.010817000 Z\nupdated_at: 2017-03-23 16:32:34.748097000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:32:43.306972
148	Order	27	create	\N	\N	2017-03-23 16:49:03.73041
149	Order	27	update	\N	---\nshipped: new\nid: 27\nprice: !ruby/object:BigDecimal 54:0.1490465000000000012995E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.90965000000000012995E1\nsubtotal: !ruby/object:BigDecimal 36:0.12995E3\nshipping: \nname: order-93e81cdfef\npermalink: ce50705f70\ncreated_at: 2017-03-23 16:49:03.730410000 Z\nupdated_at: 2017-03-23 16:49:03.730410000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-23 16:49:04.477665
152	Payola::Sale	19	create	\N	\N	2017-03-23 16:55:59.804731
155	Order	27	update	\N	---\nshipped: new\nid: 27\nprice: !ruby/object:BigDecimal 54:0.4631895000000000040485E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.283395000000000040485E2\nsubtotal: !ruby/object:BigDecimal 27:0.40485E3\nshipping: \nname: order-93e81cdfef\npermalink: ce50705f70\ncreated_at: 2017-03-23 16:49:03.730410000 Z\nupdated_at: 2017-03-23 16:49:57.609577000 Z\nshipping_address_id: \nbilling_address_id: 21\n	2017-03-23 16:56:03.428946
159	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 45:0.1490465000000000012995E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.90965000000000012995E2\nsubtotal: !ruby/object:BigDecimal 36:0.12995E4\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 15:20:57.643912000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-24 15:21:03.17577
162	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 54:0.19376045000000000168935E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.1182545000000000168935E3\nsubtotal: !ruby/object:BigDecimal 36:0.168935E4\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 15:21:12.712352000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-24 15:22:23.642466
163	Payola::Sale	20	create	\N	\N	2017-03-24 15:23:04.036179
164	Payola::Sale	20	update	\N	---\nstate: pending\nid: 20\nemail: tylarborem@gmail.com\nguid: k5d8qt\nproduct_id: 28\nproduct_type: Order\ncreated_at: 2017-03-24 15:23:04.036179000 Z\nupdated_at: 2017-03-24 15:23:04.036179000 Z\nstripe_id: \nstripe_token: tok_1A0uFkKyDViFGl990L4xTMhS\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 193760\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-24 15:23:04.056311
165	Payola::Sale	20	update	\N	---\nstate: processing\nid: 20\nemail: tylarborem@gmail.com\nguid: k5d8qt\nproduct_id: 28\nproduct_type: Order\ncreated_at: 2017-03-24 15:23:04.036179000 Z\nupdated_at: 2017-03-24 15:23:04.056311989 Z\nstripe_id: \nstripe_token: tok_1A0uFkKyDViFGl990L4xTMhS\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 193760\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-24 15:23:06.822972
166	Order	28	update	\N	---\nshipped: new\nid: 28\nprice: !ruby/object:BigDecimal 54:0.19376045000000000168935E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.1182545000000000168935E3\nsubtotal: !ruby/object:BigDecimal 36:0.168935E4\nshipping: \nname: order-1abc02970a\npermalink: 1832ad307a\ncreated_at: 2017-03-24 14:45:28.803795000 Z\nupdated_at: 2017-03-24 15:22:23.642466000 Z\nshipping_address_id: \nbilling_address_id: 22\n	2017-03-24 15:23:07.642506
167	Order	29	create	\N	\N	2017-03-27 17:50:25.171149
168	Order	30	create	\N	\N	2017-03-27 22:10:46.714148
169	Order	30	update	\N	---\nshipped: new\nid: 30\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-d25cec1c4d\npermalink: b52c8d1666\ncreated_at: 2017-03-27 22:10:46.714148000 Z\nupdated_at: 2017-03-27 22:10:46.714148000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-27 22:10:54.895575
170	Order	31	create	\N	\N	2017-03-28 10:41:15.524599
171	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 45:0.351593000000000003099E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E2\nsubtotal: !ruby/object:BigDecimal 36:0.3099E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:41:15.524599000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:41:27.572082
172	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 54:0.3164337000000000027891E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.195237000000000027891E2\nsubtotal: !ruby/object:BigDecimal 36:0.27891E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:41:27.572082000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:41:39.996173
173	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 45:0.344103000000000003029E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21203000000000003029E2\nsubtotal: !ruby/object:BigDecimal 27:0.3029E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:41:39.996173000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:41:52.848887
174	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 54:0.3717723000000000032689E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.228823000000000032689E2\nsubtotal: !ruby/object:BigDecimal 27:0.32689E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:41:52.848887000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:41:54.248106
175	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 45:0.336613000000000002959E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.20713000000000002959E2\nsubtotal: !ruby/object:BigDecimal 27:0.2959E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:41:54.248106000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:42:02.725162
176	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 54:0.3642823000000000031989E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.223923000000000031989E2\nsubtotal: !ruby/object:BigDecimal 27:0.31989E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:42:02.725162000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:42:15.921994
181	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 45:0.336613000000000002959E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.20713000000000002959E2\nsubtotal: !ruby/object:BigDecimal 27:0.2959E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:43:35.802278000 Z\nshipping_address_id: \nbilling_address_id: 23\n	2017-03-28 10:44:35.293225
183	Order	32	update	\N	---\nshipped: new\nid: 32\nprice: !ruby/object:BigDecimal 54:0.703186000000000006198E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \nname: order-69002a3a08\npermalink: 721d193f96\ncreated_at: 2017-03-28 19:26:15.594418000 Z\nupdated_at: 2017-03-28 19:26:15.594418000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 19:26:36.858309
189	Order	33	create	\N	\N	2017-03-29 16:26:38.189958
190	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 54:0.1054779000000000009297E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.65079000000000009297E1\nsubtotal: !ruby/object:BigDecimal 36:0.9297E2\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:26:38.189958000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-29 16:26:46.574991
192	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 36:0.979879000000000008597E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.60179000000000008597E1\nsubtotal: !ruby/object:BigDecimal 18:0.8597E2\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:26:59.205173000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-29 16:27:22.6185
194	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 36:0.1884858000000000016494E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.115458000000000016494E2\nsubtotal: !ruby/object:BigDecimal 18:0.16494E3\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:27:39.523049000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-29 16:28:04.240432
195	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 36:0.1949058000000000017094E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.119658000000000017094E2\nsubtotal: !ruby/object:BigDecimal 18:0.17094E3\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:28:04.240432000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-29 16:29:17.458605
199	Payola::Sale	23	create	\N	\N	2017-03-29 16:37:11.376822
203	Order	34	create	\N	\N	2017-03-30 15:22:43.732709
204	Order	35	create	\N	\N	2017-04-03 16:04:35.215847
206	Order	35	update	\N	---\nshipped: new\nid: 35\nprice: !ruby/object:BigDecimal 45:0.649686000000000005698E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.39886000000000005698E2\nsubtotal: !ruby/object:BigDecimal 27:0.5698E3\nshipping: \nname: order-d1e0eaaab9\npermalink: 859fcf5440\ncreated_at: 2017-04-03 16:04:35.215847000 Z\nupdated_at: 2017-04-03 16:04:35.784495000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-03 16:04:36.677703
210	Payola::Sale	24	create	\N	\N	2017-04-03 16:06:49.825168
215	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:05.229157000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:34:15.439333
216	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 45:0.649686000000000005698E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.39886000000000005698E2\nsubtotal: !ruby/object:BigDecimal 27:0.5698E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:15.439333000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:34:29.385434
217	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 45:0.926379000000000008097E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.56679000000000008097E2\nsubtotal: !ruby/object:BigDecimal 27:0.8097E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:29.385434000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:34:46.428655
218	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.9817176000000000085768E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.600376000000000085768E2\nsubtotal: !ruby/object:BigDecimal 27:0.85768E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:46.428655000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:34:51.594952
220	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.11116548000000000097164E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.680148000000000097164E2\nsubtotal: !ruby/object:BigDecimal 27:0.97164E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:54.598186000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:34:59.963888
221	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.11414641000000000099763E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.698341000000000099763E2\nsubtotal: !ruby/object:BigDecimal 27:0.99763E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:59.963888000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:35:03.856311
177	Order	31	update	\N	---\nshipped: new\nid: 31\nprice: !ruby/object:BigDecimal 45:0.336613000000000002959E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.20713000000000002959E2\nsubtotal: !ruby/object:BigDecimal 27:0.2959E3\nshipping: \nname: order-7838f18685\npermalink: 2167c282e5\ncreated_at: 2017-03-28 10:41:15.524599000 Z\nupdated_at: 2017-03-28 10:42:15.921994000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 10:43:35.802278
178	Payola::Sale	21	create	\N	\N	2017-03-28 10:44:31.587222
182	Order	32	create	\N	\N	2017-03-28 19:26:15.594418
184	Order	32	update	\N	---\nshipped: new\nid: 32\nprice: !ruby/object:BigDecimal 36:0.1299372000000000011396E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.79772000000000011396E1\nsubtotal: !ruby/object:BigDecimal 18:0.11396E3\nshipping: \nname: order-69002a3a08\npermalink: 721d193f96\ncreated_at: 2017-03-28 19:26:15.594418000 Z\nupdated_at: 2017-03-28 19:26:36.858309000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-28 19:27:48.053219
185	Payola::Sale	22	create	\N	\N	2017-03-28 19:28:22.508906
188	Order	32	update	\N	---\nshipped: new\nid: 32\nprice: !ruby/object:BigDecimal 54:0.596186000000000005198E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.36386000000000005198E1\nsubtotal: !ruby/object:BigDecimal 36:0.5198E2\nshipping: \nname: order-69002a3a08\npermalink: 721d193f96\ncreated_at: 2017-03-28 19:26:15.594418000 Z\nupdated_at: 2017-03-28 19:27:48.053219000 Z\nshipping_address_id: \nbilling_address_id: 24\n	2017-03-28 19:28:26.004979
191	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 54:0.703186000000000006198E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:26:46.574991000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-29 16:26:59.205173
193	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 54:0.830079000000000007197E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.50379000000000007197E1\nsubtotal: !ruby/object:BigDecimal 36:0.7197E2\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:27:22.618500000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-03-29 16:27:39.523049
196	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 36:0.894279000000000007797E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.54579000000000007797E1\nsubtotal: !ruby/object:BigDecimal 18:0.7797E2\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:29:17.458605000 Z\nshipping_address_id: \nbilling_address_id: 25\n	2017-03-29 16:35:44.840246
197	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:35:44.840246000 Z\nshipping_address_id: \nbilling_address_id: 25\n	2017-03-29 16:36:06.921887
198	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 45:0.649686000000000005698E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.39886000000000005698E2\nsubtotal: !ruby/object:BigDecimal 27:0.5698E3\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:36:06.921887000 Z\nshipping_address_id: \nbilling_address_id: 25\n	2017-03-29 16:36:17.847789
202	Order	33	update	\N	---\nshipped: new\nid: 33\nprice: !ruby/object:BigDecimal 45:0.926379000000000008097E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.56679000000000008097E2\nsubtotal: !ruby/object:BigDecimal 27:0.8097E3\nshipping: \nname: order-1a6e50b2e8\npermalink: f93c3ff6f5\ncreated_at: 2017-03-29 16:26:38.189958000 Z\nupdated_at: 2017-03-29 16:36:17.847789000 Z\nshipping_address_id: \nbilling_address_id: 25\n	2017-03-29 16:37:14.635818
205	Order	35	update	\N	---\nshipped: new\nid: 35\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-d1e0eaaab9\npermalink: 859fcf5440\ncreated_at: 2017-04-03 16:04:35.215847000 Z\nupdated_at: 2017-04-03 16:04:35.215847000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-03 16:04:35.784495
207	Order	35	update	\N	---\nshipped: new\nid: 35\nprice: !ruby/object:BigDecimal 45:0.926379000000000008097E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.56679000000000008097E2\nsubtotal: !ruby/object:BigDecimal 27:0.8097E3\nshipping: \nname: order-d1e0eaaab9\npermalink: 859fcf5440\ncreated_at: 2017-04-03 16:04:35.215847000 Z\nupdated_at: 2017-04-03 16:04:36.677703000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-03 16:04:57.933444
208	Order	35	update	\N	---\nshipped: new\nid: 35\nprice: !ruby/object:BigDecimal 54:0.7880325000000000068975E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.482825000000000068975E2\nsubtotal: !ruby/object:BigDecimal 27:0.68975E3\nshipping: \nname: order-d1e0eaaab9\npermalink: 859fcf5440\ncreated_at: 2017-04-03 16:04:35.215847000 Z\nupdated_at: 2017-04-03 16:04:57.933444000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-03 16:05:02.765918
209	Order	35	update	\N	---\nshipped: new\nid: 35\nprice: !ruby/object:BigDecimal 45:0.612236000000000005348E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.37436000000000005348E2\nsubtotal: !ruby/object:BigDecimal 27:0.5348E3\nshipping: \nname: order-d1e0eaaab9\npermalink: 859fcf5440\ncreated_at: 2017-04-03 16:04:35.215847000 Z\nupdated_at: 2017-04-03 16:05:02.765918000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-03 16:05:59.028887
213	Order	35	update	\N	---\nshipped: new\nid: 35\nprice: !ruby/object:BigDecimal 45:0.612236000000000005348E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.37436000000000005348E2\nsubtotal: !ruby/object:BigDecimal 27:0.5348E3\nshipping: \nname: order-d1e0eaaab9\npermalink: 859fcf5440\ncreated_at: 2017-04-03 16:04:35.215847000 Z\nupdated_at: 2017-04-03 16:05:59.028887000 Z\nshipping_address_id: \nbilling_address_id: 26\n	2017-04-03 16:06:53.499007
214	Order	36	create	\N	\N	2017-04-04 14:34:05.229157
219	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.10520362000000000091966E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.643762000000000091966E2\nsubtotal: !ruby/object:BigDecimal 27:0.91966E3\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:34:51.594952000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:34:54.598186
179	Payola::Sale	21	update	\N	---\nstate: pending\nid: 21\nemail: naylowilde@gmail.com\nguid: fl09ki\nproduct_id: 31\nproduct_type: Order\ncreated_at: 2017-03-28 10:44:31.587222000 Z\nupdated_at: 2017-03-28 10:44:31.587222000 Z\nstripe_id: \nstripe_token: tok_1A2HoOKyDViFGl99IQ7TivY1\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 33661\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-28 10:44:31.607604
180	Payola::Sale	21	update	\N	---\nstate: processing\nid: 21\nemail: naylowilde@gmail.com\nguid: fl09ki\nproduct_id: 31\nproduct_type: Order\ncreated_at: 2017-03-28 10:44:31.587222000 Z\nupdated_at: 2017-03-28 10:44:31.607604254 Z\nstripe_id: \nstripe_token: tok_1A2HoOKyDViFGl99IQ7TivY1\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 33661\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-28 10:44:34.260954
934	Order	222	update	\N	---\nshipped: new\nid: 222\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-59aaa612d9\npermalink: 92a5120840\ncreated_at: 2017-05-27 13:43:23.683627000 Z\nupdated_at: 2017-05-27 13:43:23.683627000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 13:44:00.338477
186	Payola::Sale	22	update	\N	---\nstate: pending\nid: 22\nemail: naylowilde@gmail.com\nguid: tf7hvn\nproduct_id: 32\nproduct_type: Order\ncreated_at: 2017-03-28 19:28:22.508906000 Z\nupdated_at: 2017-03-28 19:28:22.508906000 Z\nstripe_id: \nstripe_token: tok_1A2PzLKyDViFGl99qnHMfU3z\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 5961\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-28 19:28:22.551491
187	Payola::Sale	22	update	\N	---\nstate: processing\nid: 22\nemail: naylowilde@gmail.com\nguid: tf7hvn\nproduct_id: 32\nproduct_type: Order\ncreated_at: 2017-03-28 19:28:22.508906000 Z\nupdated_at: 2017-03-28 19:28:22.551491364 Z\nstripe_id: \nstripe_token: tok_1A2PzLKyDViFGl99qnHMfU3z\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 5961\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-28 19:28:25.354993
200	Payola::Sale	23	update	\N	---\nstate: pending\nid: 23\nemail: deroywilde@gmail.com\nguid: 8cgdd8\nproduct_id: 33\nproduct_type: Order\ncreated_at: 2017-03-29 16:37:11.376822000 Z\nupdated_at: 2017-03-29 16:37:11.376822000 Z\nstripe_id: \nstripe_token: tok_1A2jnDKyDViFGl99fD7HGT2l\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 92637\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-29 16:37:11.397034
201	Payola::Sale	23	update	\N	---\nstate: processing\nid: 23\nemail: deroywilde@gmail.com\nguid: 8cgdd8\nproduct_id: 33\nproduct_type: Order\ncreated_at: 2017-03-29 16:37:11.376822000 Z\nupdated_at: 2017-03-29 16:37:11.397034327 Z\nstripe_id: \nstripe_token: tok_1A2jnDKyDViFGl99fD7HGT2l\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 92637\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-03-29 16:37:13.525466
211	Payola::Sale	24	update	\N	---\nstate: pending\nid: 24\nemail: zeusdelin@gmail.com\nguid: t39udt\nproduct_id: 35\nproduct_type: Order\ncreated_at: 2017-04-03 16:06:49.825168000 Z\nupdated_at: 2017-04-03 16:06:49.825168000 Z\nstripe_id: \nstripe_token: tok_1A4XhaKyDViFGl99pYY8djQJ\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 61223\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-03 16:06:49.84737
212	Payola::Sale	24	update	\N	---\nstate: processing\nid: 24\nemail: zeusdelin@gmail.com\nguid: t39udt\nproduct_id: 35\nproduct_type: Order\ncreated_at: 2017-04-03 16:06:49.825168000 Z\nupdated_at: 2017-04-03 16:06:49.847370572 Z\nstripe_id: \nstripe_token: tok_1A4XhaKyDViFGl99pYY8djQJ\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 61223\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-03 16:06:52.412988
222	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.11766234000000000102862E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.720034000000000102862E2\nsubtotal: !ruby/object:BigDecimal 27:0.102862E4\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:35:03.856311000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:35:08.339755
223	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.12042927000000000105261E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.736827000000000105261E2\nsubtotal: !ruby/object:BigDecimal 27:0.105261E4\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:35:08.339755000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:35:17.394885
224	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.12746113000000000111459E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.780213000000000111459E2\nsubtotal: !ruby/object:BigDecimal 27:0.111459E4\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:35:17.394885000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:36:25.802289
225	Payola::Sale	25	create	\N	\N	2017-04-04 14:37:25.093428
226	Payola::Sale	25	update	\N	---\nstate: pending\nid: 25\nemail: caesardelin@gmail.com\nguid: rio1ec\nproduct_id: 36\nproduct_type: Order\ncreated_at: 2017-04-04 14:37:25.093428000 Z\nupdated_at: 2017-04-04 14:37:25.093428000 Z\nstripe_id: \nstripe_token: tok_1A4smbKyDViFGl99btqsaFJS\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 127461\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-04 14:37:25.115942
227	Payola::Sale	25	update	\N	---\nstate: processing\nid: 25\nemail: caesardelin@gmail.com\nguid: rio1ec\nproduct_id: 36\nproduct_type: Order\ncreated_at: 2017-04-04 14:37:25.093428000 Z\nupdated_at: 2017-04-04 14:37:25.115942436 Z\nstripe_id: \nstripe_token: tok_1A4smbKyDViFGl99btqsaFJS\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 127461\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-04 14:37:27.811727
228	Order	36	update	\N	---\nshipped: new\nid: 36\nprice: !ruby/object:BigDecimal 54:0.12746113000000000111459E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.780213000000000111459E2\nsubtotal: !ruby/object:BigDecimal 27:0.111459E4\nshipping: \nname: order-aa3bcfb064\npermalink: ce03c8c175\ncreated_at: 2017-04-04 14:34:05.229157000 Z\nupdated_at: 2017-04-04 14:36:25.802289000 Z\nshipping_address_id: \nbilling_address_id: 27\n	2017-04-04 14:37:29.041028
229	Order	37	create	\N	\N	2017-04-04 14:50:45.765646
230	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 45:0.703186000000000006198E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E2\nsubtotal: !ruby/object:BigDecimal 36:0.6198E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:50:45.765646000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:50:55.957727
231	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 45:0.1054779000000000009297E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.65079000000000009297E2\nsubtotal: !ruby/object:BigDecimal 36:0.9297E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:50:55.957727000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:51:01.935876
234	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 45:0.1299372000000000011396E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.79772000000000011396E2\nsubtotal: !ruby/object:BigDecimal 27:0.11396E4\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:51:22.179910000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:51:32.334719
239	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 45:0.974529000000000008547E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.59829000000000008547E2\nsubtotal: !ruby/object:BigDecimal 27:0.8547E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:52:53.980927000 Z\nshipping_address_id: \nbilling_address_id: 28\n	2017-04-04 14:53:00.758738
240	Payola::Sale	26	create	\N	\N	2017-04-04 14:54:02.39373
243	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 54:0.10096883000000000088569E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.619983000000000088569E2\nsubtotal: !ruby/object:BigDecimal 27:0.88569E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:53:00.758738000 Z\nshipping_address_id: \nbilling_address_id: 28\n	2017-04-04 14:55:46.438025
244	Order	38	create	\N	\N	2017-04-04 20:32:04.415169
247	Order	39	update	\N	---\nshipped: new\nid: 39\nprice: !ruby/object:BigDecimal 54:0.3279023000000000028589E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.200123000000000028589E2\nsubtotal: !ruby/object:BigDecimal 36:0.28589E3\nshipping: \nname: order-413a2774bb\npermalink: ec56c72673\ncreated_at: 2017-04-04 22:47:51.890559000 Z\nupdated_at: 2017-04-04 22:47:58.477993000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 22:48:08.795887
249	Order	41	create	\N	\N	2017-04-05 18:24:18.251304
251	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:46:17.363446000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:46:30.047979
252	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 45:0.649686000000000005698E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.39886000000000005698E2\nsubtotal: !ruby/object:BigDecimal 27:0.5698E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:46:30.047979000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:46:41.044065
255	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 54:0.4631895000000000040485E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.283395000000000040485E2\nsubtotal: !ruby/object:BigDecimal 27:0.40485E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:47:05.616485000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:48:30.04919
256	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 45:0.612236000000000005348E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.37436000000000005348E2\nsubtotal: !ruby/object:BigDecimal 27:0.5348E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:48:30.049190000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:49:18.035719
262	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 54:0.7452325000000000064975E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.454825000000000064975E2\nsubtotal: !ruby/object:BigDecimal 36:0.64975E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:51:32.221176000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:51:40.256157
263	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 45:0.894279000000000007797E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.54579000000000007797E2\nsubtotal: !ruby/object:BigDecimal 36:0.7797E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:51:40.256157000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:51:48.721925
267	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 54:0.9538976000000000083168E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.582176000000000083168E2\nsubtotal: !ruby/object:BigDecimal 36:0.83168E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:52:06.661261000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:52:52.670249
272	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 54:0.9538976000000000083168E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.582176000000000083168E2\nsubtotal: !ruby/object:BigDecimal 36:0.83168E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:52:53.408351000 Z\nshipping_address_id: \nbilling_address_id: 31\n	2017-04-07 04:53:36.606181
273	Order	44	create	\N	\N	2017-04-07 15:12:43.506647
274	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 45:0.298093000000000002599E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E2\nsubtotal: !ruby/object:BigDecimal 36:0.2599E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:12:43.506647000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:12:43.950405
276	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 45:0.926379000000000008097E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.56679000000000008097E2\nsubtotal: !ruby/object:BigDecimal 27:0.8097E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:12:44.761745000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:13:00.084296
277	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 54:0.6879046000000000060178E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.421246000000000060178E2\nsubtotal: !ruby/object:BigDecimal 27:0.60178E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:13:00.084296000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:13:08.625682
278	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 45:0.926379000000000008097E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.56679000000000008097E2\nsubtotal: !ruby/object:BigDecimal 27:0.8097E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:13:08.625682000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:13:18.112269
232	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 54:0.8789825000000000077475E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.542325000000000077475E2\nsubtotal: !ruby/object:BigDecimal 36:0.77475E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:51:01.935876000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:51:13.430428
233	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 45:0.703186000000000006198E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E2\nsubtotal: !ruby/object:BigDecimal 36:0.6198E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:51:13.430428000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:51:22.17991
235	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 54:0.11503255000000000100965E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.706755000000000100965E2\nsubtotal: !ruby/object:BigDecimal 27:0.100965E4\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:51:32.334719000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:51:33.367282
236	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 45:0.974529000000000008547E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.59829000000000008547E2\nsubtotal: !ruby/object:BigDecimal 27:0.8547E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:51:33.367282000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:51:40.828173
237	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 54:0.10448476000000000091668E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.641676000000000091668E2\nsubtotal: !ruby/object:BigDecimal 27:0.91668E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:51:40.828173000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 14:52:30.699211
238	Order	37	update	\N	---\nshipped: new\nid: 37\nprice: !ruby/object:BigDecimal 54:0.10448476000000000091668E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.641676000000000091668E2\nsubtotal: !ruby/object:BigDecimal 27:0.91668E3\nshipping: \nname: order-cd5378e812\npermalink: 21b65103f8\ncreated_at: 2017-04-04 14:50:45.765646000 Z\nupdated_at: 2017-04-04 14:52:30.699211000 Z\nshipping_address_id: \nbilling_address_id: 28\n	2017-04-04 14:52:53.980927
245	Order	39	create	\N	\N	2017-04-04 22:47:51.890559
246	Order	39	update	\N	---\nshipped: new\nid: 39\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-413a2774bb\npermalink: ec56c72673\ncreated_at: 2017-04-04 22:47:51.890559000 Z\nupdated_at: 2017-04-04 22:47:51.890559000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-04 22:47:58.477993
248	Order	40	create	\N	\N	2017-04-04 23:10:23.299502
250	Order	42	create	\N	\N	2017-04-07 04:46:17.363446
253	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 54:0.4738895000000000041485E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.290395000000000041485E2\nsubtotal: !ruby/object:BigDecimal 27:0.41485E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:46:41.044065000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:46:49.831773
254	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 45:0.324843000000000002849E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.19943000000000002849E2\nsubtotal: !ruby/object:BigDecimal 27:0.2849E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:46:49.831773000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:47:05.616485
257	Payola::Sale	27	create	\N	\N	2017-04-07 04:49:58.89473
260	Order	42	update	\N	---\nshipped: new\nid: 42\nprice: !ruby/object:BigDecimal 45:0.612236000000000005348E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.37436000000000005348E2\nsubtotal: !ruby/object:BigDecimal 27:0.5348E3\nshipping: \nname: order-f214769bda\npermalink: af75d4c4e9\ncreated_at: 2017-04-07 04:46:17.363446000 Z\nupdated_at: 2017-04-07 04:49:18.035719000 Z\nshipping_address_id: \nbilling_address_id: 29\n	2017-04-07 04:50:02.7046
261	Order	43	create	\N	\N	2017-04-07 04:51:32.221176
264	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 54:0.10433255000000000090965E6\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.636755000000000090965E2\nsubtotal: !ruby/object:BigDecimal 36:0.90965E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:51:48.721925000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:51:53.393441
265	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 45:0.894279000000000007797E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.54579000000000007797E2\nsubtotal: !ruby/object:BigDecimal 36:0.7797E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:51:53.393441000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:52:01.675121
266	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 54:0.9837069000000000085767E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.600369000000000085767E2\nsubtotal: !ruby/object:BigDecimal 36:0.85767E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:52:01.675121000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 04:52:06.661261
268	Order	43	update	\N	---\nshipped: new\nid: 43\nprice: !ruby/object:BigDecimal 54:0.9538976000000000083168E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.582176000000000083168E2\nsubtotal: !ruby/object:BigDecimal 36:0.83168E3\nshipping: \nname: order-c81f293672\npermalink: 15d012cf59\ncreated_at: 2017-04-07 04:51:32.221176000 Z\nupdated_at: 2017-04-07 04:52:52.670249000 Z\nshipping_address_id: \nbilling_address_id: 30\n	2017-04-07 04:52:53.408351
269	Payola::Sale	28	create	\N	\N	2017-04-07 04:53:31.968454
275	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 45:0.649686000000000005698E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.39886000000000005698E2\nsubtotal: !ruby/object:BigDecimal 27:0.5698E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:12:43.950405000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:12:44.761745
279	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 54:0.9859976000000000086168E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.603176000000000086168E2\nsubtotal: !ruby/object:BigDecimal 27:0.86168E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:13:18.112269000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:13:30.14013
241	Payola::Sale	26	update	\N	---\nstate: pending\nid: 26\nemail: zeusdelin@gmail.com\nguid: 8s7330\nproduct_id: 37\nproduct_type: Order\ncreated_at: 2017-04-04 14:54:02.393730000 Z\nupdated_at: 2017-04-04 14:54:02.393730000 Z\nstripe_id: \nstripe_token: tok_1A4t2gKyDViFGl99m5aeX6Mo\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 100968\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-04 14:54:02.412362
242	Payola::Sale	26	update	\N	---\nstate: processing\nid: 26\nemail: zeusdelin@gmail.com\nguid: 8s7330\nproduct_id: 37\nproduct_type: Order\ncreated_at: 2017-04-04 14:54:02.393730000 Z\nupdated_at: 2017-04-04 14:54:02.412362314 Z\nstripe_id: \nstripe_token: tok_1A4t2gKyDViFGl99m5aeX6Mo\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 100968\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-04 14:54:04.624893
258	Payola::Sale	27	update	\N	---\nstate: pending\nid: 27\nemail: chrispakarumo@gmail.com\nguid: 78snb3\nproduct_id: 42\nproduct_type: Order\ncreated_at: 2017-04-07 04:49:58.894730000 Z\nupdated_at: 2017-04-07 04:49:58.894730000 Z\nstripe_id: \nstripe_token: tok_1A5p2lKyDViFGl99tkROWCuj\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 61223\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 04:49:58.914202
259	Payola::Sale	27	update	\N	---\nstate: processing\nid: 27\nemail: chrispakarumo@gmail.com\nguid: 78snb3\nproduct_id: 42\nproduct_type: Order\ncreated_at: 2017-04-07 04:49:58.894730000 Z\nupdated_at: 2017-04-07 04:49:58.914202385 Z\nstripe_id: \nstripe_token: tok_1A5p2lKyDViFGl99tkROWCuj\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 61223\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 04:50:01.388385
270	Payola::Sale	28	update	\N	---\nstate: pending\nid: 28\nemail: tarrygriswold@gmail.com\nguid: s0vss4\nproduct_id: 43\nproduct_type: Order\ncreated_at: 2017-04-07 04:53:31.968454000 Z\nupdated_at: 2017-04-07 04:53:31.968454000 Z\nstripe_id: \nstripe_token: tok_1A5p6CKyDViFGl99sDK2sf7A\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 95389\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 04:53:31.989196
271	Payola::Sale	28	update	\N	---\nstate: processing\nid: 28\nemail: tarrygriswold@gmail.com\nguid: s0vss4\nproduct_id: 43\nproduct_type: Order\ncreated_at: 2017-04-07 04:53:31.968454000 Z\nupdated_at: 2017-04-07 04:53:31.989196040 Z\nstripe_id: \nstripe_token: tok_1A5p6CKyDViFGl99sDK2sf7A\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 95389\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 04:53:34.440091
284	Payola::Sale	29	update	\N	---\nstate: pending\nid: 29\nemail: jonegriswold@gmail.com\nguid: e71k0c\nproduct_id: 44\nproduct_type: Order\ncreated_at: 2017-04-07 15:17:23.665032000 Z\nupdated_at: 2017-04-07 15:17:23.665032000 Z\nstripe_id: \nstripe_token: tok_1A5ypwKyDViFGl99FuGimxlX\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 95404\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 15:17:23.684766
285	Payola::Sale	29	update	\N	---\nstate: processing\nid: 29\nemail: jonegriswold@gmail.com\nguid: e71k0c\nproduct_id: 44\nproduct_type: Order\ncreated_at: 2017-04-07 15:17:23.665032000 Z\nupdated_at: 2017-04-07 15:17:23.684766229 Z\nstripe_id: \nstripe_token: tok_1A5ypwKyDViFGl99FuGimxlX\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 95404\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 15:17:25.99296
280	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 45:0.926379000000000008097E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.56679000000000008097E2\nsubtotal: !ruby/object:BigDecimal 27:0.8097E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:13:30.140130000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:13:40.274281
281	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 54:0.9817176000000000085768E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.600376000000000085768E2\nsubtotal: !ruby/object:BigDecimal 27:0.85768E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:13:40.274281000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:14:02.366213
282	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 54:0.9540483000000000083369E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.583583000000000083369E2\nsubtotal: !ruby/object:BigDecimal 27:0.83369E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:14:02.366213000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 15:16:44.101364
283	Payola::Sale	29	create	\N	\N	2017-04-07 15:17:23.665032
286	Order	44	update	\N	---\nshipped: new\nid: 44\nprice: !ruby/object:BigDecimal 54:0.9540483000000000083369E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.583583000000000083369E2\nsubtotal: !ruby/object:BigDecimal 27:0.83369E3\nshipping: \nname: order-63f716e917\npermalink: dab42db382\ncreated_at: 2017-04-07 15:12:43.506647000 Z\nupdated_at: 2017-04-07 15:16:44.101364000 Z\nshipping_address_id: \nbilling_address_id: 32\n	2017-04-07 15:17:26.723695
287	Order	45	create	\N	\N	2017-04-07 18:18:54.598711
288	Order	45	update	\N	---\nshipped: new\nid: 45\nprice: !ruby/object:BigDecimal 45:0.894279000000000007797E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.54579000000000007797E2\nsubtotal: !ruby/object:BigDecimal 36:0.7797E3\nshipping: \nname: order-76927a7c92\npermalink: 88f9821e5f\ncreated_at: 2017-04-07 18:18:54.598711000 Z\nupdated_at: 2017-04-07 18:18:54.598711000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 18:19:03.400917
289	Order	45	update	\N	---\nshipped: new\nid: 45\nprice: !ruby/object:BigDecimal 54:0.7452325000000000064975E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.454825000000000064975E2\nsubtotal: !ruby/object:BigDecimal 36:0.64975E3\nshipping: \nname: order-76927a7c92\npermalink: 88f9821e5f\ncreated_at: 2017-04-07 18:18:54.598711000 Z\nupdated_at: 2017-04-07 18:19:03.400917000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 18:19:06.82148
290	Order	45	update	\N	---\nshipped: new\nid: 45\nprice: !ruby/object:BigDecimal 45:0.596186000000000005198E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.36386000000000005198E2\nsubtotal: !ruby/object:BigDecimal 36:0.5198E3\nshipping: \nname: order-76927a7c92\npermalink: 88f9821e5f\ncreated_at: 2017-04-07 18:18:54.598711000 Z\nupdated_at: 2017-04-07 18:19:06.821480000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 18:19:15.140921
291	Order	45	update	\N	---\nshipped: new\nid: 45\nprice: !ruby/object:BigDecimal 54:0.6856139000000000059777E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.418439000000000059777E2\nsubtotal: !ruby/object:BigDecimal 36:0.59777E3\nshipping: \nname: order-76927a7c92\npermalink: 88f9821e5f\ncreated_at: 2017-04-07 18:18:54.598711000 Z\nupdated_at: 2017-04-07 18:19:15.140921000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 18:19:20.532426
292	Order	45	update	\N	---\nshipped: new\nid: 45\nprice: !ruby/object:BigDecimal 54:0.6558046000000000057178E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.400246000000000057178E2\nsubtotal: !ruby/object:BigDecimal 36:0.57178E3\nshipping: \nname: order-76927a7c92\npermalink: 88f9821e5f\ncreated_at: 2017-04-07 18:18:54.598711000 Z\nupdated_at: 2017-04-07 18:19:20.532426000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-07 18:20:14.577219
293	Payola::Sale	30	create	\N	\N	2017-04-07 18:21:32.461469
294	Payola::Sale	30	update	\N	---\nstate: pending\nid: 30\nemail: tylarborem@gmail.com\nguid: i82tug\nproduct_id: 45\nproduct_type: Order\ncreated_at: 2017-04-07 18:21:32.461469000 Z\nupdated_at: 2017-04-07 18:21:32.461469000 Z\nstripe_id: \nstripe_token: tok_1A61i9KyDViFGl99T5dkcw3j\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 65580\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 18:21:32.49281
295	Payola::Sale	30	update	\N	---\nstate: processing\nid: 30\nemail: tylarborem@gmail.com\nguid: i82tug\nproduct_id: 45\nproduct_type: Order\ncreated_at: 2017-04-07 18:21:32.461469000 Z\nupdated_at: 2017-04-07 18:21:32.492810720 Z\nstripe_id: \nstripe_token: tok_1A61i9KyDViFGl99T5dkcw3j\ncard_last4: \ncard_expiration: \ncard_type: \nerror: \namount: 65580\nfee_amount: \ncoupon_id: \nopt_in: \ndownload_count: \naffiliate_id: \ncustomer_address: \nbusiness_address: \nstripe_customer_id: \ncurrency: usd\nsigned_custom_fields: \nowner_id: \nowner_type: \n	2017-04-07 18:21:34.963069
296	Order	45	update	\N	---\nshipped: new\nid: 45\nprice: !ruby/object:BigDecimal 54:0.6558046000000000057178E5\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.400246000000000057178E2\nsubtotal: !ruby/object:BigDecimal 36:0.57178E3\nshipping: \nname: order-76927a7c92\npermalink: 88f9821e5f\ncreated_at: 2017-04-07 18:18:54.598711000 Z\nupdated_at: 2017-04-07 18:20:14.577219000 Z\nshipping_address_id: \nbilling_address_id: 33\n	2017-04-07 18:21:35.495686
297	Order	46	create	\N	\N	2017-04-13 12:57:30.589573
298	Order	46	update	\N	---\nshipped: new\nid: 46\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-12094e85f9\npermalink: 1e5f3f5d4c\ncreated_at: 2017-04-13 12:57:30.589573000 Z\nupdated_at: 2017-04-13 12:57:30.589573000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-13 12:58:29.842329
299	Order	47	create	\N	\N	2017-04-18 04:04:34.747033
300	Order	48	create	\N	\N	2017-04-18 14:53:58.698723
301	Order	48	update	\N	---\nshipped: new\nid: 48\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-8b69fb3799\npermalink: 0aa883fbe1\ncreated_at: 2017-04-18 14:53:58.698723000 Z\nupdated_at: 2017-04-18 14:53:58.698723000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-18 14:54:14.379177
302	Order	49	create	\N	\N	2017-04-18 14:54:48.149342
303	Order	49	update	\N	---\nshipped: new\nid: 49\nprice: !ruby/object:BigDecimal 54:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \nname: order-c0da532978\npermalink: 191dd82f48\ncreated_at: 2017-04-18 14:54:48.149342000 Z\nupdated_at: 2017-04-18 14:54:48.149342000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-18 14:55:03.029235
304	Order	50	create	\N	\N	2017-04-23 20:30:40.135225
305	Order	51	create	\N	\N	2017-04-26 17:32:24.653864
306	Order	51	update	\N	---\nshipped: new\nid: 51\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-60800d43a5\npermalink: 749b777db0\ncreated_at: 2017-04-26 17:32:24.653864000 Z\nupdated_at: 2017-04-26 17:32:24.653864000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-26 17:32:47.850101
307	Order	52	create	\N	\N	2017-04-27 16:35:13.62918
308	Order	52	update	\N	---\nshipped: new\nid: 52\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-32e7dcc46d\npermalink: 988eaa2f64\ncreated_at: 2017-04-27 16:35:13.629180000 Z\nupdated_at: 2017-04-27 16:35:13.629180000 Z\nshipping_address_id: \nbilling_address_id: \n	2017-04-27 16:36:03.371623
309	Order	53	create	\N	\N	2017-05-03 00:22:58.732236
310	Order	54	create	\N	\N	2017-05-09 08:17:08.359895
311	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 08:17:08.359895000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: \n	2017-05-09 08:17:37.455575
312	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 08:17:37.455575000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 08:18:40.124763
313	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.528093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 08:18:40.124763000 Z\nshipping_address_id: 38\nbilling_address_id: \ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 09:57:22.429186
314	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.4173302000000000036386E5\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.254702000000000036386E2\nsubtotal: !ruby/object:BigDecimal 18:0.36386E3\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 09:57:22.429186000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:19:45.384246
315	Payola::Sale	31	create	\N	\N	2017-05-09 10:22:03.008719
318	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:19:45.384246000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:28:12.012166
319	Order	54	update	\N	---\nshipped: new\nid: 54\npermalink: da4ab4580b\nname: order-1cdd5c8d9a\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:28:12.012166000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:28:15.609241
320	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.528093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:28:15.609241000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:28:18.43501
321	Order	54	update	\N	---\nshipped: new\nid: 54\npermalink: da4ab4580b\nname: order-1cdd5c8d9a\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:28:18.435010000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:28:22.244771
322	Order	54	update	\N	---\nshipped: new\nid: 54\npermalink: da4ab4580b\nname: order-1cdd5c8d9a\nprice: !ruby/object:BigDecimal 36:0.528093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:28:22.244771000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:31:36.281494
323	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.1137779000000000008297E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.58079000000000008297E1\nsubtotal: !ruby/object:BigDecimal 18:0.8297E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:31:36.281494000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:32:08.27397
324	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.581593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:32:08.273970000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:32:11.398306
325	Order	54	update	\N	---\nshipped: new\nid: 54\npermalink: da4ab4580b\nname: order-1cdd5c8d9a\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:32:11.398306000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:32:15.792519
326	Order	54	update	\N	---\nshipped: new\nid: 54\nprice: !ruby/object:BigDecimal 36:0.528093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-1cdd5c8d9a\npermalink: da4ab4580b\ncreated_at: 2017-05-09 08:17:08.359895000 Z\nupdated_at: 2017-05-09 10:32:15.792519000 Z\nshipping_address_id: 38\nbilling_address_id: 39\ntoken: \nemail: kanholkarrahul@gmail.com\n	2017-05-09 10:41:11.621181
327	Order	55	create	\N	\N	2017-05-09 10:46:39.317851
328	Order	55	update	\N	---\nshipped: new\nid: 55\nprice: !ruby/object:BigDecimal 54:0.351593000000000003099E4\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-4fb3627da5\npermalink: ef46c5f267\ncreated_at: 2017-05-09 10:46:39.317851000 Z\nupdated_at: 2017-05-09 10:46:39.317851000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: \n	2017-05-09 10:47:17.4072
329	Order	56	create	\N	\N	2017-05-09 11:00:42.216647
330	Order	56	update	\N	---\nshipped: new\nid: 56\nprice: !ruby/object:BigDecimal 36:0.298093000000000002599E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: \nname: order-41c44f5483\npermalink: 5eb9d0422f\ncreated_at: 2017-05-09 11:00:42.216647000 Z\nupdated_at: 2017-05-09 11:00:42.216647000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: \n	2017-05-09 11:21:08.684422
331	Order	56	update	\N	---\nshipped: new\nid: 56\nprice: !ruby/object:BigDecimal 36:0.596186000000000005198E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.36386000000000005198E1\nsubtotal: !ruby/object:BigDecimal 18:0.5198E2\nshipping: \nname: order-41c44f5483\npermalink: 5eb9d0422f\ncreated_at: 2017-05-09 11:00:42.216647000 Z\nupdated_at: 2017-05-09 11:21:08.684422000 Z\nshipping_address_id: \nbilling_address_id: 41\ntoken: \nemail: \n	2017-05-09 11:31:53.94468
332	Order	56	update	\N	---\nshipped: new\nid: 56\npermalink: 5eb9d0422f\nname: order-41c44f5483\nprice: !ruby/object:BigDecimal 36:0.596186000000000005198E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.36386000000000005198E1\nsubtotal: !ruby/object:BigDecimal 18:0.5198E2\nshipping: \ncreated_at: 2017-05-09 11:00:42.216647000 Z\nupdated_at: 2017-05-09 11:31:53.944680000 Z\nshipping_address_id: \nbilling_address_id: 41\ntoken: \nemail: asdas@xzcx.cc\n	2017-05-09 11:32:46.16638
333	Order	56	update	\N	---\nshipped: new\nid: 56\nprice: !ruby/object:BigDecimal 36:0.1443965000000000013495E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.94465000000000013495E1\nsubtotal: !ruby/object:BigDecimal 18:0.13495E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-41c44f5483\npermalink: 5eb9d0422f\ncreated_at: 2017-05-09 11:00:42.216647000 Z\nupdated_at: 2017-05-09 11:32:46.166380000 Z\nshipping_address_id: \nbilling_address_id: 41\ntoken: \nemail: asdas@xzcx.cc\n	2017-05-09 11:32:58.159571
334	Order	56	update	\N	---\nshipped: new\nid: 56\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-41c44f5483\npermalink: 5eb9d0422f\ncreated_at: 2017-05-09 11:00:42.216647000 Z\nupdated_at: 2017-05-09 11:32:58.159571000 Z\nshipping_address_id: \nbilling_address_id: 41\ntoken: \nemail: asdas@xzcx.cc\n	2017-05-09 11:33:26.729181
335	Order	56	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-41c44f5483\nid: 56\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 5eb9d0422f\ncreated_at: 2017-05-09 11:00:42.216647000 Z\nupdated_at: 2017-05-09 11:33:26.729181000 Z\nshipping_address_id: 42\nbilling_address_id: 41\ntoken: \nemail: asdas@xzcx.cc\n	2017-05-09 12:37:33.260327
336	Order	57	create	\N	\N	2017-05-09 12:39:42.398877
337	Order	57	update	\N	---\nshipped: new\nid: 57\npermalink: 5de5d19450\nname: order-f02a8b28ad\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-09 12:39:42.398877000 Z\nupdated_at: 2017-05-09 12:39:42.398877000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: \n	2017-05-09 12:47:02.626679
338	Order	57	update	\N	---\nshipped: new\nid: 57\nprice: !ruby/object:BigDecimal 36:0.609686000000000005698E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.39886000000000005698E1\nsubtotal: !ruby/object:BigDecimal 18:0.5698E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-f02a8b28ad\npermalink: 5de5d19450\ncreated_at: 2017-05-09 12:39:42.398877000 Z\nupdated_at: 2017-05-09 12:47:02.626679000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 12:47:08.871574
935	Order	222	update	\N	---\nshipped: new\nid: 222\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-59aaa612d9\npermalink: 92a5120840\ncreated_at: 2017-05-27 13:43:23.683627000 Z\nupdated_at: 2017-05-27 13:44:00.338477000 Z\nshipping_address_id: 200\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 13:44:18.587872
339	Order	57	update	\N	---\nshipped: new\nid: 57\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-f02a8b28ad\npermalink: 5de5d19450\ncreated_at: 2017-05-09 12:39:42.398877000 Z\nupdated_at: 2017-05-09 12:47:08.871574000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 12:47:50.831375
340	Order	57	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-f02a8b28ad\nid: 57\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 5de5d19450\ncreated_at: 2017-05-09 12:39:42.398877000 Z\nupdated_at: 2017-05-09 12:47:50.831375000 Z\nshipping_address_id: 43\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 12:48:57.086133
341	Order	58	create	\N	\N	2017-05-09 12:50:01.362093
342	Order	58	update	\N	---\nshipped: new\nid: 58\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-67c85d87b6\npermalink: eee6cfd6ed\ncreated_at: 2017-05-09 12:50:01.362093000 Z\nupdated_at: 2017-05-09 12:50:01.362093000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 12:50:24.20009
343	Order	58	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-67c85d87b6\nid: 58\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: eee6cfd6ed\ncreated_at: 2017-05-09 12:50:01.362093000 Z\nupdated_at: 2017-05-09 12:50:24.200090000 Z\nshipping_address_id: 44\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 12:50:56.067285
344	Order	59	create	\N	\N	2017-05-09 13:25:30.316019
345	Order	59	update	\N	---\nshipped: new\nid: 59\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8e473265bb\npermalink: b13b793e63\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 13:25:30.316019000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 13:38:48.587273
346	Order	59	update	\N	---\nshipped: new\nid: 59\nprice: !ruby/object:BigDecimal 45:0.913186000000000006198E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8e473265bb\npermalink: b13b793e63\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 13:38:48.587273000 Z\nshipping_address_id: 45\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 13:49:57.293891
347	Order	59	update	\N	---\nshipped: new\nid: 59\npermalink: b13b793e63\nname: order-8e473265bb\nprice: !ruby/object:BigDecimal 36:0.913186000000000006198E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 18:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 13:49:57.293891000 Z\nshipping_address_id: 46\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 14:23:39.289524
348	Order	59	update	\N	---\nshipped: new\nid: 59\nprice: !ruby/object:BigDecimal 36:0.349103000000000003029E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21203000000000003029E2\nsubtotal: !ruby/object:BigDecimal 18:0.3029E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8e473265bb\npermalink: b13b793e63\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 14:23:39.289524000 Z\nshipping_address_id: 46\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 14:23:44.146543
349	Order	59	update	\N	---\nshipped: new\nid: 59\nprice: !ruby/object:BigDecimal 36:0.3234337000000000027891E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.195237000000000027891E2\nsubtotal: !ruby/object:BigDecimal 18:0.27891E3\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-8e473265bb\npermalink: b13b793e63\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 14:23:44.146543000 Z\nshipping_address_id: 46\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 14:23:46.597588
350	Order	59	update	\N	---\nshipped: new\nid: 59\npermalink: b13b793e63\nname: order-8e473265bb\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 14:23:46.597588000 Z\nshipping_address_id: 46\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 14:23:53.56989
351	Order	59	update	\N	---\nshipped: new\nid: 59\npermalink: b13b793e63\nname: order-8e473265bb\nprice: !ruby/object:BigDecimal 36:0.528093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 14:23:53.569890000 Z\nshipping_address_id: 46\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 14:30:03.940917
352	Order	59	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.859686000000000005698E2\nname: order-8e473265bb\nid: 59\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.39886000000000005698E1\nsubtotal: !ruby/object:BigDecimal 18:0.5698E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: b13b793e63\ncreated_at: 2017-05-09 13:25:30.316019000 Z\nupdated_at: 2017-05-09 14:30:03.940917000 Z\nshipping_address_id: 46\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 15:00:47.432032
353	Order	60	create	\N	\N	2017-05-09 15:07:42.604232
354	Order	60	update	\N	---\nshipped: new\nid: 60\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8976579ac7\npermalink: 49a45331f4\ncreated_at: 2017-05-09 15:07:42.604232000 Z\nupdated_at: 2017-05-09 15:07:42.604232000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 15:11:01.063985
355	Order	60	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-8976579ac7\nid: 60\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 49a45331f4\ncreated_at: 2017-05-09 15:07:42.604232000 Z\nupdated_at: 2017-05-09 15:11:01.063985000 Z\nshipping_address_id: 47\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 15:11:51.651398
356	Order	61	create	\N	\N	2017-05-09 15:57:23.129476
357	Order	61	update	\N	---\nshipped: new\nid: 61\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-b753893d43\npermalink: 49f828193d\ncreated_at: 2017-05-09 15:57:23.129476000 Z\nupdated_at: 2017-05-09 15:57:23.129476000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 15:57:47.22653
936	Order	223	create	\N	\N	2017-05-27 13:45:09.815297
358	Order	61	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-b753893d43\nid: 61\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 49f828193d\ncreated_at: 2017-05-09 15:57:23.129476000 Z\nupdated_at: 2017-05-09 15:57:47.226530000 Z\nshipping_address_id: 48\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 15:58:11.664942
359	Order	62	create	\N	\N	2017-05-09 16:05:02.52669
360	Order	62	update	\N	---\nshipped: new\nid: 62\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-45f33deb4b\npermalink: 7b2082214f\ncreated_at: 2017-05-09 16:05:02.526690000 Z\nupdated_at: 2017-05-09 16:05:02.526690000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:05:38.38562
361	Order	62	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-45f33deb4b\nid: 62\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 7b2082214f\ncreated_at: 2017-05-09 16:05:02.526690000 Z\nupdated_at: 2017-05-09 16:05:38.385620000 Z\nshipping_address_id: 49\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:06:00.149025
362	Order	63	create	\N	\N	2017-05-09 16:08:14.599137
363	Order	63	update	\N	---\nshipped: new\nid: 63\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-612a5c0673\npermalink: b60305496e\ncreated_at: 2017-05-09 16:08:14.599137000 Z\nupdated_at: 2017-05-09 16:08:14.599137000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:08:36.38156
364	Order	63	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-612a5c0673\nid: 63\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: b60305496e\ncreated_at: 2017-05-09 16:08:14.599137000 Z\nupdated_at: 2017-05-09 16:08:36.381560000 Z\nshipping_address_id: 50\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:08:56.331736
365	Order	64	create	\N	\N	2017-05-09 16:13:08.62099
366	Order	64	update	\N	---\nshipped: new\nid: 64\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-3b8519f326\npermalink: b95cca2c99\ncreated_at: 2017-05-09 16:13:08.620990000 Z\nupdated_at: 2017-05-09 16:13:08.620990000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:13:30.152411
367	Order	64	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-3b8519f326\nid: 64\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: b95cca2c99\ncreated_at: 2017-05-09 16:13:08.620990000 Z\nupdated_at: 2017-05-09 16:13:30.152411000 Z\nshipping_address_id: 51\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:13:57.398287
368	Order	65	create	\N	\N	2017-05-09 16:26:07.890927
369	Order	65	update	\N	---\nshipped: new\nid: 65\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-41dc6489e6\npermalink: fbb64f1005\ncreated_at: 2017-05-09 16:26:07.890927000 Z\nupdated_at: 2017-05-09 16:26:07.890927000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:26:31.414532
370	Order	65	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-41dc6489e6\nid: 65\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: fbb64f1005\ncreated_at: 2017-05-09 16:26:07.890927000 Z\nupdated_at: 2017-05-09 16:26:31.414532000 Z\nshipping_address_id: 52\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:26:51.345682
371	Order	66	create	\N	\N	2017-05-09 16:28:15.441642
372	Order	66	update	\N	---\nshipped: new\nid: 66\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-5edb5164d3\npermalink: 906b45e757\ncreated_at: 2017-05-09 16:28:15.441642000 Z\nupdated_at: 2017-05-09 16:28:15.441642000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:28:46.132099
373	Order	66	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-5edb5164d3\nid: 66\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 906b45e757\ncreated_at: 2017-05-09 16:28:15.441642000 Z\nupdated_at: 2017-05-09 16:28:46.132099000 Z\nshipping_address_id: 53\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:29:10.15175
374	Order	67	create	\N	\N	2017-05-09 16:31:02.018585
377	Order	68	create	\N	\N	2017-05-09 16:33:16.470156
375	Order	67	update	\N	---\nshipped: new\nid: 67\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-a2a001b31e\npermalink: d3f0c1f3a9\ncreated_at: 2017-05-09 16:31:02.018585000 Z\nupdated_at: 2017-05-09 16:31:02.018585000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:31:35.417865
376	Order	67	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-a2a001b31e\nid: 67\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: d3f0c1f3a9\ncreated_at: 2017-05-09 16:31:02.018585000 Z\nupdated_at: 2017-05-09 16:31:35.417865000 Z\nshipping_address_id: 54\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:31:57.189729
378	Order	68	update	\N	---\nshipped: new\nid: 68\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-d7f999648a\npermalink: e5a3f1a629\ncreated_at: 2017-05-09 16:33:16.470156000 Z\nupdated_at: 2017-05-09 16:33:16.470156000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:33:39.822287
937	Order	223	update	\N	---\nshipped: new\nid: 223\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-4aab701448\npermalink: 3c3d29b515\ncreated_at: 2017-05-27 13:45:09.815297000 Z\nupdated_at: 2017-05-27 13:45:09.815297000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 13:46:29.243703
379	Order	68	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-d7f999648a\nid: 68\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: e5a3f1a629\ncreated_at: 2017-05-09 16:33:16.470156000 Z\nupdated_at: 2017-05-09 16:33:39.822287000 Z\nshipping_address_id: 55\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:34:02.403386
380	Order	69	create	\N	\N	2017-05-09 16:35:02.407422
381	Order	69	update	\N	---\nshipped: new\nid: 69\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-440f7b5a54\npermalink: '3981851200'\ncreated_at: 2017-05-09 16:35:02.407422000 Z\nupdated_at: 2017-05-09 16:35:02.407422000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:35:38.062122
382	Order	69	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-440f7b5a54\nid: 69\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: '3981851200'\ncreated_at: 2017-05-09 16:35:02.407422000 Z\nupdated_at: 2017-05-09 16:35:38.062122000 Z\nshipping_address_id: 56\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:35:57.084856
383	Order	70	create	\N	\N	2017-05-09 16:41:46.943959
384	Order	70	update	\N	---\nshipped: new\nid: 70\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-f8a67bbf48\npermalink: 79ab01a4bc\ncreated_at: 2017-05-09 16:41:46.943959000 Z\nupdated_at: 2017-05-09 16:41:46.943959000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:42:23.318943
385	Order	70	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-f8a67bbf48\nid: 70\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 79ab01a4bc\ncreated_at: 2017-05-09 16:41:46.943959000 Z\nupdated_at: 2017-05-09 16:42:23.318943000 Z\nshipping_address_id: 57\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:42:44.08289
386	Order	71	create	\N	\N	2017-05-09 16:46:07.501244
387	Order	71	update	\N	---\nshipped: new\nid: 71\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-fefe2b684e\npermalink: aeba6b5c4d\ncreated_at: 2017-05-09 16:46:07.501244000 Z\nupdated_at: 2017-05-09 16:46:07.501244000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:46:33.563911
388	Order	71	update	\N	---\nshipped: new\nid: 71\npermalink: aeba6b5c4d\nname: order-fefe2b684e\nprice: !ruby/object:BigDecimal 36:0.506693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 18:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-09 16:46:07.501244000 Z\nupdated_at: 2017-05-09 16:46:33.563911000 Z\nshipping_address_id: 58\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:48:07.163242
389	Order	71	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.838286000000000005498E2\nname: order-fefe2b684e\nid: 71\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.38486000000000005498E1\nsubtotal: !ruby/object:BigDecimal 27:0.5498E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: aeba6b5c4d\ncreated_at: 2017-05-09 16:46:07.501244000 Z\nupdated_at: 2017-05-09 16:48:07.163242000 Z\nshipping_address_id: 58\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:48:37.998619
390	Order	72	create	\N	\N	2017-05-09 16:51:04.225686
391	Order	72	update	\N	---\nshipped: new\nid: 72\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0653a0323a\npermalink: a3c33433b2\ncreated_at: 2017-05-09 16:51:04.225686000 Z\nupdated_at: 2017-05-09 16:51:04.225686000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:51:26.048009
392	Order	72	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-0653a0323a\nid: 72\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: a3c33433b2\ncreated_at: 2017-05-09 16:51:04.225686000 Z\nupdated_at: 2017-05-09 16:51:26.048009000 Z\nshipping_address_id: 59\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:52:23.748815
393	Order	73	create	\N	\N	2017-05-09 16:57:04.962817
394	Order	73	update	\N	---\nshipped: new\nid: 73\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-02fc4404f7\npermalink: 71b1c9c147\ncreated_at: 2017-05-09 16:57:04.962817000 Z\nupdated_at: 2017-05-09 16:57:04.962817000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:57:28.19296
395	Order	73	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.506693000000000002399E2\nname: order-02fc4404f7\nid: 73\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 71b1c9c147\ncreated_at: 2017-05-09 16:57:04.962817000 Z\nupdated_at: 2017-05-09 16:57:28.192960000 Z\nshipping_address_id: 60\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:57:48.846861
396	Order	74	create	\N	\N	2017-05-09 16:58:45.760566
397	Order	74	update	\N	---\nshipped: new\nid: 74\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-f123e7aa66\npermalink: 66b2383d17\ncreated_at: 2017-05-09 16:58:45.760566000 Z\nupdated_at: 2017-05-09 16:58:45.760566000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:59:11.969665
398	Order	74	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-f123e7aa66\nid: 74\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 66b2383d17\ncreated_at: 2017-05-09 16:58:45.760566000 Z\nupdated_at: 2017-05-09 16:59:11.969665000 Z\nshipping_address_id: 61\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 16:59:33.248891
400	Order	75	update	\N	---\nshipped: new\nid: 75\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-5b53d27334\npermalink: 9e9dd0daf3\ncreated_at: 2017-05-09 17:04:27.830760000 Z\nupdated_at: 2017-05-09 17:04:27.830760000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 17:04:49.924078
401	Order	75	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-5b53d27334\nid: 75\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9e9dd0daf3\ncreated_at: 2017-05-09 17:04:27.830760000 Z\nupdated_at: 2017-05-09 17:04:49.924078000 Z\nshipping_address_id: 62\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 17:05:13.973066
402	Order	76	create	\N	\N	2017-05-09 17:08:37.066328
403	Order	76	update	\N	---\nshipped: new\nid: 76\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2175f865c8\npermalink: ff97ca9fcd\ncreated_at: 2017-05-09 17:08:37.066328000 Z\nupdated_at: 2017-05-09 17:08:37.066328000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 17:09:03.961978
404	Order	76	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-2175f865c8\nid: 76\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: ff97ca9fcd\ncreated_at: 2017-05-09 17:08:37.066328000 Z\nupdated_at: 2017-05-09 17:09:03.961978000 Z\nshipping_address_id: 63\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 17:09:28.513719
405	Order	77	create	\N	\N	2017-05-09 17:11:46.909399
406	Order	77	update	\N	---\nshipped: new\nid: 77\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-aa9b8ea889\npermalink: 09ad7d0f3a\ncreated_at: 2017-05-09 17:11:46.909399000 Z\nupdated_at: 2017-05-09 17:11:46.909399000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 17:12:23.368743
407	Order	77	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.581593000000000003099E2\nname: order-aa9b8ea889\nid: 77\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 09ad7d0f3a\ncreated_at: 2017-05-09 17:11:46.909399000 Z\nupdated_at: 2017-05-09 17:12:23.368743000 Z\nshipping_address_id: 64\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-09 17:13:07.340059
408	Order	78	create	\N	\N	2017-05-10 05:13:39.37626
409	Order	78	update	\N	---\nshipped: new\nid: 78\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-3d05ab9de5\npermalink: bbb3a39704\ncreated_at: 2017-05-10 05:13:39.376260000 Z\nupdated_at: 2017-05-10 05:13:39.376260000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:29:23.169543
410	Order	78	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-3d05ab9de5\nid: 78\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \npermalink: bbb3a39704\ncreated_at: 2017-05-10 05:13:39.376260000 Z\nupdated_at: 2017-05-10 05:29:23.169543000 Z\nshipping_address_id: 69\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:30:46.19772
411	Order	79	create	\N	\N	2017-05-10 05:34:23.215697
412	Order	79	update	\N	---\nshipped: new\nid: 79\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-92e3c798b7\npermalink: f9f933ca47\ncreated_at: 2017-05-10 05:34:23.215697000 Z\nupdated_at: 2017-05-10 05:34:23.215697000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:35:18.939492
413	Order	79	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-92e3c798b7\nid: 79\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: f9f933ca47\ncreated_at: 2017-05-10 05:34:23.215697000 Z\nupdated_at: 2017-05-10 05:35:18.939492000 Z\nshipping_address_id: 70\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:36:01.443676
414	Order	80	create	\N	\N	2017-05-10 05:37:10.871447
415	Order	80	update	\N	---\nshipped: new\nid: 80\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-b235b5d3f5\npermalink: 648d7f7898\ncreated_at: 2017-05-10 05:37:10.871447000 Z\nupdated_at: 2017-05-10 05:37:10.871447000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:37:40.747476
416	Order	80	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-b235b5d3f5\nid: 80\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 648d7f7898\ncreated_at: 2017-05-10 05:37:10.871447000 Z\nupdated_at: 2017-05-10 05:37:40.747476000 Z\nshipping_address_id: 71\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:38:36.454005
417	Order	81	create	\N	\N	2017-05-10 05:52:45.565204
418	Order	81	update	\N	---\nshipped: new\nid: 81\nprice: !ruby/object:BigDecimal 45:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0b00a5b6d3\npermalink: 8d8f30a10d\ncreated_at: 2017-05-10 05:52:45.565204000 Z\nupdated_at: 2017-05-10 05:52:45.565204000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:53:06.261195
419	Order	81	update	\N	---\nshipped: new\nid: 81\npermalink: 8d8f30a10d\nname: order-0b00a5b6d3\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 18:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-10 05:52:45.565204000 Z\nupdated_at: 2017-05-10 05:53:06.261195000 Z\nshipping_address_id: 73\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:57:16.475176
420	Order	81	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.588286000000000005498E2\nname: order-0b00a5b6d3\nid: 81\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.38486000000000005498E1\nsubtotal: !ruby/object:BigDecimal 27:0.5498E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 8d8f30a10d\ncreated_at: 2017-05-10 05:52:45.565204000 Z\nupdated_at: 2017-05-10 05:57:16.475176000 Z\nshipping_address_id: 73\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 05:57:45.225582
421	Order	82	create	\N	\N	2017-05-10 06:15:55.393022
422	Order	82	update	\N	---\nshipped: new\nid: 82\npermalink: c2841db45e\nname: order-6ed8698548\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:15:55.393022000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:17:20.521771
423	Order	82	update	\N	---\nshipped: new\nid: 82\nprice: !ruby/object:BigDecimal 36:0.941279000000000008797E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.61579000000000008797E1\nsubtotal: !ruby/object:BigDecimal 18:0.8797E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-6ed8698548\npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:17:20.521771000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:17:26.964604
424	Order	82	update	\N	---\nshipped: new\nid: 82\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-6ed8698548\npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:17:26.964604000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:17:29.279407
425	Order	82	update	\N	---\nshipped: new\nid: 82\npermalink: c2841db45e\nname: order-6ed8698548\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:17:29.279407000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:17:33.546417
426	Order	82	update	\N	---\nshipped: new\nid: 82\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-6ed8698548\npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:17:33.546417000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:17:37.945382
427	Order	82	update	\N	---\nshipped: new\nid: 82\npermalink: c2841db45e\nname: order-6ed8698548\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:17:37.945382000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:28:05.240489
428	Order	82	update	\N	---\nshipped: new\nid: 82\nprice: !ruby/object:BigDecimal 45:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6ed8698548\npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:28:05.240489000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 06:28:51.879798
429	Order	82	update	\N	---\nshipped: new\nid: 82\nprice: !ruby/object:BigDecimal 45:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 36:0.2399E2\nshipping: \nname: order-6ed8698548\npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:28:51.879798000 Z\nshipping_address_id: 74\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:38:23.712092
430	Order	82	update	\N	---\nshipped: new\nid: 82\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 18:0.2399E2\nshipping: \nname: order-6ed8698548\npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:38:23.712092000 Z\nshipping_address_id: 75\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:38:30.709278
431	Order	82	update	\N	---\nshipped: new\nid: 82\npermalink: c2841db45e\nname: order-6ed8698548\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:38:30.709278000 Z\nshipping_address_id: 75\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:38:37.828282
432	Order	82	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.278093000000000002599E2\nname: order-6ed8698548\nid: 82\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: \npermalink: c2841db45e\ncreated_at: 2017-05-10 06:15:55.393022000 Z\nupdated_at: 2017-05-10 06:38:37.828282000 Z\nshipping_address_id: 75\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:39:09.025059
433	Order	83	create	\N	\N	2017-05-10 06:42:38.37344
434	Order	83	update	\N	---\nshipped: new\nid: 83\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-e236d6efe0\npermalink: aef320b299\ncreated_at: 2017-05-10 06:42:38.373440000 Z\nupdated_at: 2017-05-10 06:42:38.373440000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:43:07.998656
435	Order	83	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-e236d6efe0\nid: 83\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: aef320b299\ncreated_at: 2017-05-10 06:42:38.373440000 Z\nupdated_at: 2017-05-10 06:43:07.998656000 Z\nshipping_address_id: 76\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:43:30.686456
436	Order	83	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-e236d6efe0\nid: 83\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: aef320b299\ncreated_at: 2017-05-10 06:42:38.373440000 Z\nupdated_at: 2017-05-10 06:43:30.686456945 Z\nshipping_address_id: 76\nbilling_address_id: \ntoken: p9ax7_NGz0hJKipg9bZwhg\nemail: abc@gmail.com\norder_otp: \n	2017-05-10 06:43:32.143037
437	Order	84	create	\N	\N	2017-05-10 07:03:36.884454
438	Order	85	create	\N	\N	2017-05-10 07:45:43.354276
439	Order	86	create	\N	\N	2017-05-10 09:42:15.71596
440	Order	86	update	\N	---\nshipped: new\norder_otp: 1124\nphone_verified: \nid: 86\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-f0b33aec49\npermalink: 7612ff27a7\ncreated_at: 2017-05-10 09:42:15.715960000 Z\nupdated_at: 2017-05-10 09:42:15.715960000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\n	2017-05-10 09:47:26.241544
441	Order	87	create	\N	\N	2017-05-10 09:52:56.345884
442	Order	87	update	\N	---\nshipped: new\nid: 87\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-ee51505d12\npermalink: 2b9ebf65e8\ncreated_at: 2017-05-10 09:52:56.345884000 Z\nupdated_at: 2017-05-10 09:52:56.345884000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 09:53:21.022517
444	Order	88	create	\N	\N	2017-05-10 10:00:03.018188
445	Order	88	update	\N	---\nshipped: new\nid: 88\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-d2fbd34278\npermalink: f087f12da6\ncreated_at: 2017-05-10 10:00:03.018188000 Z\nupdated_at: 2017-05-10 10:00:03.018188000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:00:17.319305
449	Order	89	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-54954620a8\nid: 89\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: d542de5ae7\ncreated_at: 2017-05-10 10:05:52.415367000 Z\nupdated_at: 2017-05-10 10:06:06.387563000 Z\nshipping_address_id: 79\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:06:44.269237
450	Order	89	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-54954620a8\nid: 89\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: d542de5ae7\ncreated_at: 2017-05-10 10:05:52.415367000 Z\nupdated_at: 2017-05-10 10:06:44.269237268 Z\nshipping_address_id: 79\nbilling_address_id: \ntoken: fIsxRfjjdCO-MDRHUxQwBg\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:06:52.606315
451	Order	90	create	\N	\N	2017-05-10 10:08:38.440479
452	Order	90	update	\N	---\nshipped: new\nid: 90\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-3dec3da62f\npermalink: 88dc62cc29\ncreated_at: 2017-05-10 10:08:38.440479000 Z\nupdated_at: 2017-05-10 10:08:38.440479000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:36:53.399537
453	Order	90	update	\N	---\nshipped: new\nid: 90\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-3dec3da62f\npermalink: 88dc62cc29\ncreated_at: 2017-05-10 10:08:38.440479000 Z\nupdated_at: 2017-05-10 10:36:53.399537000 Z\nshipping_address_id: 80\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:37:02.712379
454	Order	90	update	\N	---\nshipped: new\nid: 90\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-3dec3da62f\npermalink: 88dc62cc29\ncreated_at: 2017-05-10 10:08:38.440479000 Z\nupdated_at: 2017-05-10 10:37:02.712379000 Z\nshipping_address_id: 81\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:37:08.778141
455	Order	90	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\nname: order-3dec3da62f\nid: 90\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: \npermalink: 88dc62cc29\ncreated_at: 2017-05-10 10:08:38.440479000 Z\nupdated_at: 2017-05-10 10:37:08.778141000 Z\nshipping_address_id: 82\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:38:44.420419
456	Order	91	create	\N	\N	2017-05-10 10:39:03.51022
457	Order	91	update	\N	---\nshipped: new\nid: 91\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-a4664b0bfd\npermalink: b0ceb7fce8\ncreated_at: 2017-05-10 10:39:03.510220000 Z\nupdated_at: 2017-05-10 10:39:03.510220000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:44:05.523503
458	Order	91	update	\N	---\nshipped: new\nid: 91\npermalink: b0ceb7fce8\nname: order-a4664b0bfd\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: \ncreated_at: 2017-05-10 10:39:03.510220000 Z\nupdated_at: 2017-05-10 10:44:05.523503000 Z\nshipping_address_id: 83\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:44:45.552764
460	Order	92	create	\N	\N	2017-05-10 10:47:34.654366
443	Order	87	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-ee51505d12\nid: 87\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 2b9ebf65e8\ncreated_at: 2017-05-10 09:52:56.345884000 Z\nupdated_at: 2017-05-10 09:53:21.022517000 Z\nshipping_address_id: 77\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 09:55:40.046109
446	Order	88	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-d2fbd34278\nid: 88\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: f087f12da6\ncreated_at: 2017-05-10 10:00:03.018188000 Z\nupdated_at: 2017-05-10 10:00:17.319305000 Z\nshipping_address_id: 78\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:01:31.395203
447	Order	89	create	\N	\N	2017-05-10 10:05:52.415367
448	Order	89	update	\N	---\nshipped: new\nid: 89\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-54954620a8\npermalink: d542de5ae7\ncreated_at: 2017-05-10 10:05:52.415367000 Z\nupdated_at: 2017-05-10 10:05:52.415367000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:06:06.387563
459	Order	91	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.919879000000000008597E2\nname: order-a4664b0bfd\nid: 91\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.60179000000000008597E1\nsubtotal: !ruby/object:BigDecimal 27:0.8597E2\nshipping: \npermalink: b0ceb7fce8\ncreated_at: 2017-05-10 10:39:03.510220000 Z\nupdated_at: 2017-05-10 10:44:45.552764000 Z\nshipping_address_id: 83\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:46:02.476178
461	Order	93	create	\N	\N	2017-05-10 10:50:25.48034
462	Order	93	update	\N	---\nshipped: new\nid: 93\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-33ef238d94\npermalink: b9cc1b8d33\ncreated_at: 2017-05-10 10:50:25.480340000 Z\nupdated_at: 2017-05-10 10:50:25.480340000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:50:41.857085
938	Order	223	update	\N	---\nshipped: new\nid: 223\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-4aab701448\npermalink: 3c3d29b515\ncreated_at: 2017-05-27 13:45:09.815297000 Z\nupdated_at: 2017-05-27 13:46:29.243703000 Z\nshipping_address_id: 201\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 13:47:30.53261
463	Order	93	update	\N	---\nshipped: new\nid: 93\npermalink: b9cc1b8d33\nname: order-33ef238d94\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: \ncreated_at: 2017-05-10 10:50:25.480340000 Z\nupdated_at: 2017-05-10 10:50:41.857085000 Z\nshipping_address_id: 84\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 10:51:29.571016
464	Order	92	update	\N	---\nshipped: new\nid: 92\npermalink: 9d2df85868\nname: order-4df220d553\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 18:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 10:47:34.654366000 Z\nupdated_at: 2017-05-10 10:47:34.654366000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:05:19.269981
465	Order	92	update	\N	---\nshipped: new\nid: 92\nprice: !ruby/object:BigDecimal 36:0.588286000000000005498E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.38486000000000005498E1\nsubtotal: !ruby/object:BigDecimal 18:0.5498E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-4df220d553\npermalink: 9d2df85868\ncreated_at: 2017-05-10 10:47:34.654366000 Z\nupdated_at: 2017-05-10 11:05:19.269981000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:24:15.123135
466	Order	92	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.919879000000000008597E2\nname: order-4df220d553\nid: 92\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.60179000000000008597E1\nsubtotal: !ruby/object:BigDecimal 27:0.8597E2\nshipping: \npermalink: 9d2df85868\ncreated_at: 2017-05-10 10:47:34.654366000 Z\nupdated_at: 2017-05-10 11:24:15.123135000 Z\nshipping_address_id: 85\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:26:00.524788
467	Order	92	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.919879000000000008597E2\nname: order-4df220d553\nid: 92\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.60179000000000008597E1\nsubtotal: !ruby/object:BigDecimal 27:0.8597E2\nshipping: \npermalink: 9d2df85868\ncreated_at: 2017-05-10 10:47:34.654366000 Z\nupdated_at: 2017-05-10 11:26:00.524788898 Z\nshipping_address_id: 85\nbilling_address_id: \ntoken: oV7NvVkvY7h-qb6g_ol0jw\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:26:07.699856
468	Order	94	create	\N	\N	2017-05-10 11:27:34.004129
469	Order	94	update	\N	---\nshipped: new\nid: 94\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-a32cdb7e76\npermalink: 9bb57ed1d1\ncreated_at: 2017-05-10 11:27:34.004129000 Z\nupdated_at: 2017-05-10 11:27:34.004129000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:28:01.195897
470	Order	94	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-a32cdb7e76\nid: 94\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 9bb57ed1d1\ncreated_at: 2017-05-10 11:27:34.004129000 Z\nupdated_at: 2017-05-10 11:28:01.195897000 Z\nshipping_address_id: 86\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:28:29.324487
471	Order	94	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-a32cdb7e76\nid: 94\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 9bb57ed1d1\ncreated_at: 2017-05-10 11:27:34.004129000 Z\nupdated_at: 2017-05-10 11:28:29.324487007 Z\nshipping_address_id: 86\nbilling_address_id: \ntoken: ckj3bd2dYqs9VGaOTFFfcQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:28:34.34707
472	Order	94	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-a32cdb7e76\nid: 94\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 9bb57ed1d1\ncreated_at: 2017-05-10 11:27:34.004129000 Z\nupdated_at: 2017-05-10 11:28:34.347070300 Z\nshipping_address_id: 86\nbilling_address_id: \ntoken: ckj3bd2dYqs9VGaOTFFfcQ\nemail: abc@gmail.com\norder_otp: 4031\nphone_verified: \n	2017-05-10 11:28:39.391222
473	Order	95	create	\N	\N	2017-05-10 11:31:30.274283
477	Order	96	create	\N	\N	2017-05-10 11:33:17.864196
474	Order	95	update	\N	---\nshipped: new\nid: 95\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-781dd89138\npermalink: d2abe00f18\ncreated_at: 2017-05-10 11:31:30.274283000 Z\nupdated_at: 2017-05-10 11:31:30.274283000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:31:44.187212
475	Order	95	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-781dd89138\nid: 95\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: d2abe00f18\ncreated_at: 2017-05-10 11:31:30.274283000 Z\nupdated_at: 2017-05-10 11:31:44.187212000 Z\nshipping_address_id: 87\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:32:01.216546
476	Order	95	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-781dd89138\nid: 95\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: d2abe00f18\ncreated_at: 2017-05-10 11:31:30.274283000 Z\nupdated_at: 2017-05-10 11:32:01.216546434 Z\nshipping_address_id: 87\nbilling_address_id: \ntoken: oXn1NH5ZlVEew_U4mKWilA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:32:03.651942
480	Order	96	update	\N	---\nshipped: new\nid: 96\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-c072b9297e\npermalink: dac3b3d735\ncreated_at: 2017-05-10 11:33:17.864196000 Z\nupdated_at: 2017-05-10 11:33:49.578759000 Z\nshipping_address_id: 89\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:34:46.279152
482	Order	96	update	\N	---\nshipped: new\nid: 96\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-c072b9297e\npermalink: dac3b3d735\ncreated_at: 2017-05-10 11:33:17.864196000 Z\nupdated_at: 2017-05-10 11:35:37.669204000 Z\nshipping_address_id: 91\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:36:02.157205
939	Order	224	create	\N	\N	2017-05-27 13:48:13.675045
478	Order	96	update	\N	---\nshipped: new\nid: 96\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c072b9297e\npermalink: dac3b3d735\ncreated_at: 2017-05-10 11:33:17.864196000 Z\nupdated_at: 2017-05-10 11:33:17.864196000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:33:31.538571
479	Order	96	update	\N	---\nshipped: new\nid: 96\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-c072b9297e\npermalink: dac3b3d735\ncreated_at: 2017-05-10 11:33:17.864196000 Z\nupdated_at: 2017-05-10 11:33:31.538571000 Z\nshipping_address_id: 88\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:33:49.578759
481	Order	96	update	\N	---\nshipped: new\nid: 96\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-c072b9297e\npermalink: dac3b3d735\ncreated_at: 2017-05-10 11:33:17.864196000 Z\nupdated_at: 2017-05-10 11:34:46.279152000 Z\nshipping_address_id: 90\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:35:37.669204
483	Order	96	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\nname: order-c072b9297e\nid: 96\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: \npermalink: dac3b3d735\ncreated_at: 2017-05-10 11:33:17.864196000 Z\nupdated_at: 2017-05-10 11:36:02.157205000 Z\nshipping_address_id: 92\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:36:51.568553
484	Order	97	create	\N	\N	2017-05-10 11:38:09.274074
485	Order	97	update	\N	---\nshipped: new\nid: 97\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8a95b71d9c\npermalink: d075e8da3d\ncreated_at: 2017-05-10 11:38:09.274074000 Z\nupdated_at: 2017-05-10 11:38:09.274074000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:38:23.489155
486	Order	97	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8a95b71d9c\nid: 97\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: d075e8da3d\ncreated_at: 2017-05-10 11:38:09.274074000 Z\nupdated_at: 2017-05-10 11:38:23.489155000 Z\nshipping_address_id: 93\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:39:03.201892
487	Order	97	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8a95b71d9c\nid: 97\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: d075e8da3d\ncreated_at: 2017-05-10 11:38:09.274074000 Z\nupdated_at: 2017-05-10 11:39:03.201892893 Z\nshipping_address_id: 93\nbilling_address_id: \ntoken: _68jRBDRflboPrmhUxz5dw\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:39:07.988581
488	Order	98	create	\N	\N	2017-05-10 11:41:17.795717
489	Order	98	update	\N	---\nshipped: new\nid: 98\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6b7131c3f5\npermalink: 706f1176fd\ncreated_at: 2017-05-10 11:41:17.795717000 Z\nupdated_at: 2017-05-10 11:41:17.795717000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:41:39.289949
490	Order	98	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-6b7131c3f5\nid: 98\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 706f1176fd\ncreated_at: 2017-05-10 11:41:17.795717000 Z\nupdated_at: 2017-05-10 11:41:39.289949000 Z\nshipping_address_id: 94\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 11:42:32.518444
491	Order	99	create	\N	\N	2017-05-10 11:42:59.881343
492	Order	100	create	\N	\N	2017-05-10 12:04:32.214326
493	Order	100	update	\N	---\nshipped: new\nid: 100\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6b0cffa3ed\npermalink: cb207adca8\ncreated_at: 2017-05-10 12:04:32.214326000 Z\nupdated_at: 2017-05-10 12:04:32.214326000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:08:25.582599
494	Order	100	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.663186000000000006198E2\nname: order-6b0cffa3ed\nid: 100\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 18:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: cb207adca8\ncreated_at: 2017-05-10 12:04:32.214326000 Z\nupdated_at: 2017-05-10 12:08:25.582599000 Z\nshipping_address_id: 95\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:12:46.243391
495	Order	101	create	\N	\N	2017-05-10 12:16:14.730443
496	Order	101	update	\N	---\nshipped: new\nid: 101\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-78cf6efbfd\npermalink: d814e5fc15\ncreated_at: 2017-05-10 12:16:14.730443000 Z\nupdated_at: 2017-05-10 12:16:14.730443000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:16:29.767544
497	Order	101	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-78cf6efbfd\nid: 101\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: d814e5fc15\ncreated_at: 2017-05-10 12:16:14.730443000 Z\nupdated_at: 2017-05-10 12:16:29.767544000 Z\nshipping_address_id: 96\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:16:48.707364
498	Order	101	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-78cf6efbfd\nid: 101\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: d814e5fc15\ncreated_at: 2017-05-10 12:16:14.730443000 Z\nupdated_at: 2017-05-10 12:16:48.707364956 Z\nshipping_address_id: 96\nbilling_address_id: \ntoken: JrulV8MZym8xfaYylV6rrg\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:16:50.470392
499	Order	102	create	\N	\N	2017-05-10 12:16:58.713827
940	Order	225	create	\N	\N	2017-05-27 16:37:10.331366
941	Order	226	create	\N	\N	2017-05-27 17:18:38.963001
500	Order	102	update	\N	---\nshipped: new\nid: 102\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-a306de0090\npermalink: bea27eefba\ncreated_at: 2017-05-10 12:16:58.713827000 Z\nupdated_at: 2017-05-10 12:16:58.713827000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:17:13.074517
501	Order	102	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-a306de0090\nid: 102\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: bea27eefba\ncreated_at: 2017-05-10 12:16:58.713827000 Z\nupdated_at: 2017-05-10 12:17:13.074517000 Z\nshipping_address_id: 97\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:17:27.133711
502	Order	103	create	\N	\N	2017-05-10 12:18:41.477793
503	Order	103	update	\N	---\nshipped: new\nid: 103\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-e7fb6f4668\npermalink: 471b899e7e\ncreated_at: 2017-05-10 12:18:41.477793000 Z\nupdated_at: 2017-05-10 12:18:41.477793000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:19:43.517536
509	Order	105	create	\N	\N	2017-05-10 12:24:30.749205
510	Order	105	update	\N	---\nshipped: new\nid: 105\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-07ae73a3c5\npermalink: '2523856565'\ncreated_at: 2017-05-10 12:24:30.749205000 Z\nupdated_at: 2017-05-10 12:24:30.749205000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:24:49.506181
511	Order	105	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-07ae73a3c5\nid: 105\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: '2523856565'\ncreated_at: 2017-05-10 12:24:30.749205000 Z\nupdated_at: 2017-05-10 12:24:49.506181000 Z\nshipping_address_id: 100\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:25:11.256148
512	Order	106	create	\N	\N	2017-05-10 12:25:19.532779
513	Order	106	update	\N	---\nshipped: new\nid: 106\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0668ba0688\npermalink: c160b8e19f\ncreated_at: 2017-05-10 12:25:19.532779000 Z\nupdated_at: 2017-05-10 12:25:19.532779000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:25:55.81797
519	Order	108	create	\N	\N	2017-05-10 12:30:10.458803
504	Order	103	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-e7fb6f4668\nid: 103\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 471b899e7e\ncreated_at: 2017-05-10 12:18:41.477793000 Z\nupdated_at: 2017-05-10 12:19:43.517536000 Z\nshipping_address_id: 98\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:20:31.10771
505	Order	104	create	\N	\N	2017-05-10 12:20:37.692385
506	Order	104	update	\N	---\nshipped: new\nid: 104\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-b9d5529578\npermalink: 42dfe6ef28\ncreated_at: 2017-05-10 12:20:37.692385000 Z\nupdated_at: 2017-05-10 12:20:37.692385000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:20:50.885083
507	Order	104	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-b9d5529578\nid: 104\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 42dfe6ef28\ncreated_at: 2017-05-10 12:20:37.692385000 Z\nupdated_at: 2017-05-10 12:20:50.885083000 Z\nshipping_address_id: 99\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:23:15.251779
508	Order	104	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-b9d5529578\nid: 104\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 42dfe6ef28\ncreated_at: 2017-05-10 12:20:37.692385000 Z\nupdated_at: 2017-05-10 12:23:15.251779382 Z\nshipping_address_id: 99\nbilling_address_id: \ntoken: TPF8JrnrgbFpssT0-iDNMg\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:23:17.869321
514	Order	106	update	\N	---\nshipped: new\nid: 106\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-0668ba0688\npermalink: c160b8e19f\ncreated_at: 2017-05-10 12:25:19.532779000 Z\nupdated_at: 2017-05-10 12:25:55.817970000 Z\nshipping_address_id: 101\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:27:09.826136
515	Order	106	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-0668ba0688\nid: 106\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: c160b8e19f\ncreated_at: 2017-05-10 12:25:19.532779000 Z\nupdated_at: 2017-05-10 12:27:09.826136000 Z\nshipping_address_id: 102\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:27:30.483797
516	Order	107	create	\N	\N	2017-05-10 12:27:41.065947
517	Order	107	update	\N	---\nshipped: new\nid: 107\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-63d07febd9\npermalink: 32a3815708\ncreated_at: 2017-05-10 12:27:41.065947000 Z\nupdated_at: 2017-05-10 12:27:41.065947000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:27:49.191306
518	Order	107	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-63d07febd9\nid: 107\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 32a3815708\ncreated_at: 2017-05-10 12:27:41.065947000 Z\nupdated_at: 2017-05-10 12:27:49.191306000 Z\nshipping_address_id: 103\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:28:00.37775
520	Order	109	create	\N	\N	2017-05-10 12:40:17.751088
942	Order	227	create	\N	\N	2017-05-27 17:57:11.713141
521	Order	109	update	\N	---\nshipped: new\nid: 109\npermalink: c29c842990\nname: order-6e681392e8\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 12:40:17.751088000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:48:56.474663
522	Order	109	update	\N	---\nshipped: new\nid: 109\nprice: !ruby/object:BigDecimal 36:0.2930837000000000027391E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.191737000000000027391E2\nsubtotal: !ruby/object:BigDecimal 18:0.27391E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-6e681392e8\npermalink: c29c842990\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 12:48:56.474663000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:52:11.133753
523	Order	109	update	\N	---\nshipped: new\nid: 109\nprice: !ruby/object:BigDecimal 36:0.2652744000000000024792E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.173544000000000024792E2\nsubtotal: !ruby/object:BigDecimal 18:0.24792E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-6e681392e8\npermalink: c29c842990\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 12:52:11.133753000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:52:12.989584
524	Order	109	update	\N	---\nshipped: new\nid: 109\npermalink: c29c842990\nname: order-6e681392e8\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 12:52:12.989584000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 12:52:28.464168
525	Order	109	update	\N	---\nshipped: new\nid: 109\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6e681392e8\npermalink: c29c842990\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 12:52:28.464168000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:09:41.732685
526	Order	109	update	\N	---\nshipped: new\nid: 109\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6e681392e8\npermalink: c29c842990\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 13:09:41.732685000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: zxczxc@czxc.ccc\norder_otp: \nphone_verified: \n	2017-05-10 13:29:21.415594
529	Order	110	create	\N	\N	2017-05-10 13:45:10.650841
527	Order	109	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-6e681392e8\nid: 109\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: c29c842990\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 13:29:21.415594000 Z\nshipping_address_id: 104\nbilling_address_id: \ntoken: \nemail: zxczxc@czxc.ccc\norder_otp: \nphone_verified: \n	2017-05-10 13:29:46.937926
528	Order	109	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-6e681392e8\nid: 109\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: c29c842990\ncreated_at: 2017-05-10 12:40:17.751088000 Z\nupdated_at: 2017-05-10 13:29:46.937926051 Z\nshipping_address_id: 104\nbilling_address_id: \ntoken: 9FH83MS2bO5HvfTGX5NWLA\nemail: zxczxc@czxc.ccc\norder_otp: \nphone_verified: \n	2017-05-10 13:29:48.531341
532	Order	111	create	\N	\N	2017-05-10 13:46:21.899088
533	Order	111	update	\N	---\nshipped: new\nid: 111\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c5f939e83b\npermalink: 070f05c107\ncreated_at: 2017-05-10 13:46:21.899088000 Z\nupdated_at: 2017-05-10 13:46:21.899088000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:46:37.949269
536	Order	112	create	\N	\N	2017-05-10 13:48:37.185652
530	Order	110	update	\N	---\nshipped: new\nid: 110\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-097991ec62\npermalink: 60871c1d87\ncreated_at: 2017-05-10 13:45:10.650841000 Z\nupdated_at: 2017-05-10 13:45:10.650841000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:45:28.597621
531	Order	110	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-097991ec62\nid: 110\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 60871c1d87\ncreated_at: 2017-05-10 13:45:10.650841000 Z\nupdated_at: 2017-05-10 13:45:28.597621000 Z\nshipping_address_id: 105\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:45:53.452045
534	Order	111	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c5f939e83b\nid: 111\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 070f05c107\ncreated_at: 2017-05-10 13:46:21.899088000 Z\nupdated_at: 2017-05-10 13:46:37.949269000 Z\nshipping_address_id: 106\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:47:03.372389
535	Order	111	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c5f939e83b\nid: 111\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 070f05c107\ncreated_at: 2017-05-10 13:46:21.899088000 Z\nupdated_at: 2017-05-10 13:47:03.372389957 Z\nshipping_address_id: 106\nbilling_address_id: \ntoken: 8PBazDqxnO-5eKta3St2Ow\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:47:08.884142
537	Order	113	create	\N	\N	2017-05-10 13:50:01.498939
538	Order	113	update	\N	---\nshipped: new\nid: 113\npermalink: d19164f506\nname: order-12de2f8407\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 13:50:01.498939000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:54:58.264295
539	Order	113	update	\N	---\nshipped: new\nid: 113\nprice: !ruby/object:BigDecimal 36:0.919879000000000008597E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.60179000000000008597E1\nsubtotal: !ruby/object:BigDecimal 18:0.8597E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-12de2f8407\npermalink: d19164f506\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 13:54:58.264295000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 13:55:27.679043
540	Order	113	update	\N	---\nshipped: new\nid: 113\npermalink: d19164f506\nname: order-12de2f8407\nprice: !ruby/object:BigDecimal 36:0.919879000000000008597E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.60179000000000008597E1\nsubtotal: !ruby/object:BigDecimal 18:0.8597E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 13:55:27.679043000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:15:46.237077
541	Order	113	update	\N	---\nshipped: new\nid: 113\nprice: !ruby/object:BigDecimal 36:0.2192751000000000020493E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.143451000000000020493E2\nsubtotal: !ruby/object:BigDecimal 18:0.20493E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-12de2f8407\npermalink: d19164f506\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:15:46.237077000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:16:15.934807
542	Order	113	update	\N	---\nshipped: new\nid: 113\nprice: !ruby/object:BigDecimal 36:0.1936058000000000018094E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.126658000000000018094E2\nsubtotal: !ruby/object:BigDecimal 18:0.18094E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-12de2f8407\npermalink: d19164f506\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:16:15.934807000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:16:17.747968
543	Order	113	update	\N	---\nshipped: new\nid: 113\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-12de2f8407\npermalink: d19164f506\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:16:17.747968000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:16:19.952614
544	Order	113	update	\N	---\nshipped: new\nid: 113\npermalink: d19164f506\nname: order-12de2f8407\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:16:19.952614000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:16:23.821397
545	Order	113	update	\N	---\nshipped: new\nid: 113\npermalink: d19164f506\nname: order-12de2f8407\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:16:23.821397000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:16:30.26015
546	Order	113	update	\N	---\nshipped: new\nid: 113\npermalink: d19164f506\nname: order-12de2f8407\nprice: !ruby/object:BigDecimal 36:0.609686000000000005698E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.39886000000000005698E1\nsubtotal: !ruby/object:BigDecimal 18:0.5698E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:16:30.260150000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:16:37.354586
547	Order	113	update	\N	---\nshipped: new\nid: 113\nprice: !ruby/object:BigDecimal 36:0.866379000000000008097E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.56679000000000008097E1\nsubtotal: !ruby/object:BigDecimal 18:0.8097E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-12de2f8407\npermalink: d19164f506\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:16:37.354586000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: asdksah@sds.ccc\norder_otp: \nphone_verified: \n	2017-05-10 14:17:57.562597
845	Order	193	update	\N	---\nshipped: new\nid: 193\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-cab3f16369\npermalink: 2f41d1bd5b\ncreated_at: 2017-05-22 10:27:07.080625000 Z\nupdated_at: 2017-05-22 10:27:18.109407000 Z\nshipping_address_id: 177\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 12:59:03.913074
548	Order	113	update	\N	---\nshipped: new\norder_otp: 5352\nid: 113\nprice: !ruby/object:BigDecimal 36:0.1529565000000000014295E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.100065000000000014295E2\nsubtotal: !ruby/object:BigDecimal 18:0.14295E3\nshipping: \nname: order-12de2f8407\npermalink: d19164f506\ncreated_at: 2017-05-10 13:50:01.498939000 Z\nupdated_at: 2017-05-10 14:17:57.562597000 Z\nshipping_address_id: 107\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\nphone_verified: \n	2017-05-10 14:34:21.338638
549	Order	114	create	\N	\N	2017-05-10 14:37:43.954879
550	Order	114	update	\N	---\nshipped: new\nid: 114\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8f3096b670\npermalink: cef37452ec\ncreated_at: 2017-05-10 14:37:43.954879000 Z\nupdated_at: 2017-05-10 14:37:43.954879000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 14:38:10.575957
551	Order	114	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8f3096b670\nid: 114\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: cef37452ec\ncreated_at: 2017-05-10 14:37:43.954879000 Z\nupdated_at: 2017-05-10 14:38:10.575957000 Z\nshipping_address_id: 108\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 14:38:26.796983
552	Order	114	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8f3096b670\nid: 114\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: cef37452ec\ncreated_at: 2017-05-10 14:37:43.954879000 Z\nupdated_at: 2017-05-10 14:38:26.796983687 Z\nshipping_address_id: 108\nbilling_address_id: \ntoken: iMOxzIVfl3s1jXhxtbrDuQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 14:38:28.631699
575	Order	122	update	\N	---\nshipped: new\nid: 122\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8eab7d80d4\npermalink: bed8a99d28\ncreated_at: 2017-05-15 05:57:02.157506000 Z\nupdated_at: 2017-05-15 05:57:02.157506000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 05:59:46.059556
553	Order	114	update	\N	---\nshipped: new\norder_otp: 5223\nid: 114\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8f3096b670\npermalink: cef37452ec\ncreated_at: 2017-05-10 14:37:43.954879000 Z\nupdated_at: 2017-05-10 14:38:28.631699000 Z\nshipping_address_id: 108\nbilling_address_id: \ntoken: iMOxzIVfl3s1jXhxtbrDuQ\nemail: abc@gmail.com\nphone_verified: \n	2017-05-10 14:39:11.465928
554	Order	115	create	\N	\N	2017-05-10 14:48:11.638849
555	Order	116	create	\N	\N	2017-05-10 14:50:15.963626
556	Order	117	create	\N	\N	2017-05-10 14:51:08.871228
557	Order	117	update	\N	---\nshipped: new\nid: 117\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-71e331c9cd\npermalink: 28547091c9\ncreated_at: 2017-05-10 14:51:08.871228000 Z\nupdated_at: 2017-05-10 14:51:08.871228000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 14:54:34.678412
558	Order	117	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-71e331c9cd\nid: 117\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 28547091c9\ncreated_at: 2017-05-10 14:51:08.871228000 Z\nupdated_at: 2017-05-10 14:54:34.678412000 Z\nshipping_address_id: 109\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 14:54:58.850387
559	Order	117	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-71e331c9cd\nid: 117\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 28547091c9\ncreated_at: 2017-05-10 14:51:08.871228000 Z\nupdated_at: 2017-05-10 14:54:58.850387202 Z\nshipping_address_id: 109\nbilling_address_id: \ntoken: 10tFiEn7xJ2G_TClf8YsaA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 14:55:00.72252
560	Order	117	update	\N	---\nshipped: new\norder_otp: 3045\nid: 117\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-71e331c9cd\npermalink: 28547091c9\ncreated_at: 2017-05-10 14:51:08.871228000 Z\nupdated_at: 2017-05-10 14:55:00.722520000 Z\nshipping_address_id: 109\nbilling_address_id: \ntoken: 10tFiEn7xJ2G_TClf8YsaA\nemail: abc@gmail.com\nphone_verified: \n	2017-05-10 14:57:17.582107
561	Order	118	create	\N	\N	2017-05-10 15:22:56.483124
562	Order	118	update	\N	---\nshipped: new\nid: 118\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-00003a7748\npermalink: fee686c55c\ncreated_at: 2017-05-10 15:22:56.483124000 Z\nupdated_at: 2017-05-10 15:22:56.483124000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 15:23:10.32953
563	Order	118	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-00003a7748\nid: 118\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: fee686c55c\ncreated_at: 2017-05-10 15:22:56.483124000 Z\nupdated_at: 2017-05-10 15:23:10.329530000 Z\nshipping_address_id: 110\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 15:25:51.866196
564	Order	118	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-00003a7748\nid: 118\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: fee686c55c\ncreated_at: 2017-05-10 15:22:56.483124000 Z\nupdated_at: 2017-05-10 15:25:51.866196018 Z\nshipping_address_id: 110\nbilling_address_id: \ntoken: 7WwEfajy4WL961y3nKMiAA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-10 15:25:53.504856
565	Order	118	update	\N	---\nshipped: new\norder_otp: 2139\nid: 118\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-00003a7748\npermalink: fee686c55c\ncreated_at: 2017-05-10 15:22:56.483124000 Z\nupdated_at: 2017-05-10 15:25:53.504856000 Z\nshipping_address_id: 110\nbilling_address_id: \ntoken: 7WwEfajy4WL961y3nKMiAA\nemail: abc@gmail.com\nphone_verified: \n	2017-05-10 15:26:52.766884
566	Order	119	create	\N	\N	2017-05-11 10:24:45.634801
567	Order	119	update	\N	---\nshipped: new\nid: 119\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-9d92f97e90\npermalink: 7db64c34b8\ncreated_at: 2017-05-11 10:24:45.634801000 Z\nupdated_at: 2017-05-11 10:24:45.634801000 Z\nshipping_address_id: 110\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-11 11:07:49.760052
846	Order	194	create	\N	\N	2017-05-22 13:00:22.7484
850	Order	196	create	\N	\N	2017-05-22 13:01:55.984291
568	Order	119	update	\N	---\nshipped: new\nid: 119\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-9d92f97e90\npermalink: 7db64c34b8\ncreated_at: 2017-05-11 10:24:45.634801000 Z\nupdated_at: 2017-05-11 11:07:49.760052000 Z\nshipping_address_id: 110\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: 5678\nphone_verified: \n	2017-05-11 11:18:16.865742
569	Order	119	update	\N	---\nshipped: new\norder_otp: 876\nid: 119\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-9d92f97e90\npermalink: 7db64c34b8\ncreated_at: 2017-05-11 10:24:45.634801000 Z\nupdated_at: 2017-05-11 11:18:16.865742000 Z\nshipping_address_id: 110\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\nphone_verified: \n	2017-05-11 11:20:04.696971
570	Order	120	create	\N	\N	2017-05-11 12:56:20.097221
571	Order	121	create	\N	\N	2017-05-15 05:52:38.911565
572	Order	121	update	\N	---\nshipped: new\nid: 121\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-972fa0b363\npermalink: ef35d65b39\ncreated_at: 2017-05-15 05:52:38.911565000 Z\nupdated_at: 2017-05-15 05:52:38.911565000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 05:52:59.123513
573	Order	121	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-972fa0b363\nid: 121\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: ef35d65b39\ncreated_at: 2017-05-15 05:52:38.911565000 Z\nupdated_at: 2017-05-15 05:52:59.123513000 Z\nshipping_address_id: 111\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 05:56:51.567824
576	Order	122	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8eab7d80d4\nid: 122\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: bed8a99d28\ncreated_at: 2017-05-15 05:57:02.157506000 Z\nupdated_at: 2017-05-15 05:59:46.059556000 Z\nshipping_address_id: 112\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:00:41.02094
577	Order	122	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8eab7d80d4\nid: 122\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: bed8a99d28\ncreated_at: 2017-05-15 05:57:02.157506000 Z\nupdated_at: 2017-05-15 06:00:41.020940176 Z\nshipping_address_id: 112\nbilling_address_id: \ntoken: KbacEoTlgDsLBZaQ-XvdEA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:00:45.866179
578	Order	122	update	\N	---\nshipped: new\norder_otp: 5007\nid: 122\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8eab7d80d4\npermalink: bed8a99d28\ncreated_at: 2017-05-15 05:57:02.157506000 Z\nupdated_at: 2017-05-15 06:00:45.866179000 Z\nshipping_address_id: 112\nbilling_address_id: \ntoken: KbacEoTlgDsLBZaQ-XvdEA\nemail: abc@gmail.com\nphone_verified: \n	2017-05-15 06:03:25.845545
579	Order	123	create	\N	\N	2017-05-15 06:04:22.172085
580	Order	123	update	\N	---\nshipped: new\nid: 123\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-eb038e66e0\npermalink: 85ae5bca55\ncreated_at: 2017-05-15 06:04:22.172085000 Z\nupdated_at: 2017-05-15 06:04:22.172085000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:04:36.036313
581	Order	123	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-eb038e66e0\nid: 123\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 85ae5bca55\ncreated_at: 2017-05-15 06:04:22.172085000 Z\nupdated_at: 2017-05-15 06:04:36.036313000 Z\nshipping_address_id: 113\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:05:00.110776
582	Order	123	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-eb038e66e0\nid: 123\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 85ae5bca55\ncreated_at: 2017-05-15 06:04:22.172085000 Z\nupdated_at: 2017-05-15 06:05:00.110776536 Z\nshipping_address_id: 113\nbilling_address_id: \ntoken: _SzBKPuyHIDTlCAtjB1XRQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:05:01.889928
583	Order	123	update	\N	---\nshipped: new\norder_otp: 802\nid: 123\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-eb038e66e0\npermalink: 85ae5bca55\ncreated_at: 2017-05-15 06:04:22.172085000 Z\nupdated_at: 2017-05-15 06:05:01.889928000 Z\nshipping_address_id: 113\nbilling_address_id: \ntoken: _SzBKPuyHIDTlCAtjB1XRQ\nemail: abc@gmail.com\nphone_verified: \n	2017-05-15 06:09:14.252154
584	Order	124	create	\N	\N	2017-05-15 06:09:29.203692
585	Order	124	update	\N	---\nshipped: new\nid: 124\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-ecb1ecb714\npermalink: c6e921500e\ncreated_at: 2017-05-15 06:09:29.203692000 Z\nupdated_at: 2017-05-15 06:09:29.203692000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:09:43.38892
586	Order	124	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-ecb1ecb714\nid: 124\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: c6e921500e\ncreated_at: 2017-05-15 06:09:29.203692000 Z\nupdated_at: 2017-05-15 06:09:43.388920000 Z\nshipping_address_id: 114\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:10:09.478642
587	Order	124	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-ecb1ecb714\nid: 124\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: c6e921500e\ncreated_at: 2017-05-15 06:09:29.203692000 Z\nupdated_at: 2017-05-15 06:10:09.478642716 Z\nshipping_address_id: 114\nbilling_address_id: \ntoken: 9Z5xnwXFcovlH2o38uGvEQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:10:11.969151
588	Order	125	create	\N	\N	2017-05-15 06:18:40.354966
589	Order	125	update	\N	---\nshipped: new\nid: 125\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-9cae3d0204\npermalink: 2b461f8a70\ncreated_at: 2017-05-15 06:18:40.354966000 Z\nupdated_at: 2017-05-15 06:18:40.354966000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:20:27.910105
590	Order	125	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-9cae3d0204\nid: 125\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 2b461f8a70\ncreated_at: 2017-05-15 06:18:40.354966000 Z\nupdated_at: 2017-05-15 06:20:27.910105000 Z\nshipping_address_id: 115\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:25:24.764926
591	Order	125	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-9cae3d0204\nid: 125\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 2b461f8a70\ncreated_at: 2017-05-15 06:18:40.354966000 Z\nupdated_at: 2017-05-15 06:25:24.764926266 Z\nshipping_address_id: 115\nbilling_address_id: \ntoken: pcg2pu4QEvlDwPh0WjAeug\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:25:27.974349
592	Order	126	create	\N	\N	2017-05-15 06:27:38.446259
593	Order	126	update	\N	---\nshipped: new\nid: 126\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-fca38fc1f5\npermalink: ecec5c5e94\ncreated_at: 2017-05-15 06:27:38.446259000 Z\nupdated_at: 2017-05-15 06:27:38.446259000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:27:53.805859
594	Order	126	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-fca38fc1f5\nid: 126\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: ecec5c5e94\ncreated_at: 2017-05-15 06:27:38.446259000 Z\nupdated_at: 2017-05-15 06:27:53.805859000 Z\nshipping_address_id: 116\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:28:16.371788
595	Order	126	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-fca38fc1f5\nid: 126\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: ecec5c5e94\ncreated_at: 2017-05-15 06:27:38.446259000 Z\nupdated_at: 2017-05-15 06:28:16.371788582 Z\nshipping_address_id: 116\nbilling_address_id: \ntoken: rLJhqVjfZ1itgGB8xmjWLQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:28:18.108381
596	Order	127	create	\N	\N	2017-05-15 06:29:25.899624
597	Order	127	update	\N	---\nshipped: new\nid: 127\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-33b834ab61\npermalink: 9b0c3f1dad\ncreated_at: 2017-05-15 06:29:25.899624000 Z\nupdated_at: 2017-05-15 06:29:25.899624000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:38:34.528922
598	Order	127	update	\N	---\nshipped: new\norder_otp: 5218\nid: 127\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-33b834ab61\npermalink: 9b0c3f1dad\ncreated_at: 2017-05-15 06:29:25.899624000 Z\nupdated_at: 2017-05-15 06:38:34.528922000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\nphone_verified: \n	2017-05-15 06:40:06.097789
599	Order	128	create	\N	\N	2017-05-15 06:40:55.736576
600	Order	128	update	\N	---\nshipped: new\nid: 128\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6ad09a12ec\npermalink: bc66ec7d59\ncreated_at: 2017-05-15 06:40:55.736576000 Z\nupdated_at: 2017-05-15 06:40:55.736576000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:41:12.774225
601	Order	128	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-6ad09a12ec\nid: 128\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: bc66ec7d59\ncreated_at: 2017-05-15 06:40:55.736576000 Z\nupdated_at: 2017-05-15 06:41:12.774225000 Z\nshipping_address_id: 117\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:41:43.135235
602	Order	128	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-6ad09a12ec\nid: 128\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: bc66ec7d59\ncreated_at: 2017-05-15 06:40:55.736576000 Z\nupdated_at: 2017-05-15 06:41:43.135235809 Z\nshipping_address_id: 117\nbilling_address_id: \ntoken: 3FnSW_ulr3Z1Gbbtp2HmIA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:41:47.085448
603	Order	129	create	\N	\N	2017-05-15 06:42:20.889966
604	Order	130	create	\N	\N	2017-05-15 06:49:30.557455
605	Order	130	update	\N	---\nshipped: new\nid: 130\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-3de5ef56ed\npermalink: 9a0ecb3442\ncreated_at: 2017-05-15 06:49:30.557455000 Z\nupdated_at: 2017-05-15 06:49:30.557455000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:50:23.289091
606	Order	130	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-3de5ef56ed\nid: 130\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9a0ecb3442\ncreated_at: 2017-05-15 06:49:30.557455000 Z\nupdated_at: 2017-05-15 06:50:23.289091000 Z\nshipping_address_id: 118\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:51:19.439956
607	Order	130	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-3de5ef56ed\nid: 130\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9a0ecb3442\ncreated_at: 2017-05-15 06:49:30.557455000 Z\nupdated_at: 2017-05-15 06:51:19.439956533 Z\nshipping_address_id: 118\nbilling_address_id: \ntoken: _d1or0lhn7CaWzRBXx-9Wg\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-15 06:51:21.324221
608	Order	131	create	\N	\N	2017-05-15 06:51:50.985095
609	Order	132	create	\N	\N	2017-05-15 07:01:05.495411
610	Order	133	create	\N	\N	2017-05-15 07:03:48.985959
611	Order	130	update	\N	---\nshipped: new\nid: 130\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-3de5ef56ed\npermalink: 9a0ecb3442\ncreated_at: 2017-05-15 06:49:30.557455000 Z\nupdated_at: 2017-05-15 06:51:21.324221000 Z\nshipping_address_id: 118\nbilling_address_id: \ntoken: _d1or0lhn7CaWzRBXx-9Wg\nemail: abc@gmail.com\norder_otp: 2244\nphone_verified: \n	2017-05-15 07:05:08.917809
612	Order	130	update	\N	---\nshipped: new\norder_otp: 7785\nid: 130\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-3de5ef56ed\npermalink: 9a0ecb3442\ncreated_at: 2017-05-15 06:49:30.557455000 Z\nupdated_at: 2017-05-15 07:05:08.917809000 Z\nshipping_address_id: 118\nbilling_address_id: \ntoken: _d1or0lhn7CaWzRBXx-9Wg\nemail: abc@gmail.com\nphone_verified: \n	2017-05-15 07:06:22.594532
613	Order	134	create	\N	\N	2017-05-15 07:06:56.781324
614	Order	135	create	\N	\N	2017-05-15 07:10:10.944931
615	Order	136	create	\N	\N	2017-05-15 10:50:15.44749
616	Order	136	update	\N	---\nshipped: new\nid: 136\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8d178761be\npermalink: 9dce5773eb\ncreated_at: 2017-05-15 10:50:15.447490000 Z\nupdated_at: 2017-05-15 10:50:15.447490000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 04:31:44.746133
617	Order	136	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-8d178761be\nid: 136\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9dce5773eb\ncreated_at: 2017-05-15 10:50:15.447490000 Z\nupdated_at: 2017-05-16 04:31:44.746133000 Z\nshipping_address_id: 119\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 04:35:09.281241
618	Order	136	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-8d178761be\nid: 136\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9dce5773eb\ncreated_at: 2017-05-15 10:50:15.447490000 Z\nupdated_at: 2017-05-16 04:35:09.281241457 Z\nshipping_address_id: 119\nbilling_address_id: \ntoken: kjP1_osJVJCbC-rtZIiMdA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 04:35:14.447331
619	Order	136	update	\N	---\nshipped: new\nid: 136\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8d178761be\npermalink: 9dce5773eb\ncreated_at: 2017-05-15 10:50:15.447490000 Z\nupdated_at: 2017-05-16 04:35:14.447331000 Z\nshipping_address_id: 119\nbilling_address_id: \ntoken: kjP1_osJVJCbC-rtZIiMdA\nemail: abc@gmail.com\norder_otp: 9709\nphone_verified: \n	2017-05-16 04:36:33.649226
620	Order	136	update	\N	---\nshipped: new\norder_otp: 7003\nid: 136\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8d178761be\npermalink: 9dce5773eb\ncreated_at: 2017-05-15 10:50:15.447490000 Z\nupdated_at: 2017-05-16 04:36:33.649226000 Z\nshipping_address_id: 119\nbilling_address_id: \ntoken: kjP1_osJVJCbC-rtZIiMdA\nemail: abc@gmail.com\nphone_verified: \n	2017-05-16 04:37:37.813003
621	Order	137	create	\N	\N	2017-05-16 04:38:11.883997
622	Order	137	update	\N	---\nshipped: new\nid: 137\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2277da9c0a\npermalink: 62c6518336\ncreated_at: 2017-05-16 04:38:11.883997000 Z\nupdated_at: 2017-05-16 04:38:11.883997000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 05:59:44.662478
623	Order	137	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-2277da9c0a\nid: 137\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 62c6518336\ncreated_at: 2017-05-16 04:38:11.883997000 Z\nupdated_at: 2017-05-16 05:59:44.662478000 Z\nshipping_address_id: 120\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:01:07.383135
624	Order	138	create	\N	\N	2017-05-16 06:03:34.409367
625	Order	138	update	\N	---\nshipped: new\nid: 138\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c09fa1446d\npermalink: 34410d66f6\ncreated_at: 2017-05-16 06:03:34.409367000 Z\nupdated_at: 2017-05-16 06:03:34.409367000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:03:43.126957
626	Order	138	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c09fa1446d\nid: 138\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 34410d66f6\ncreated_at: 2017-05-16 06:03:34.409367000 Z\nupdated_at: 2017-05-16 06:03:43.126957000 Z\nshipping_address_id: 121\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:04:24.175112
627	Order	139	create	\N	\N	2017-05-16 06:04:41.994606
628	Order	139	update	\N	---\nshipped: new\nid: 139\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-7c68d4a403\npermalink: 122d214be7\ncreated_at: 2017-05-16 06:04:41.994606000 Z\nupdated_at: 2017-05-16 06:04:41.994606000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:04:51.280128
630	Order	140	create	\N	\N	2017-05-16 06:07:34.499229
629	Order	139	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-7c68d4a403\nid: 139\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 122d214be7\ncreated_at: 2017-05-16 06:04:41.994606000 Z\nupdated_at: 2017-05-16 06:04:51.280128000 Z\nshipping_address_id: 122\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:05:40.751378
631	Order	140	update	\N	---\nshipped: new\nid: 140\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-3dc2018139\npermalink: c80c42eefd\ncreated_at: 2017-05-16 06:07:34.499229000 Z\nupdated_at: 2017-05-16 06:07:34.499229000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:09:18.304561
632	Order	140	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-3dc2018139\nid: 140\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: c80c42eefd\ncreated_at: 2017-05-16 06:07:34.499229000 Z\nupdated_at: 2017-05-16 06:09:18.304561000 Z\nshipping_address_id: 123\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:22:11.757363
633	Order	140	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-3dc2018139\nid: 140\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: c80c42eefd\ncreated_at: 2017-05-16 06:07:34.499229000 Z\nupdated_at: 2017-05-16 06:22:11.757363209 Z\nshipping_address_id: 123\nbilling_address_id: \ntoken: aOgjjtw5kP94kUijaivJMQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:22:13.645568
634	Order	141	create	\N	\N	2017-05-16 06:22:25.315379
635	Order	141	update	\N	---\nshipped: new\nid: 141\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0b949ffd14\npermalink: f6340dae26\ncreated_at: 2017-05-16 06:22:25.315379000 Z\nupdated_at: 2017-05-16 06:22:25.315379000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:22:37.888189
636	Order	141	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-0b949ffd14\nid: 141\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: f6340dae26\ncreated_at: 2017-05-16 06:22:25.315379000 Z\nupdated_at: 2017-05-16 06:22:37.888189000 Z\nshipping_address_id: 124\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:23:02.751269
637	Order	141	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-0b949ffd14\nid: 141\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: f6340dae26\ncreated_at: 2017-05-16 06:22:25.315379000 Z\nupdated_at: 2017-05-16 06:23:02.751269568 Z\nshipping_address_id: 124\nbilling_address_id: \ntoken: 0WwIo8GHylyR5nugjoOWbQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:23:07.784214
638	Order	141	update	\N	---\nshipped: new\nid: 141\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-0b949ffd14\npermalink: f6340dae26\ncreated_at: 2017-05-16 06:22:25.315379000 Z\nupdated_at: 2017-05-16 06:23:07.784214000 Z\nshipping_address_id: 124\nbilling_address_id: \ntoken: 0WwIo8GHylyR5nugjoOWbQ\nemail: abc@gmail.com\norder_otp: 5324\nphone_verified: \n	2017-05-16 06:23:59.008012
639	Order	141	update	\N	---\nshipped: new\norder_otp: 1549\nid: 141\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-0b949ffd14\npermalink: f6340dae26\ncreated_at: 2017-05-16 06:22:25.315379000 Z\nupdated_at: 2017-05-16 06:23:59.008012000 Z\nshipping_address_id: 124\nbilling_address_id: \ntoken: 0WwIo8GHylyR5nugjoOWbQ\nemail: abc@gmail.com\nphone_verified: \n	2017-05-16 06:24:54.536719
640	Order	142	create	\N	\N	2017-05-16 06:26:59.836186
641	Order	142	update	\N	---\nshipped: new\nid: 142\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-15a42559c7\npermalink: ce513ab3a5\ncreated_at: 2017-05-16 06:26:59.836186000 Z\nupdated_at: 2017-05-16 06:26:59.836186000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:36:15.575173
642	Order	142	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-15a42559c7\nid: 142\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: ce513ab3a5\ncreated_at: 2017-05-16 06:26:59.836186000 Z\nupdated_at: 2017-05-16 06:36:15.575173000 Z\nshipping_address_id: 125\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:36:51.862495
643	Order	142	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-15a42559c7\nid: 142\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: ce513ab3a5\ncreated_at: 2017-05-16 06:26:59.836186000 Z\nupdated_at: 2017-05-16 06:36:51.862495436 Z\nshipping_address_id: 125\nbilling_address_id: \ntoken: "-v9zKcTuVYIEiWnauMB6iw"\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:36:53.583068
644	Order	143	create	\N	\N	2017-05-16 06:37:00.909693
645	Order	143	update	\N	---\nshipped: new\nid: 143\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-1fd1f5d19c\npermalink: 92ab1d13d8\ncreated_at: 2017-05-16 06:37:00.909693000 Z\nupdated_at: 2017-05-16 06:37:00.909693000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:41:09.809205
646	Order	143	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-1fd1f5d19c\nid: 143\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 92ab1d13d8\ncreated_at: 2017-05-16 06:37:00.909693000 Z\nupdated_at: 2017-05-16 06:41:09.809205000 Z\nshipping_address_id: 126\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:42:04.89178
647	Order	143	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-1fd1f5d19c\nid: 143\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: 92ab1d13d8\ncreated_at: 2017-05-16 06:37:00.909693000 Z\nupdated_at: 2017-05-16 06:42:04.891780674 Z\nshipping_address_id: 126\nbilling_address_id: \ntoken: D_huVA9K_z66fnsMC7f6DQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:42:07.210175
648	Order	144	create	\N	\N	2017-05-16 06:42:12.588804
649	Order	144	update	\N	---\nshipped: new\nid: 144\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-5edbf2babe\npermalink: e811e25536\ncreated_at: 2017-05-16 06:42:12.588804000 Z\nupdated_at: 2017-05-16 06:42:12.588804000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:43:42.130905
650	Order	144	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-5edbf2babe\nid: 144\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: e811e25536\ncreated_at: 2017-05-16 06:42:12.588804000 Z\nupdated_at: 2017-05-16 06:43:42.130905000 Z\nshipping_address_id: 127\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:44:20.579081
651	Order	144	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-5edbf2babe\nid: 144\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: e811e25536\ncreated_at: 2017-05-16 06:42:12.588804000 Z\nupdated_at: 2017-05-16 06:44:20.579081650 Z\nshipping_address_id: 127\nbilling_address_id: \ntoken: mkGlJlVlFqwGlFs1CfR27w\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:44:23.869083
652	Order	145	create	\N	\N	2017-05-16 06:44:27.08154
653	Order	145	update	\N	---\nshipped: new\nid: 145\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-282e10738d\npermalink: cc9cb8a0eb\ncreated_at: 2017-05-16 06:44:27.081540000 Z\nupdated_at: 2017-05-16 06:44:27.081540000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:53:35.090818
654	Order	145	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-282e10738d\nid: 145\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \npermalink: cc9cb8a0eb\ncreated_at: 2017-05-16 06:44:27.081540000 Z\nupdated_at: 2017-05-16 06:53:35.090818000 Z\nshipping_address_id: 128\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:54:13.080241
655	Order	146	create	\N	\N	2017-05-16 06:54:20.076149
656	Order	146	update	\N	---\nshipped: new\nid: 146\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-7ec6ccbf49\npermalink: 45c9ba6e5b\ncreated_at: 2017-05-16 06:54:20.076149000 Z\nupdated_at: 2017-05-16 06:54:20.076149000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:57:26.958555
657	Order	146	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-7ec6ccbf49\nid: 146\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \npermalink: 45c9ba6e5b\ncreated_at: 2017-05-16 06:54:20.076149000 Z\nupdated_at: 2017-05-16 06:57:26.958555000 Z\nshipping_address_id: 129\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:57:51.332615
658	Order	146	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-7ec6ccbf49\nid: 146\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \npermalink: 45c9ba6e5b\ncreated_at: 2017-05-16 06:54:20.076149000 Z\nupdated_at: 2017-05-16 06:57:51.332615063 Z\nshipping_address_id: 129\nbilling_address_id: \ntoken: 8QXn4bx-BXDfITLO0WppIw\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:57:53.322162
659	Order	147	create	\N	\N	2017-05-16 06:58:01.327076
660	Order	147	update	\N	---\nshipped: new\nid: 147\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-86b3ed96b2\npermalink: f54181a22a\ncreated_at: 2017-05-16 06:58:01.327076000 Z\nupdated_at: 2017-05-16 06:58:01.327076000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 06:58:15.479869
661	Order	147	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-86b3ed96b2\nid: 147\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: f54181a22a\ncreated_at: 2017-05-16 06:58:01.327076000 Z\nupdated_at: 2017-05-16 06:58:15.479869000 Z\nshipping_address_id: 130\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:00:15.440843
662	Order	147	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-86b3ed96b2\nid: 147\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: f54181a22a\ncreated_at: 2017-05-16 06:58:01.327076000 Z\nupdated_at: 2017-05-16 07:00:15.440843710 Z\nshipping_address_id: 130\nbilling_address_id: \ntoken: za3EYl5wj6DbESJawwbi5w\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:00:17.499761
663	Order	147	update	\N	---\nshipped: new\norder_otp: 5967\nid: 147\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-86b3ed96b2\npermalink: f54181a22a\ncreated_at: 2017-05-16 06:58:01.327076000 Z\nupdated_at: 2017-05-16 07:00:17.499761000 Z\nshipping_address_id: 130\nbilling_address_id: \ntoken: za3EYl5wj6DbESJawwbi5w\nemail: abc@gmail.com\nphone_verified: \n	2017-05-16 07:00:52.72766
664	Order	148	create	\N	\N	2017-05-16 07:00:59.412217
665	Order	148	update	\N	---\nshipped: new\nid: 148\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2859988716\npermalink: 8e423a6d08\ncreated_at: 2017-05-16 07:00:59.412217000 Z\nupdated_at: 2017-05-16 07:00:59.412217000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:01:09.157645
666	Order	148	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-2859988716\nid: 148\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 8e423a6d08\ncreated_at: 2017-05-16 07:00:59.412217000 Z\nupdated_at: 2017-05-16 07:01:09.157645000 Z\nshipping_address_id: 131\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:01:35.195147
667	Order	149	create	\N	\N	2017-05-16 07:01:47.398295
668	Order	147	update	\N	---\nshipped: new\nid: 147\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-86b3ed96b2\npermalink: f54181a22a\ncreated_at: 2017-05-16 06:58:01.327076000 Z\nupdated_at: 2017-05-16 07:00:52.727660000 Z\nshipping_address_id: 130\nbilling_address_id: \ntoken: za3EYl5wj6DbESJawwbi5w\nemail: abc@gmail.com\norder_otp: 5967\nphone_verified: true\n	2017-05-16 07:03:21.320705
669	Order	149	update	\N	---\nshipped: new\norder_otp: 9555\nid: 149\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-425215bd26\npermalink: 56c26a9048\ncreated_at: 2017-05-16 07:01:47.398295000 Z\nupdated_at: 2017-05-16 07:01:47.398295000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\nphone_verified: \n	2017-05-16 07:09:29.975249
670	Order	149	update	\N	---\nshipped: new\nid: 149\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-425215bd26\npermalink: 56c26a9048\ncreated_at: 2017-05-16 07:01:47.398295000 Z\nupdated_at: 2017-05-16 07:09:29.975249000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: 9555\nphone_verified: true\n	2017-05-16 07:09:50.384532
671	Order	149	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-425215bd26\nid: 149\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 56c26a9048\ncreated_at: 2017-05-16 07:01:47.398295000 Z\nupdated_at: 2017-05-16 07:09:50.384532000 Z\nshipping_address_id: 132\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: 9555\nphone_verified: true\n	2017-05-16 07:10:12.855667
672	Order	150	create	\N	\N	2017-05-16 07:10:18.966154
673	Order	150	update	\N	---\nshipped: new\nid: 150\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0101686763\npermalink: fd185a0e67\ncreated_at: 2017-05-16 07:10:18.966154000 Z\nupdated_at: 2017-05-16 07:10:18.966154000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:29:14.423158
674	Order	150	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-0101686763\nid: 150\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: \npermalink: fd185a0e67\ncreated_at: 2017-05-16 07:10:18.966154000 Z\nupdated_at: 2017-05-16 07:29:14.423158000 Z\nshipping_address_id: 133\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:29:42.91479
675	Order	151	create	\N	\N	2017-05-16 07:29:56.583799
676	Order	151	update	\N	---\nshipped: new\nid: 151\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-a7c51ff07c\npermalink: 84e98b9e37\ncreated_at: 2017-05-16 07:29:56.583799000 Z\nupdated_at: 2017-05-16 07:29:56.583799000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:30:50.667131
677	Order	151	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-a7c51ff07c\nid: 151\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 84e98b9e37\ncreated_at: 2017-05-16 07:29:56.583799000 Z\nupdated_at: 2017-05-16 07:30:50.667131000 Z\nshipping_address_id: 134\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:31:34.248299
678	Order	151	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-a7c51ff07c\nid: 151\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 84e98b9e37\ncreated_at: 2017-05-16 07:29:56.583799000 Z\nupdated_at: 2017-05-16 07:31:34.248299551 Z\nshipping_address_id: 134\nbilling_address_id: \ntoken: y33_jv_d8wY3EvecFQr9aQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:31:36.222264
679	Order	152	create	\N	\N	2017-05-16 07:32:22.907229
680	Order	152	update	\N	---\nshipped: new\nid: 152\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-91b65762c8\npermalink: ec42e3a55c\ncreated_at: 2017-05-16 07:32:22.907229000 Z\nupdated_at: 2017-05-16 07:32:22.907229000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:32:39.477184
681	Order	152	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-91b65762c8\nid: 152\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: ec42e3a55c\ncreated_at: 2017-05-16 07:32:22.907229000 Z\nupdated_at: 2017-05-16 07:32:39.477184000 Z\nshipping_address_id: 135\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:33:01.984659
682	Order	152	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-91b65762c8\nid: 152\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: ec42e3a55c\ncreated_at: 2017-05-16 07:32:22.907229000 Z\nupdated_at: 2017-05-16 07:33:01.984659339 Z\nshipping_address_id: 135\nbilling_address_id: \ntoken: 9w1jmjK4fwnpyWECyQoLXA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:33:04.272596
683	Order	147	update	\N	---\nshipped: new\nid: 147\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-86b3ed96b2\npermalink: f54181a22a\ncreated_at: 2017-05-16 06:58:01.327076000 Z\nupdated_at: 2017-05-16 07:03:21.320705000 Z\nshipping_address_id: 130\nbilling_address_id: \ntoken: za3EYl5wj6DbESJawwbi5w\nemail: abc@gmail.com\norder_otp: 9555\nphone_verified: true\n	2017-05-16 07:33:43.495837
684	Order	152	update	\N	---\nshipped: new\nid: 152\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-91b65762c8\npermalink: ec42e3a55c\ncreated_at: 2017-05-16 07:32:22.907229000 Z\nupdated_at: 2017-05-16 07:33:04.272596000 Z\nshipping_address_id: 135\nbilling_address_id: \ntoken: 9w1jmjK4fwnpyWECyQoLXA\nemail: abc@gmail.com\norder_otp: 5470\nphone_verified: \n	2017-05-16 07:34:08.288167
685	Order	152	update	\N	---\nshipped: new\norder_otp: 326\nid: 152\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-91b65762c8\npermalink: ec42e3a55c\ncreated_at: 2017-05-16 07:32:22.907229000 Z\nupdated_at: 2017-05-16 07:34:08.288167000 Z\nshipping_address_id: 135\nbilling_address_id: \ntoken: 9w1jmjK4fwnpyWECyQoLXA\nemail: abc@gmail.com\nphone_verified: \n	2017-05-16 07:34:32.246886
686	Order	153	create	\N	\N	2017-05-16 07:34:37.600735
687	Order	153	update	\N	---\nshipped: new\nid: 153\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-61ff6c4911\npermalink: cd0dd667ba\ncreated_at: 2017-05-16 07:34:37.600735000 Z\nupdated_at: 2017-05-16 07:34:37.600735000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:34:45.499098
688	Order	153	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-61ff6c4911\nid: 153\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: cd0dd667ba\ncreated_at: 2017-05-16 07:34:37.600735000 Z\nupdated_at: 2017-05-16 07:34:45.499098000 Z\nshipping_address_id: 136\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:35:06.861253
689	Order	154	create	\N	\N	2017-05-16 07:48:30.638583
690	Order	154	update	\N	---\nshipped: new\nid: 154\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-54d3d1f8cd\npermalink: 7512f98c20\ncreated_at: 2017-05-16 07:48:30.638583000 Z\nupdated_at: 2017-05-16 07:48:30.638583000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-16 07:49:11.932983
691	Order	155	create	\N	\N	2017-05-17 05:22:56.183145
692	Order	155	update	\N	---\nshipped: new\nid: 155\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-502f914fda\npermalink: c853ac1081\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:22:56.183145000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:23:17.702191
693	Order	156	create	\N	\N	2017-05-17 05:26:19.386557
694	Order	156	update	\N	---\nshipped: new\nid: 156\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2e674208cc\npermalink: c92fb10587\ncreated_at: 2017-05-17 05:26:19.386557000 Z\nupdated_at: 2017-05-17 05:26:19.386557000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:26:48.403799
695	Order	155	update	\N	---\nshipped: new\nid: 155\npermalink: c853ac1081\nname: order-502f914fda\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:23:17.702191000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:37:58.986622
696	Order	155	update	\N	---\nshipped: new\nid: 155\nprice: !ruby/object:BigDecimal 36:0.1251472000000000011696E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.81872000000000011696E1\nsubtotal: !ruby/object:BigDecimal 18:0.11696E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-502f914fda\npermalink: c853ac1081\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:37:58.986622000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:38:05.963987
697	Order	155	update	\N	---\nshipped: new\nid: 155\npermalink: c853ac1081\nname: order-502f914fda\nprice: !ruby/object:BigDecimal 36:0.256693000000000002399E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.16793000000000002399E1\nsubtotal: !ruby/object:BigDecimal 18:0.2399E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:38:05.963987000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:41:26.230798
698	Order	155	update	\N	---\nshipped: new\nid: 155\nprice: !ruby/object:BigDecimal 36:0.534786000000000004998E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.34986000000000004998E1\nsubtotal: !ruby/object:BigDecimal 18:0.4998E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-502f914fda\npermalink: c853ac1081\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:41:26.230798000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:41:30.894606
699	Order	156	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\nname: order-2e674208cc\nid: 156\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: c92fb10587\ncreated_at: 2017-05-17 05:26:19.386557000 Z\nupdated_at: 2017-05-17 05:26:48.403799000 Z\nshipping_address_id: 139\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:45:50.382567
700	Order	156	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-2e674208cc\nid: 156\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: c92fb10587\ncreated_at: 2017-05-17 05:26:19.386557000 Z\nupdated_at: 2017-05-17 05:45:50.382567425 Z\nshipping_address_id: 139\nbilling_address_id: \ntoken: F53GdEFM9FjVB2iMlKSDEQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:45:52.56997
701	Order	155	update	\N	---\nshipped: new\nid: 155\npermalink: c853ac1081\nname: order-502f914fda\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:41:30.894606000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:46:22.999169
702	Order	155	update	\N	---\nshipped: new\nid: 155\nprice: !ruby/object:BigDecimal 36:0.609686000000000005698E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.39886000000000005698E1\nsubtotal: !ruby/object:BigDecimal 18:0.5698E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-502f914fda\npermalink: c853ac1081\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:46:22.999169000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:47:04.442045
703	Order	155	update	\N	---\nshipped: new\nid: 155\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-502f914fda\npermalink: c853ac1081\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:47:04.442045000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:47:06.286148
704	Order	155	update	\N	---\nshipped: new\nid: 155\npermalink: c853ac1081\nname: order-502f914fda\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:47:06.286148000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:47:09.451785
705	Order	155	update	\N	---\nshipped: new\nid: 155\nprice: !ruby/object:BigDecimal 36:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 18:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-502f914fda\npermalink: c853ac1081\ncreated_at: 2017-05-17 05:22:56.183145000 Z\nupdated_at: 2017-05-17 05:47:09.451785000 Z\nshipping_address_id: 138\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:47:27.657895
706	Order	157	create	\N	\N	2017-05-17 05:48:15.279302
707	Order	157	update	\N	---\nshipped: new\nid: 157\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-44fc08f7da\npermalink: bf8b2fb001\ncreated_at: 2017-05-17 05:48:15.279302000 Z\nupdated_at: 2017-05-17 05:48:15.279302000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:51:17.741371
708	Order	158	create	\N	\N	2017-05-17 05:52:02.521171
709	Order	158	update	\N	---\nshipped: new\nid: 158\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-fe0839c627\npermalink: 9247d5d293\ncreated_at: 2017-05-17 05:52:02.521171000 Z\nupdated_at: 2017-05-17 05:52:02.521171000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 05:52:14.351552
710	Order	159	create	\N	\N	2017-05-17 05:59:54.072435
711	Order	159	update	\N	---\nshipped: new\nid: 159\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2b3beb8146\npermalink: 29e75dee29\ncreated_at: 2017-05-17 05:59:54.072435000 Z\nupdated_at: 2017-05-17 05:59:54.072435000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:00:09.928099
712	Order	159	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\nname: order-2b3beb8146\nid: 159\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 29e75dee29\ncreated_at: 2017-05-17 05:59:54.072435000 Z\nupdated_at: 2017-05-17 06:00:09.928099000 Z\nshipping_address_id: 142\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:00:40.106909
713	Order	159	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-2b3beb8146\nid: 159\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 29e75dee29\ncreated_at: 2017-05-17 05:59:54.072435000 Z\nupdated_at: 2017-05-17 06:00:40.106909353 Z\nshipping_address_id: 142\nbilling_address_id: \ntoken: d6Plaau6FTZjxYji0hzicw\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:00:42.233112
714	Order	160	create	\N	\N	2017-05-17 06:00:46.00507
715	Order	160	update	\N	---\nshipped: new\nid: 160\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-5f82932c46\npermalink: '8929661189'\ncreated_at: 2017-05-17 06:00:46.005070000 Z\nupdated_at: 2017-05-17 06:00:46.005070000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:00:57.566664
716	Order	161	create	\N	\N	2017-05-17 06:01:15.992167
717	Order	161	update	\N	---\nshipped: new\nid: 161\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-7e9d811109\npermalink: 8e4b9aa4ad\ncreated_at: 2017-05-17 06:01:15.992167000 Z\nupdated_at: 2017-05-17 06:01:15.992167000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:01:29.32278
718	Order	162	create	\N	\N	2017-05-17 06:10:02.848559
719	Order	162	update	\N	---\nshipped: new\nid: 162\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-7eb87a7c1c\npermalink: efed34c9a7\ncreated_at: 2017-05-17 06:10:02.848559000 Z\nupdated_at: 2017-05-17 06:10:02.848559000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:10:14.576175
720	Order	163	create	\N	\N	2017-05-17 06:10:27.250736
721	Order	163	update	\N	---\nshipped: new\nid: 163\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-870c1b562b\npermalink: 6cea9ebff8\ncreated_at: 2017-05-17 06:10:27.250736000 Z\nupdated_at: 2017-05-17 06:10:27.250736000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:10:35.766544
722	Order	164	create	\N	\N	2017-05-17 06:24:52.368783
723	Order	164	update	\N	---\nshipped: new\nid: 164\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0d98eaac7d\npermalink: 1c49228d65\ncreated_at: 2017-05-17 06:24:52.368783000 Z\nupdated_at: 2017-05-17 06:24:52.368783000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:25:37.343252
724	Order	163	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\nname: order-870c1b562b\nid: 163\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 6cea9ebff8\ncreated_at: 2017-05-17 06:10:27.250736000 Z\nupdated_at: 2017-05-17 06:10:35.766544000 Z\nshipping_address_id: 146\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:31:01.863952
725	Order	163	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-870c1b562b\nid: 163\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: 6cea9ebff8\ncreated_at: 2017-05-17 06:10:27.250736000 Z\nupdated_at: 2017-05-17 06:31:01.863952664 Z\nshipping_address_id: 146\nbilling_address_id: \ntoken: bMrZTtTzUSjr__vuJ61kGA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:31:04.142125
726	Order	165	create	\N	\N	2017-05-17 06:32:45.890496
727	Order	165	update	\N	---\nshipped: new\nid: 165\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-e58437cece\npermalink: 761505862c\ncreated_at: 2017-05-17 06:32:45.890496000 Z\nupdated_at: 2017-05-17 06:32:45.890496000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 06:32:58.989753
728	Order	166	create	\N	\N	2017-05-17 08:31:23.599122
729	Order	166	update	\N	---\nshipped: new\nid: 166\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c2705e4082\npermalink: f6458e3645\ncreated_at: 2017-05-17 08:31:23.599122000 Z\nupdated_at: 2017-05-17 08:31:23.599122000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 08:31:40.33054
943	Order	227	update	\N	---\nshipped: new\nid: 227\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-67ec7f26ae\npermalink: 796769db7d\ncreated_at: 2017-05-27 17:57:11.713141000 Z\nupdated_at: 2017-05-27 17:57:11.713141000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 17:57:41.447588
730	Order	166	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c2705e4082\nid: 166\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: f6458e3645\ncreated_at: 2017-05-17 08:31:23.599122000 Z\nupdated_at: 2017-05-17 08:31:40.330540000 Z\nshipping_address_id: 149\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 08:32:05.594229
731	Order	166	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c2705e4082\nid: 166\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: f6458e3645\ncreated_at: 2017-05-17 08:31:23.599122000 Z\nupdated_at: 2017-05-17 08:32:05.594229078 Z\nshipping_address_id: 149\nbilling_address_id: \ntoken: 1McrEsoOl3P5owo4oIa_og\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 08:32:09.021465
732	Order	167	create	\N	\N	2017-05-17 08:32:25.188339
733	Order	167	update	\N	---\nshipped: new\nid: 167\nprice: !ruby/object:BigDecimal 45:0.278093000000000002599E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-6335f8c468\npermalink: 288b7c5d23\ncreated_at: 2017-05-17 08:32:25.188339000 Z\nupdated_at: 2017-05-17 08:32:25.188339000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 08:32:37.264481
734	Order	167	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.278093000000000002599E2\nname: order-6335f8c468\nid: 167\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 288b7c5d23\ncreated_at: 2017-05-17 08:32:25.188339000 Z\nupdated_at: 2017-05-17 08:32:37.264481000 Z\nshipping_address_id: 150\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 08:32:53.785804
735	Order	167	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.278093000000000002599E2\nname: order-6335f8c468\nid: 167\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 288b7c5d23\ncreated_at: 2017-05-17 08:32:25.188339000 Z\nupdated_at: 2017-05-17 08:32:53.785804686 Z\nshipping_address_id: 150\nbilling_address_id: \ntoken: cwg08eX8IsnVAT5kjsHsWQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 08:32:55.452855
736	Order	167	update	\N	---\nshipped: new\nid: 167\nprice: !ruby/object:BigDecimal 45:0.278093000000000002599E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-6335f8c468\npermalink: 288b7c5d23\ncreated_at: 2017-05-17 08:32:25.188339000 Z\nupdated_at: 2017-05-17 08:32:55.452855000 Z\nshipping_address_id: 150\nbilling_address_id: \ntoken: cwg08eX8IsnVAT5kjsHsWQ\nemail: abc@gmail.com\norder_otp: 3205\nphone_verified: \n	2017-05-17 08:33:55.131491
737	Order	167	update	\N	---\nshipped: new\norder_otp: 3598\nid: 167\nprice: !ruby/object:BigDecimal 45:0.278093000000000002599E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.18193000000000002599E1\nsubtotal: !ruby/object:BigDecimal 36:0.2599E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-6335f8c468\npermalink: 288b7c5d23\ncreated_at: 2017-05-17 08:32:25.188339000 Z\nupdated_at: 2017-05-17 08:33:55.131491000 Z\nshipping_address_id: 150\nbilling_address_id: \ntoken: cwg08eX8IsnVAT5kjsHsWQ\nemail: abc@gmail.com\nphone_verified: \n	2017-05-17 08:34:19.070497
738	Order	168	create	\N	\N	2017-05-17 09:47:28.236918
739	Order	168	update	\N	---\nshipped: new\nid: 168\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-4f5f0858a5\npermalink: 707fda5ddd\ncreated_at: 2017-05-17 09:47:28.236918000 Z\nupdated_at: 2017-05-17 09:47:28.236918000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 09:54:42.260404
740	Order	168	update	\N	---\nshipped: new\nemail: abc@gmail.com\nid: 168\nprice: !ruby/object:BigDecimal 36:0.663186000000000006198E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 18:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-4f5f0858a5\npermalink: 707fda5ddd\ncreated_at: 2017-05-17 09:47:28.236918000 Z\nupdated_at: 2017-05-17 09:54:42.260404000 Z\nshipping_address_id: 151\nbilling_address_id: \ntoken: \norder_otp: \nphone_verified: \n	2017-05-17 12:32:08.518955
741	Order	169	create	\N	\N	2017-05-17 12:43:44.649837
742	Order	169	update	\N	---\nshipped: new\nid: 169\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-5a15c38074\npermalink: d3cddbe5bf\ncreated_at: 2017-05-17 12:43:44.649837000 Z\nupdated_at: 2017-05-17 12:43:44.649837000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:45:03.147445
743	Order	169	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-5a15c38074\nid: 169\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: d3cddbe5bf\ncreated_at: 2017-05-17 12:43:44.649837000 Z\nupdated_at: 2017-05-17 12:45:03.147445000 Z\nshipping_address_id: 152\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:45:49.217265
744	Order	169	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-5a15c38074\nid: 169\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \npermalink: d3cddbe5bf\ncreated_at: 2017-05-17 12:43:44.649837000 Z\nupdated_at: 2017-05-17 12:45:49.217265786 Z\nshipping_address_id: 152\nbilling_address_id: \ntoken: OTSe9joRnjgiTHVUjAQhfQ\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:46:00.592934
745	Order	169	update	\N	---\nshipped: new\norder_otp: 4409\nid: 169\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-5a15c38074\npermalink: d3cddbe5bf\ncreated_at: 2017-05-17 12:43:44.649837000 Z\nupdated_at: 2017-05-17 12:46:00.592934000 Z\nshipping_address_id: 152\nbilling_address_id: \ntoken: OTSe9joRnjgiTHVUjAQhfQ\nemail: abc@gmail.com\nphone_verified: \n	2017-05-17 12:46:46.18156
746	Order	170	create	\N	\N	2017-05-17 12:49:35.807077
747	Order	170	update	\N	---\nshipped: new\nid: 170\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-7fb1e23f8e\npermalink: 8f59a2632f\ncreated_at: 2017-05-17 12:49:35.807077000 Z\nupdated_at: 2017-05-17 12:49:35.807077000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:49:49.636492
748	Order	170	update	\N	---\nshipped: new\nid: 170\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: \nname: order-7fb1e23f8e\npermalink: 8f59a2632f\ncreated_at: 2017-05-17 12:49:35.807077000 Z\nupdated_at: 2017-05-17 12:49:49.636492000 Z\nshipping_address_id: 153\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:50:24.893586
749	Order	171	create	\N	\N	2017-05-17 12:53:38.877299
750	Order	171	update	\N	---\nshipped: new\nid: 171\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-384d938dbd\npermalink: b25b5df831\ncreated_at: 2017-05-17 12:53:38.877299000 Z\nupdated_at: 2017-05-17 12:53:38.877299000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:54:08.837273
751	Order	171	update	\N	---\nshipped: new\nid: 171\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\nname: order-384d938dbd\npermalink: b25b5df831\ncreated_at: 2017-05-17 12:53:38.877299000 Z\nupdated_at: 2017-05-17 12:54:08.837273000 Z\nshipping_address_id: 155\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:56:12.842569
762	Order	173	create	\N	\N	2017-05-17 13:06:00.948733
752	Order	171	update	\N	---\nshipped: new\nid: 171\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\nname: order-384d938dbd\npermalink: b25b5df831\ncreated_at: 2017-05-17 12:53:38.877299000 Z\nupdated_at: 2017-05-17 12:56:12.842569000 Z\nshipping_address_id: 156\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:56:17.191207
753	Order	171	update	\N	---\nshipped: new\nid: 171\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.15E2\nname: order-384d938dbd\npermalink: b25b5df831\ncreated_at: 2017-05-17 12:53:38.877299000 Z\nupdated_at: 2017-05-17 12:56:17.191207000 Z\nshipping_address_id: 157\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 12:59:43.046575
754	Order	171	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-384d938dbd\nid: 171\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: b25b5df831\ncreated_at: 2017-05-17 12:53:38.877299000 Z\nupdated_at: 2017-05-17 12:59:43.046575000 Z\nshipping_address_id: 157\nbilling_address_id: \ntoken: \nemail: deshbhratarakash@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:00:09.061864
755	Order	171	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-384d938dbd\nid: 171\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: b25b5df831\ncreated_at: 2017-05-17 12:53:38.877299000 Z\nupdated_at: 2017-05-17 13:00:09.061864089 Z\nshipping_address_id: 157\nbilling_address_id: \ntoken: 4Pgjni6OUcdIBaIJxA3_zg\nemail: deshbhratarakash@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:00:11.026225
756	Order	172	create	\N	\N	2017-05-17 13:00:18.960513
757	Order	172	update	\N	---\nshipped: new\nid: 172\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-98f231aa06\npermalink: af92d0424f\ncreated_at: 2017-05-17 13:00:18.960513000 Z\nupdated_at: 2017-05-17 13:00:18.960513000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:00:22.669691
758	Order	172	update	\N	---\nshipped: new\nid: 172\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-98f231aa06\npermalink: af92d0424f\ncreated_at: 2017-05-17 13:00:18.960513000 Z\nupdated_at: 2017-05-17 13:00:22.669691000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: deshbhratarakash@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:04:00.381934
759	Order	172	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-98f231aa06\nid: 172\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: af92d0424f\ncreated_at: 2017-05-17 13:00:18.960513000 Z\nupdated_at: 2017-05-17 13:04:00.381934000 Z\nshipping_address_id: 158\nbilling_address_id: \ntoken: \nemail: deshbhratarakash@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:04:32.265068
760	Order	172	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-98f231aa06\nid: 172\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\npermalink: af92d0424f\ncreated_at: 2017-05-17 13:00:18.960513000 Z\nupdated_at: 2017-05-17 13:04:32.265068658 Z\nshipping_address_id: 158\nbilling_address_id: \ntoken: gaxI3EVMiOYqth3CMNecrQ\nemail: deshbhratarakash@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:04:33.997184
761	Order	172	update	\N	---\nshipped: new\norder_otp: 2849\nid: 172\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.15E2\nname: order-98f231aa06\npermalink: af92d0424f\ncreated_at: 2017-05-17 13:00:18.960513000 Z\nupdated_at: 2017-05-17 13:04:33.997184000 Z\nshipping_address_id: 158\nbilling_address_id: \ntoken: gaxI3EVMiOYqth3CMNecrQ\nemail: deshbhratarakash@gmail.com\nphone_verified: \n	2017-05-17 13:05:36.343738
769	Order	174	update	\N	---\nshipped: new\norder_otp: 7844\nid: 174\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-20371ac3bf\npermalink: 56a92efcd3\ncreated_at: 2017-05-17 13:06:49.872735000 Z\nupdated_at: 2017-05-17 13:07:50.207163000 Z\nshipping_address_id: 160\nbilling_address_id: \ntoken: aRKWdEJ4paxhazUx-UmQmA\nemail: abc@gmail.com\nphone_verified: \n	2017-05-17 13:08:42.770098
770	Order	175	create	\N	\N	2017-05-17 13:08:47.773837
772	Order	176	update	\N	---\nshipped: new\nid: 176\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2261b0a77c\npermalink: 1010f7c5de\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 13:29:36.475106000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:32:34.770243
773	Order	176	update	\N	---\nshipped: new\nid: 176\npermalink: 1010f7c5de\nname: order-2261b0a77c\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 13:32:34.770243000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: deshbhratarakash@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 14:02:17.087803
775	Order	176	update	\N	---\nshipped: new\nid: 176\npermalink: 1010f7c5de\nname: order-2261b0a77c\nprice: !ruby/object:BigDecimal 36:0.556186000000000005198E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.36386000000000005198E1\nsubtotal: !ruby/object:BigDecimal 18:0.5198E2\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 14:03:07.938801000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 14:05:33.291689
763	Order	173	update	\N	---\nshipped: new\nid: 173\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-30b17c38b1\npermalink: 3f92b3dea2\ncreated_at: 2017-05-17 13:06:00.948733000 Z\nupdated_at: 2017-05-17 13:06:00.948733000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:06:23.695959
764	Order	173	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-30b17c38b1\nid: 173\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 3f92b3dea2\ncreated_at: 2017-05-17 13:06:00.948733000 Z\nupdated_at: 2017-05-17 13:06:23.695959000 Z\nshipping_address_id: 159\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:06:41.557943
765	Order	174	create	\N	\N	2017-05-17 13:06:49.872735
766	Order	174	update	\N	---\nshipped: new\nid: 174\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-20371ac3bf\npermalink: 56a92efcd3\ncreated_at: 2017-05-17 13:06:49.872735000 Z\nupdated_at: 2017-05-17 13:06:49.872735000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:07:29.804065
767	Order	174	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-20371ac3bf\nid: 174\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 56a92efcd3\ncreated_at: 2017-05-17 13:06:49.872735000 Z\nupdated_at: 2017-05-17 13:07:29.804065000 Z\nshipping_address_id: 160\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:07:48.506932
768	Order	174	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-20371ac3bf\nid: 174\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 56a92efcd3\ncreated_at: 2017-05-17 13:06:49.872735000 Z\nupdated_at: 2017-05-17 13:07:48.506932568 Z\nshipping_address_id: 160\nbilling_address_id: \ntoken: aRKWdEJ4paxhazUx-UmQmA\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 13:07:50.207163
771	Order	176	create	\N	\N	2017-05-17 13:29:36.475106
774	Order	176	update	\N	---\nshipped: new\nid: 176\nprice: !ruby/object:BigDecimal 36:0.941279000000000008797E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.61579000000000008797E1\nsubtotal: !ruby/object:BigDecimal 18:0.8797E2\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-2261b0a77c\npermalink: 1010f7c5de\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 14:02:17.087803000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 14:03:07.938801
776	Order	176	update	\N	---\nshipped: new\nid: 176\nprice: !ruby/object:BigDecimal 36:0.812879000000000007597E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.53179000000000007597E1\nsubtotal: !ruby/object:BigDecimal 18:0.7597E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2261b0a77c\npermalink: 1010f7c5de\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 14:05:33.291689000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-17 14:10:38.255157
777	Order	176	update	\N	---\nshipped: new\nid: 176\nprice: !ruby/object:BigDecimal 45:0.812879000000000007597E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.53179000000000007597E1\nsubtotal: !ruby/object:BigDecimal 27:0.7597E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2261b0a77c\npermalink: 1010f7c5de\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 14:10:38.255157000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: czxc@cxzc.ccxxxx\norder_otp: \nphone_verified: \n	2017-05-17 14:10:52.319458
778	Order	176	update	\N	---\nshipped: new\nid: 176\npermalink: 1010f7c5de\nname: order-2261b0a77c\nprice: !ruby/object:BigDecimal 36:0.812879000000000007597E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.53179000000000007597E1\nsubtotal: !ruby/object:BigDecimal 18:0.7597E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-17 13:29:36.475106000 Z\nupdated_at: 2017-05-17 14:10:52.319458000 Z\nshipping_address_id: 161\nbilling_address_id: \ntoken: \nemail: czxc@cxzc.ccxxxx\norder_otp: \nphone_verified: \n	2017-05-17 14:17:47.908705
779	Order	177	create	\N	\N	2017-05-18 04:38:33.703646
780	Order	178	create	\N	\N	2017-05-18 04:38:45.333202
781	Order	178	update	\N	---\nshipped: new\nid: 178\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c3a2668f4e\npermalink: 5e8e166790\ncreated_at: 2017-05-18 04:38:45.333202000 Z\nupdated_at: 2017-05-18 04:38:45.333202000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:41:01.964693
782	Order	178	update	\N	---\nshipped: new\nid: 178\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c3a2668f4e\npermalink: 5e8e166790\ncreated_at: 2017-05-18 04:38:45.333202000 Z\nupdated_at: 2017-05-18 04:41:01.964693000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:44:53.93755
783	Order	178	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c3a2668f4e\nid: 178\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 5e8e166790\ncreated_at: 2017-05-18 04:38:45.333202000 Z\nupdated_at: 2017-05-18 04:44:53.937550000 Z\nshipping_address_id: 162\nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:52:39.867814
784	Order	178	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-c3a2668f4e\nid: 178\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 5e8e166790\ncreated_at: 2017-05-18 04:38:45.333202000 Z\nupdated_at: 2017-05-18 04:52:39.867814100 Z\nshipping_address_id: 162\nbilling_address_id: \ntoken: 152atUtsRuJUpHNsxXsjwA\nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:52:45.633681
785	Order	178	update	\N	---\nshipped: new\norder_otp: 7382\nid: 178\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-c3a2668f4e\npermalink: 5e8e166790\ncreated_at: 2017-05-18 04:38:45.333202000 Z\nupdated_at: 2017-05-18 04:52:45.633681000 Z\nshipping_address_id: 162\nbilling_address_id: \ntoken: 152atUtsRuJUpHNsxXsjwA\nemail: xyz@gmail.com\nphone_verified: \n	2017-05-18 04:54:21.076112
786	Order	179	create	\N	\N	2017-05-18 04:57:02.894964
787	Order	179	update	\N	---\nshipped: new\nid: 179\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8b4fedcf5e\npermalink: 9eef50fab7\ncreated_at: 2017-05-18 04:57:02.894964000 Z\nupdated_at: 2017-05-18 04:57:02.894964000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:57:10.917218
788	Order	179	update	\N	---\nshipped: new\nid: 179\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8b4fedcf5e\npermalink: 9eef50fab7\ncreated_at: 2017-05-18 04:57:02.894964000 Z\nupdated_at: 2017-05-18 04:57:10.917218000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:57:27.54758
789	Order	179	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8b4fedcf5e\nid: 179\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9eef50fab7\ncreated_at: 2017-05-18 04:57:02.894964000 Z\nupdated_at: 2017-05-18 04:57:27.547580000 Z\nshipping_address_id: 163\nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:58:23.734967
790	Order	179	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-8b4fedcf5e\nid: 179\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: 9eef50fab7\ncreated_at: 2017-05-18 04:57:02.894964000 Z\nupdated_at: 2017-05-18 04:58:23.734967634 Z\nshipping_address_id: 163\nbilling_address_id: \ntoken: L6bN2Tg4uFXE3_Z6Ud31tA\nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 04:58:29.815489
791	Order	179	update	\N	---\nshipped: new\norder_otp: 581\nid: 179\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-8b4fedcf5e\npermalink: 9eef50fab7\ncreated_at: 2017-05-18 04:57:02.894964000 Z\nupdated_at: 2017-05-18 04:58:29.815489000 Z\nshipping_address_id: 163\nbilling_address_id: \ntoken: L6bN2Tg4uFXE3_Z6Ud31tA\nemail: xyz@gmail.com\nphone_verified: \n	2017-05-18 04:59:07.586848
792	Order	180	create	\N	\N	2017-05-18 07:33:52.215733
793	Order	180	update	\N	---\nshipped: new\nid: 180\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-bf0de015ef\npermalink: 15e0b6f452\ncreated_at: 2017-05-18 07:33:52.215733000 Z\nupdated_at: 2017-05-18 07:33:52.215733000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 07:33:59.74651
794	Order	180	update	\N	---\nshipped: new\nid: 180\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-bf0de015ef\npermalink: 15e0b6f452\ncreated_at: 2017-05-18 07:33:52.215733000 Z\nupdated_at: 2017-05-18 07:33:59.746510000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: xzs@xcvxcv.vv\norder_otp: \nphone_verified: \n	2017-05-18 08:30:16.804638
795	Order	180	update	\N	---\nshipped: new\nid: 180\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-bf0de015ef\npermalink: 15e0b6f452\ncreated_at: 2017-05-18 07:33:52.215733000 Z\nupdated_at: 2017-05-18 08:30:16.804638000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: dfsd@xcxc.ccc\norder_otp: \nphone_verified: \n	2017-05-18 08:30:26.550959
796	Order	181	create	\N	\N	2017-05-18 08:31:10.09059
797	Order	181	update	\N	---\nshipped: new\nid: 181\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-fab13f4f33\npermalink: b94bd384df\ncreated_at: 2017-05-18 08:31:10.090590000 Z\nupdated_at: 2017-05-18 08:31:10.090590000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 08:31:16.189037
798	Order	181	update	\N	---\nshipped: new\nid: 181\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-fab13f4f33\npermalink: b94bd384df\ncreated_at: 2017-05-18 08:31:10.090590000 Z\nupdated_at: 2017-05-18 08:31:16.189037000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: zcxzc@zxczxc.cccc\norder_otp: \nphone_verified: \n	2017-05-18 08:58:43.375325
799	Order	181	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-fab13f4f33\nid: 181\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: b94bd384df\ncreated_at: 2017-05-18 08:31:10.090590000 Z\nupdated_at: 2017-05-18 08:58:43.375325000 Z\nshipping_address_id: 165\nbilling_address_id: \ntoken: \nemail: zcxzc@zxczxc.cccc\norder_otp: \nphone_verified: \n	2017-05-18 09:00:51.815455
800	Order	181	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.331593000000000003099E2\nname: order-fab13f4f33\nid: 181\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 36:0.3099E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: b94bd384df\ncreated_at: 2017-05-18 08:31:10.090590000 Z\nupdated_at: 2017-05-18 09:00:51.815455656 Z\nshipping_address_id: 165\nbilling_address_id: \ntoken: 7TQ34GxBM48d4QoSr2JTKw\nemail: zcxzc@zxczxc.cccc\norder_otp: \nphone_verified: \n	2017-05-18 09:00:53.815157
801	Order	182	create	\N	\N	2017-05-18 09:00:57.236124
802	Order	182	update	\N	---\nshipped: new\nid: 182\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-4ff40ae1fb\npermalink: bbc3a25370\ncreated_at: 2017-05-18 09:00:57.236124000 Z\nupdated_at: 2017-05-18 09:00:57.236124000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 09:01:03.768078
803	Order	182	update	\N	---\nshipped: new\nid: 182\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-4ff40ae1fb\npermalink: bbc3a25370\ncreated_at: 2017-05-18 09:00:57.236124000 Z\nupdated_at: 2017-05-18 09:01:03.768078000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: cxzc@zxczxc.cccsczc\norder_otp: \nphone_verified: \n	2017-05-18 11:20:36.364139
804	Order	182	update	\N	---\nshipped: new\nid: 182\nprice: !ruby/object:BigDecimal 36:0.331593000000000003099E2\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.21693000000000003099E1\nsubtotal: !ruby/object:BigDecimal 18:0.3099E2\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-4ff40ae1fb\npermalink: bbc3a25370\ncreated_at: 2017-05-18 09:00:57.236124000 Z\nupdated_at: 2017-05-18 11:20:36.364139000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 11:21:28.096334
805	Order	182	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-4ff40ae1fb\nid: 182\ncomplete: false\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: bbc3a25370\ncreated_at: 2017-05-18 09:00:57.236124000 Z\nupdated_at: 2017-05-18 11:21:28.096334000 Z\nshipping_address_id: 166\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 11:21:47.271624
806	Order	182	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\nname: order-4ff40ae1fb\nid: 182\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: bbc3a25370\ncreated_at: 2017-05-18 09:00:57.236124000 Z\nupdated_at: 2017-05-18 11:21:47.271624970 Z\nshipping_address_id: 166\nbilling_address_id: \ntoken: "-YQ1Zo6EDFLLkYO6hnwong"\nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-18 11:21:48.98296
807	Order	182	update	\N	---\nshipped: new\norder_otp: 3202\nid: 182\nprice: !ruby/object:BigDecimal 45:0.663186000000000006198E2\ncomplete: true\ntax: !ruby/object:BigDecimal 45:0.43386000000000006198E1\nsubtotal: !ruby/object:BigDecimal 36:0.6198E2\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-4ff40ae1fb\npermalink: bbc3a25370\ncreated_at: 2017-05-18 09:00:57.236124000 Z\nupdated_at: 2017-05-18 11:21:48.982960000 Z\nshipping_address_id: 166\nbilling_address_id: \ntoken: "-YQ1Zo6EDFLLkYO6hnwong"\nemail: abc@gmail.com\nphone_verified: \n	2017-05-18 11:24:08.477695
808	Order	183	create	\N	\N	2017-05-19 06:56:20.327105
809	Order	184	create	\N	\N	2017-05-19 08:39:00.55788
810	Order	184	update	\N	---\nshipped: new\nid: 184\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-2cb13a51a4\npermalink: a899dc5c11\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:39:00.557880000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:48:33.77488
811	Order	184	update	\N	---\nshipped: new\nid: 184\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-2cb13a51a4\npermalink: a899dc5c11\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:48:33.774880000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:49:03.53874
812	Order	184	update	\N	---\nshipped: new\nid: 184\npermalink: a899dc5c11\nname: order-2cb13a51a4\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:49:03.538740000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:49:07.99543
813	Order	184	update	\N	---\nshipped: new\nid: 184\npermalink: a899dc5c11\nname: order-2cb13a51a4\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:49:07.995430000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:53:11.009929
814	Order	184	update	\N	---\nshipped: new\nid: 184\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-2cb13a51a4\npermalink: a899dc5c11\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:53:11.009929000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:53:50.978413
815	Order	184	update	\N	---\nshipped: new\nid: 184\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-2cb13a51a4\npermalink: a899dc5c11\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:53:50.978413000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:53:54.045853
816	Order	184	update	\N	---\nshipped: new\nid: 184\npermalink: a899dc5c11\nname: order-2cb13a51a4\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:53:54.045853000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:54:27.575458
817	Order	184	update	\N	---\nshipped: new\nid: 184\npermalink: a899dc5c11\nname: order-2cb13a51a4\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:54:27.575458000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:54:43.476013
885	Order	205	update	\N	---\nshipped: new\nid: 205\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-f224bfca5d\npermalink: dc31990d52\ncreated_at: 2017-05-23 08:13:07.190664000 Z\nupdated_at: 2017-05-23 08:13:27.326029000 Z\nshipping_address_id: 189\nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:13:40.150423
818	Order	184	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\nname: order-2cb13a51a4\nid: 184\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: a899dc5c11\ncreated_at: 2017-05-19 08:39:00.557880000 Z\nupdated_at: 2017-05-19 08:54:43.476013000 Z\nshipping_address_id: 167\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:55:11.113439
819	Order	185	create	\N	\N	2017-05-19 08:55:18.945715
820	Order	185	update	\N	---\nshipped: new\nid: 185\npermalink: a2a7e9d61d\nname: order-33641b1a8d\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-19 08:55:18.945715000 Z\nupdated_at: 2017-05-19 08:55:18.945715000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:55:27.240331
848	Order	195	update	\N	---\nshipped: new\nid: 195\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-a34be8ea59\npermalink: c91d628821\ncreated_at: 2017-05-22 13:01:18.145496000 Z\nupdated_at: 2017-05-22 13:01:18.145496000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 13:01:27.224246
821	Order	185	update	\N	---\nshipped: new\nid: 185\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-33641b1a8d\npermalink: a2a7e9d61d\ncreated_at: 2017-05-19 08:55:18.945715000 Z\nupdated_at: 2017-05-19 08:55:27.240331000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 08:55:51.220786
822	Order	185	update	\N	---\nshipped: new\nid: 185\npermalink: a2a7e9d61d\nname: order-33641b1a8d\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-19 08:55:18.945715000 Z\nupdated_at: 2017-05-19 08:55:51.220786000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 09:01:02.36749
823	Order	185	update	\N	---\nshipped: new\nid: 185\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-33641b1a8d\npermalink: a2a7e9d61d\ncreated_at: 2017-05-19 08:55:18.945715000 Z\nupdated_at: 2017-05-19 09:01:02.367490000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 09:15:51.56938
824	Order	186	create	\N	\N	2017-05-19 11:45:48.385968
825	Order	186	update	\N	---\nshipped: new\nid: 186\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c6643ed92b\npermalink: bc7dd61fbf\ncreated_at: 2017-05-19 11:45:48.385968000 Z\nupdated_at: 2017-05-19 11:45:48.385968000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 11:46:38.187101
826	Order	186	update	\N	---\nshipped: new\nid: 186\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c6643ed92b\npermalink: bc7dd61fbf\ncreated_at: 2017-05-19 11:45:48.385968000 Z\nupdated_at: 2017-05-19 11:46:38.187101000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: cczx@zczxc.cccc\norder_otp: \nphone_verified: \n	2017-05-19 11:47:10.484858
827	Order	186	update	\N	---\nshipped: new\nid: 186\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-c6643ed92b\npermalink: bc7dd61fbf\ncreated_at: 2017-05-19 11:45:48.385968000 Z\nupdated_at: 2017-05-19 11:47:10.484858000 Z\nshipping_address_id: 169\nbilling_address_id: \ntoken: \nemail: cczx@zczxc.cccc\norder_otp: \nphone_verified: \n	2017-05-19 11:47:20.556418
828	Order	187	create	\N	\N	2017-05-19 13:11:52.811959
829	Order	187	update	\N	---\nshipped: new\nid: 187\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-833cf6b31f\npermalink: 5e7f60a879\ncreated_at: 2017-05-19 13:11:52.811959000 Z\nupdated_at: 2017-05-19 13:11:52.811959000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 13:12:21.952578
830	Order	188	create	\N	\N	2017-05-19 14:10:46.861179
831	Order	188	update	\N	---\nshipped: new\nid: 188\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-b7b7a75a01\npermalink: 3ca06bca86\ncreated_at: 2017-05-19 14:10:46.861179000 Z\nupdated_at: 2017-05-19 14:10:46.861179000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:12:56.70344
832	Order	189	create	\N	\N	2017-05-19 14:29:14.561784
833	Order	189	update	\N	---\nshipped: new\nid: 189\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-8bd47eea40\npermalink: 80349d3e9b\ncreated_at: 2017-05-19 14:29:14.561784000 Z\nupdated_at: 2017-05-19 14:29:14.561784000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:30:48.853935
834	Order	189	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\nname: order-8bd47eea40\nid: 189\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: \npermalink: 80349d3e9b\ncreated_at: 2017-05-19 14:29:14.561784000 Z\nupdated_at: 2017-05-19 14:30:48.853935000 Z\nshipping_address_id: 173\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:31:21.151885
835	Order	190	create	\N	\N	2017-05-19 14:31:33.984133
836	Order	190	update	\N	---\nshipped: new\nid: 190\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-95dd366b72\npermalink: fdb3474b80\ncreated_at: 2017-05-19 14:31:33.984133000 Z\nupdated_at: 2017-05-19 14:31:33.984133000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:31:42.635572
837	Order	190	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\nname: order-95dd366b72\nid: 190\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: \npermalink: fdb3474b80\ncreated_at: 2017-05-19 14:31:33.984133000 Z\nupdated_at: 2017-05-19 14:31:42.635572000 Z\nshipping_address_id: 174\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:32:15.357475
838	Order	191	create	\N	\N	2017-05-19 14:32:21.896823
839	Order	191	update	\N	---\nshipped: new\nid: 191\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-c55740b885\npermalink: c4a4039a63\ncreated_at: 2017-05-19 14:32:21.896823000 Z\nupdated_at: 2017-05-19 14:32:21.896823000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:32:54.207281
840	Order	191	update	\N	---\nshipped: new\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\nname: order-c55740b885\nid: 191\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\npermalink: c4a4039a63\ncreated_at: 2017-05-19 14:32:21.896823000 Z\nupdated_at: 2017-05-19 14:32:54.207281000 Z\nshipping_address_id: 175\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:37:32.138791
841	Order	192	create	\N	\N	2017-05-19 14:37:41.784046
842	Order	192	update	\N	---\nshipped: new\nid: 192\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-aaf83b6601\npermalink: 2417d39968\ncreated_at: 2017-05-19 14:37:41.784046000 Z\nupdated_at: 2017-05-19 14:37:41.784046000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-19 14:37:50.105976
843	Order	193	create	\N	\N	2017-05-22 10:27:07.080625
844	Order	193	update	\N	---\nshipped: new\nid: 193\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-cab3f16369\npermalink: 2f41d1bd5b\ncreated_at: 2017-05-22 10:27:07.080625000 Z\nupdated_at: 2017-05-22 10:27:07.080625000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 10:27:18.109407
847	Order	195	create	\N	\N	2017-05-22 13:01:18.145496
849	Order	195	update	\N	---\nshipped: new\nid: 195\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-a34be8ea59\npermalink: c91d628821\ncreated_at: 2017-05-22 13:01:18.145496000 Z\nupdated_at: 2017-05-22 13:01:27.224246000 Z\nshipping_address_id: 178\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 13:01:45.619654
851	Order	196	update	\N	---\nshipped: new\nid: 196\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-06b6679c3c\npermalink: d4e5626404\ncreated_at: 2017-05-22 13:01:55.984291000 Z\nupdated_at: 2017-05-22 13:01:55.984291000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 13:02:06.800588
852	Order	196	update	\N	---\nshipped: new\nid: 196\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-06b6679c3c\npermalink: d4e5626404\ncreated_at: 2017-05-22 13:01:55.984291000 Z\nupdated_at: 2017-05-22 13:02:06.800588000 Z\nshipping_address_id: 179\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 13:31:58.875787
853	Order	197	create	\N	\N	2017-05-22 13:32:03.266216
854	Order	197	update	\N	---\nshipped: new\nid: 197\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-23a6267d91\npermalink: c6fec2cbf0\ncreated_at: 2017-05-22 13:32:03.266216000 Z\nupdated_at: 2017-05-22 13:32:03.266216000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 13:32:14.789947
855	Order	197	update	\N	---\nshipped: new\nid: 197\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-23a6267d91\npermalink: c6fec2cbf0\ncreated_at: 2017-05-22 13:32:03.266216000 Z\nupdated_at: 2017-05-22 13:32:14.789947000 Z\nshipping_address_id: 180\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 14:14:24.663468
856	Order	197	update	\N	---\nshipped: new\nid: 197\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-23a6267d91\npermalink: c6fec2cbf0\ncreated_at: 2017-05-22 13:32:03.266216000 Z\nupdated_at: 2017-05-22 14:14:24.663468000 Z\nshipping_address_id: 181\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 14:44:22.205589
857	Order	198	create	\N	\N	2017-05-22 14:48:23.0668
858	Order	198	update	\N	---\nshipped: new\nid: 198\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-ac96593019\npermalink: 04d855a2d4\ncreated_at: 2017-05-22 14:48:23.066800000 Z\nupdated_at: 2017-05-22 14:48:23.066800000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 14:48:32.838856
859	Order	198	update	\N	---\nshipped: new\nid: 198\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-ac96593019\npermalink: 04d855a2d4\ncreated_at: 2017-05-22 14:48:23.066800000 Z\nupdated_at: 2017-05-22 14:48:32.838856000 Z\nshipping_address_id: 182\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-22 14:58:27.702855
860	Order	199	create	\N	\N	2017-05-23 04:54:04.61182
861	Order	199	update	\N	---\nshipped: new\nid: 199\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-036ae30f6e\npermalink: 48b738ce17\ncreated_at: 2017-05-23 04:54:04.611820000 Z\nupdated_at: 2017-05-23 04:54:04.611820000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 04:54:28.506971
862	Order	199	update	\N	---\nshipped: new\nid: 199\npermalink: 48b738ce17\nname: order-036ae30f6e\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-23 04:54:04.611820000 Z\nupdated_at: 2017-05-23 04:54:28.506971000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 04:54:34.643835
863	Order	199	update	\N	---\nshipped: new\nid: 199\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-036ae30f6e\npermalink: 48b738ce17\ncreated_at: 2017-05-23 04:54:04.611820000 Z\nupdated_at: 2017-05-23 04:54:34.643835000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 04:54:44.161509
864	Order	200	create	\N	\N	2017-05-23 07:20:35.893549
865	Order	200	update	\N	---\nshipped: new\nid: 200\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-551177ba85\npermalink: fd78d26e09\ncreated_at: 2017-05-23 07:20:35.893549000 Z\nupdated_at: 2017-05-23 07:20:35.893549000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 07:20:51.60191
866	Order	200	update	\N	---\nshipped: new\nid: 200\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 27:0.121E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-551177ba85\npermalink: fd78d26e09\ncreated_at: 2017-05-23 07:20:35.893549000 Z\nupdated_at: 2017-05-23 07:20:51.601910000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: lmn@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 07:21:15.568511
867	Order	200	update	\N	---\nshipped: new\nid: 200\npermalink: fd78d26e09\nname: order-551177ba85\nprice: !ruby/object:BigDecimal 36:0.12947000000000000121E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.847000000000000121E1\nsubtotal: !ruby/object:BigDecimal 18:0.121E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\ncreated_at: 2017-05-23 07:20:35.893549000 Z\nupdated_at: 2017-05-23 07:21:15.568511000 Z\nshipping_address_id: 184\nbilling_address_id: \ntoken: \nemail: lmn@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 07:46:25.702379
868	Order	200	update	\N	---\nshipped: new\nid: 200\nprice: !ruby/object:BigDecimal 36:0.13803000000000000129E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.903000000000000129E1\nsubtotal: !ruby/object:BigDecimal 18:0.129E3\nshipping: !ruby/object:BigDecimal 18:0.25E2\nname: order-551177ba85\npermalink: fd78d26e09\ncreated_at: 2017-05-23 07:20:35.893549000 Z\nupdated_at: 2017-05-23 07:46:25.702379000 Z\nshipping_address_id: 184\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 07:46:34.850329
869	Order	200	update	\N	---\nshipped: new\nid: 200\nprice: !ruby/object:BigDecimal 36:0.13803000000000000129E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.903000000000000129E1\nsubtotal: !ruby/object:BigDecimal 18:0.129E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-551177ba85\npermalink: fd78d26e09\ncreated_at: 2017-05-23 07:20:35.893549000 Z\nupdated_at: 2017-05-23 07:46:34.850329000 Z\nshipping_address_id: 184\nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:06:31.517522
870	Order	201	create	\N	\N	2017-05-23 08:07:00.966123
871	Order	201	update	\N	---\nshipped: new\nid: 201\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-dcb76fcb35\npermalink: 991e69049d\ncreated_at: 2017-05-23 08:07:00.966123000 Z\nupdated_at: 2017-05-23 08:07:00.966123000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:07:09.652767
872	Order	201	update	\N	---\nshipped: new\nid: 201\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-dcb76fcb35\npermalink: 991e69049d\ncreated_at: 2017-05-23 08:07:00.966123000 Z\nupdated_at: 2017-05-23 08:07:09.652767000 Z\nshipping_address_id: 185\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:08:26.535887
873	Order	202	create	\N	\N	2017-05-23 08:08:29.840385
874	Order	202	update	\N	---\nshipped: new\nid: 202\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-eaeca3f8be\npermalink: e8bc82071c\ncreated_at: 2017-05-23 08:08:29.840385000 Z\nupdated_at: 2017-05-23 08:08:29.840385000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:08:37.535811
875	Order	202	update	\N	---\nshipped: new\nid: 202\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-eaeca3f8be\npermalink: e8bc82071c\ncreated_at: 2017-05-23 08:08:29.840385000 Z\nupdated_at: 2017-05-23 08:08:37.535811000 Z\nshipping_address_id: 186\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:09:44.853793
876	Order	203	create	\N	\N	2017-05-23 08:10:10.554861
877	Order	203	update	\N	---\nshipped: new\nid: 203\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-0b855ac7f2\npermalink: ba0b2c71dd\ncreated_at: 2017-05-23 08:10:10.554861000 Z\nupdated_at: 2017-05-23 08:10:10.554861000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:10:19.772911
878	Order	203	update	\N	---\nshipped: new\nid: 203\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-0b855ac7f2\npermalink: ba0b2c71dd\ncreated_at: 2017-05-23 08:10:10.554861000 Z\nupdated_at: 2017-05-23 08:10:19.772911000 Z\nshipping_address_id: 187\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:11:56.386554
879	Order	204	create	\N	\N	2017-05-23 08:12:01.79119
880	Order	204	update	\N	---\nshipped: new\nid: 204\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-b9d841b458\npermalink: 16da7b170c\ncreated_at: 2017-05-23 08:12:01.791190000 Z\nupdated_at: 2017-05-23 08:12:01.791190000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:12:10.936353
881	Order	204	update	\N	---\nshipped: new\nid: 204\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: \nname: order-b9d841b458\npermalink: 16da7b170c\ncreated_at: 2017-05-23 08:12:01.791190000 Z\nupdated_at: 2017-05-23 08:12:10.936353000 Z\nshipping_address_id: 188\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:12:27.39972
882	Order	205	create	\N	\N	2017-05-23 08:13:07.190664
883	Order	205	update	\N	---\nshipped: new\nid: 205\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-f224bfca5d\npermalink: dc31990d52\ncreated_at: 2017-05-23 08:13:07.190664000 Z\nupdated_at: 2017-05-23 08:13:07.190664000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:13:12.03481
884	Order	205	update	\N	---\nshipped: new\nid: 205\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-f224bfca5d\npermalink: dc31990d52\ncreated_at: 2017-05-23 08:13:07.190664000 Z\nupdated_at: 2017-05-23 08:13:12.034810000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:13:27.326029
886	Order	205	update	\N	---\nshipped: new\nid: 205\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: true\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-f224bfca5d\npermalink: dc31990d52\ncreated_at: 2017-05-23 08:13:07.190664000 Z\nupdated_at: 2017-05-23 08:13:40.150423928 Z\nshipping_address_id: 189\nbilling_address_id: \ntoken: fGiW1dDJZwOHDpn9GyvmrA\nemail: xyz@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 08:13:42.037565
887	Order	205	update	\N	---\nshipped: new\norder_otp: 9885\nid: 205\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: true\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-f224bfca5d\npermalink: dc31990d52\ncreated_at: 2017-05-23 08:13:07.190664000 Z\nupdated_at: 2017-05-23 08:13:42.037565000 Z\nshipping_address_id: 189\nbilling_address_id: \ntoken: fGiW1dDJZwOHDpn9GyvmrA\nemail: xyz@gmail.com\nphone_verified: \n	2017-05-23 08:14:42.155386
888	Order	206	create	\N	\N	2017-05-23 13:32:49.709666
889	Order	207	create	\N	\N	2017-05-23 14:21:39.778777
890	Order	207	update	\N	---\nshipped: new\nid: 207\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.0\nsubtotal: !ruby/object:BigDecimal 27:0.0\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-5d515754e7\npermalink: 2ab4163063\ncreated_at: 2017-05-23 14:21:39.778777000 Z\nupdated_at: 2017-05-23 14:21:39.778777000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-23 14:23:09.459367
891	Order	208	create	\N	\N	2017-05-24 13:47:58.127553
892	Order	208	update	\N	---\nshipped: new\nid: 208\nprice: !ruby/object:BigDecimal 27:0.642000000000000006E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.42000000000000006E2\nsubtotal: !ruby/object:BigDecimal 18:0.6E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-595c461388\npermalink: d6526fdfa6\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 13:47:58.127553000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 13:49:01.203432
893	Order	208	update	\N	---\nshipped: new\nid: 208\npermalink: d6526fdfa6\nname: order-595c461388\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 13:49:01.203432000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:41:52.416354
894	Order	208	update	\N	---\nshipped: new\nid: 208\nprice: !ruby/object:BigDecimal 36:0.248561000000000002323E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.16261000000000002323E3\nsubtotal: !ruby/object:BigDecimal 18:0.2323E4\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-595c461388\npermalink: d6526fdfa6\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:41:52.416354000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:41:56.595502
895	Order	208	update	\N	---\nshipped: new\nid: 208\nprice: !ruby/object:BigDecimal 36:0.497122000000000004646E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.32522000000000004646E3\nsubtotal: !ruby/object:BigDecimal 18:0.4646E4\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-595c461388\npermalink: d6526fdfa6\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:41:56.595502000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:41:59.286586
896	Order	208	update	\N	---\nshipped: new\nid: 208\npermalink: d6526fdfa6\nname: order-595c461388\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:41:59.286586000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:42:13.078236
897	Order	208	update	\N	---\nshipped: new\nid: 208\npermalink: d6526fdfa6\nname: order-595c461388\nprice: !ruby/object:BigDecimal 36:0.496908000000000004644E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.32508000000000004644E3\nsubtotal: !ruby/object:BigDecimal 18:0.4644E4\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:42:13.078236000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:42:36.642647
898	Order	208	update	\N	---\nshipped: new\nid: 208\nprice: !ruby/object:BigDecimal 36:0.518308000000000004844E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.33908000000000004844E3\nsubtotal: !ruby/object:BigDecimal 18:0.4844E4\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-595c461388\npermalink: d6526fdfa6\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:42:36.642647000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:50:36.529634
899	Order	208	update	\N	---\nshipped: new\nid: 208\nprice: !ruby/object:BigDecimal 27:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 18:0.2E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-595c461388\npermalink: d6526fdfa6\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:50:36.529634000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:50:45.427035
900	Order	208	update	\N	---\nshipped: new\nid: 208\npermalink: d6526fdfa6\nname: order-595c461388\nprice: !ruby/object:BigDecimal 18:0.0\ncomplete: false\ntax: !ruby/object:BigDecimal 18:0.0\nsubtotal: !ruby/object:BigDecimal 18:0.0\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:50:45.427035000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:51:05.021805
901	Order	208	update	\N	---\nshipped: new\nid: 208\npermalink: d6526fdfa6\nname: order-595c461388\nprice: !ruby/object:BigDecimal 27:0.642000000000000006E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.42000000000000006E2\nsubtotal: !ruby/object:BigDecimal 18:0.6E3\nshipping: !ruby/object:BigDecimal 27:0.0\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:51:05.021805000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:51:50.887532
902	Order	208	update	\N	---\nshipped: new\nid: 208\nprice: !ruby/object:BigDecimal 36:0.312761000000000002923E4\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.20461000000000002923E3\nsubtotal: !ruby/object:BigDecimal 18:0.2923E4\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-595c461388\npermalink: d6526fdfa6\ncreated_at: 2017-05-24 13:47:58.127553000 Z\nupdated_at: 2017-05-24 14:51:50.887532000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-24 14:54:51.298917
903	Order	209	create	\N	\N	2017-05-25 07:36:26.550079
930	Order	220	update	\N	---\nshipped: new\nid: 220\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-4abed92adc\npermalink: a283d31be3\ncreated_at: 2017-05-27 10:42:52.906026000 Z\nupdated_at: 2017-05-27 10:42:52.906026000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 10:43:16.221707
904	Order	209	update	\N	---\nshipped: new\nid: 209\nprice: !ruby/object:BigDecimal 27:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 18:0.2E3\nshipping: !ruby/object:BigDecimal 27:0.0\nname: order-6019649a9f\npermalink: fc3d7778fd\ncreated_at: 2017-05-25 07:36:26.550079000 Z\nupdated_at: 2017-05-25 07:36:26.550079000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-25 07:36:42.637763
905	Order	210	create	\N	\N	2017-05-26 14:54:55.528425
906	Order	210	update	\N	---\nshipped: new\nid: 210\nprice: !ruby/object:BigDecimal 27:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 18:0.2E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-22b84f4601\npermalink: 80e4ad86cb\ncreated_at: 2017-05-26 14:54:55.528425000 Z\nupdated_at: 2017-05-26 14:54:55.528425000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 14:56:26.445101
907	Order	210	update	\N	---\nshipped: new\nid: 210\nprice: !ruby/object:BigDecimal 36:0.428000000000000004E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.28000000000000004E2\nsubtotal: !ruby/object:BigDecimal 27:0.4E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-22b84f4601\npermalink: 80e4ad86cb\ncreated_at: 2017-05-26 14:54:55.528425000 Z\nupdated_at: 2017-05-26 14:56:26.445101000 Z\nshipping_address_id: 192\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 14:56:43.172172
908	Order	211	create	\N	\N	2017-05-26 14:58:20.266417
909	Order	211	update	\N	---\nshipped: new\nid: 211\nprice: !ruby/object:BigDecimal 36:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 27:0.2E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-72d9743adb\npermalink: 5c6c5b723c\ncreated_at: 2017-05-26 14:58:20.266417000 Z\nupdated_at: 2017-05-26 14:58:20.266417000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 14:58:28.264724
910	Order	211	update	\N	---\nshipped: new\nid: 211\nprice: !ruby/object:BigDecimal 36:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 27:0.2E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-72d9743adb\npermalink: 5c6c5b723c\ncreated_at: 2017-05-26 14:58:20.266417000 Z\nupdated_at: 2017-05-26 14:58:28.264724000 Z\nshipping_address_id: 193\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 14:58:47.281033
911	Order	212	create	\N	\N	2017-05-26 15:02:01.423946
912	Order	213	create	\N	\N	2017-05-26 15:02:19.549186
913	Order	213	update	\N	---\nshipped: new\nid: 213\nprice: !ruby/object:BigDecimal 36:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 27:0.2E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-ca271d5f5b\npermalink: 064090c8fc\ncreated_at: 2017-05-26 15:02:19.549186000 Z\nupdated_at: 2017-05-26 15:02:19.549186000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 15:02:28.63704
914	Order	213	update	\N	---\nshipped: new\nid: 213\nprice: !ruby/object:BigDecimal 27:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 27:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 18:0.2E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-ca271d5f5b\npermalink: 064090c8fc\ncreated_at: 2017-05-26 15:02:19.549186000 Z\nupdated_at: 2017-05-26 15:02:28.637040000 Z\nshipping_address_id: 194\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 15:04:43.669636
915	Order	214	create	\N	\N	2017-05-26 15:05:40.70798
916	Order	214	update	\N	---\nshipped: new\nid: 214\nprice: !ruby/object:BigDecimal 36:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 27:0.2E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-9d33b4f6fd\npermalink: '4084438714'\ncreated_at: 2017-05-26 15:05:40.707980000 Z\nupdated_at: 2017-05-26 15:05:40.707980000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 15:05:50.165763
917	Order	214	update	\N	---\nshipped: new\nid: 214\nprice: !ruby/object:BigDecimal 36:0.214000000000000002E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.14000000000000002E2\nsubtotal: !ruby/object:BigDecimal 27:0.2E3\nshipping: \nname: order-9d33b4f6fd\npermalink: '4084438714'\ncreated_at: 2017-05-26 15:05:40.707980000 Z\nupdated_at: 2017-05-26 15:05:50.165763000 Z\nshipping_address_id: 195\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 15:06:25.071451
918	Order	215	create	\N	\N	2017-05-26 15:07:46.726627
919	Order	215	update	\N	---\nshipped: new\nid: 215\nprice: !ruby/object:BigDecimal 36:0.535000000000000005E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.35000000000000005E2\nsubtotal: !ruby/object:BigDecimal 27:0.5E3\nshipping: !ruby/object:BigDecimal 18:0.0\nname: order-33d8768cbd\npermalink: b480083905\ncreated_at: 2017-05-26 15:07:46.726627000 Z\nupdated_at: 2017-05-26 15:07:46.726627000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 15:07:53.627746
920	Order	215	update	\N	---\nshipped: new\nid: 215\nprice: !ruby/object:BigDecimal 36:0.535000000000000005E3\ncomplete: false\ntax: !ruby/object:BigDecimal 36:0.35000000000000005E2\nsubtotal: !ruby/object:BigDecimal 27:0.5E3\nshipping: !ruby/object:BigDecimal 27:0.25E2\nname: order-33d8768cbd\npermalink: b480083905\ncreated_at: 2017-05-26 15:07:46.726627000 Z\nupdated_at: 2017-05-26 15:07:53.627746000 Z\nshipping_address_id: 196\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-26 15:08:12.84645
921	Order	216	create	\N	\N	2017-05-27 06:41:16.279014
922	Order	216	update	\N	---\nshipped: new\nid: 216\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-1e3df6f09d\npermalink: cdce7f8eb2\ncreated_at: 2017-05-27 06:41:16.279014000 Z\nupdated_at: 2017-05-27 06:41:16.279014000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 08:56:05.279942
923	Order	216	update	\N	---\nshipped: new\nid: 216\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-1e3df6f09d\npermalink: cdce7f8eb2\ncreated_at: 2017-05-27 06:41:16.279014000 Z\nupdated_at: 2017-05-27 08:56:05.279942000 Z\nshipping_address_id: 197\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 09:09:45.943964
924	Order	217	create	\N	\N	2017-05-27 09:21:08.054503
925	Order	217	update	\N	---\nshipped: new\nid: 217\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-94a8db0a88\npermalink: 0a121e96ed\ncreated_at: 2017-05-27 09:21:08.054503000 Z\nupdated_at: 2017-05-27 09:21:08.054503000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 09:30:37.878803
926	Order	217	update	\N	---\nshipped: new\nid: 217\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-94a8db0a88\npermalink: 0a121e96ed\ncreated_at: 2017-05-27 09:21:08.054503000 Z\nupdated_at: 2017-05-27 09:30:37.878803000 Z\nshipping_address_id: 198\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 09:41:01.514583
927	Order	218	create	\N	\N	2017-05-27 09:42:15.45739
928	Order	219	create	\N	\N	2017-05-27 09:42:56.322171
929	Order	220	create	\N	\N	2017-05-27 10:42:52.906026
932	Order	221	create	\N	\N	2017-05-27 11:01:24.784689
944	Order	227	update	\N	---\nshipped: new\nid: 227\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-67ec7f26ae\npermalink: 796769db7d\ncreated_at: 2017-05-27 17:57:11.713141000 Z\nupdated_at: 2017-05-27 17:57:41.447588000 Z\nshipping_address_id: 202\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-27 17:58:03.783584
945	Order	228	create	\N	\N	2017-05-27 18:03:31.076391
946	Order	229	create	\N	\N	2017-05-29 09:47:03.56362
947	Order	230	create	\N	\N	2017-05-29 12:57:35.251935
948	Order	231	create	\N	\N	2017-05-29 13:04:53.396107
949	Order	232	create	\N	\N	2017-05-29 13:58:20.74546
950	Order	232	update	\N	---\nshipped: new\nid: 232\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-dbb46fd2e1\npermalink: 31a5982667\ncreated_at: 2017-05-29 13:58:20.745460000 Z\nupdated_at: 2017-05-29 13:58:20.745460000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 13:59:09.864179
951	Order	232	update	\N	---\nshipped: new\nid: 232\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-dbb46fd2e1\npermalink: 31a5982667\ncreated_at: 2017-05-29 13:58:20.745460000 Z\nupdated_at: 2017-05-29 13:59:09.864179000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: iop@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 13:59:49.23988
952	Order	232	update	\N	---\nshipped: new\nid: 232\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-dbb46fd2e1\npermalink: 31a5982667\ncreated_at: 2017-05-29 13:58:20.745460000 Z\nupdated_at: 2017-05-29 13:59:49.239880000 Z\nshipping_address_id: 203\nbilling_address_id: \ntoken: \nemail: iop@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:00:14.196894
953	Order	233	create	\N	\N	2017-05-29 14:02:18.749482
954	Order	233	update	\N	---\nshipped: new\nid: 233\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-21f38da135\npermalink: acf9c2155b\ncreated_at: 2017-05-29 14:02:18.749482000 Z\nupdated_at: 2017-05-29 14:02:18.749482000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:02:33.171969
955	Order	233	update	\N	---\nshipped: new\nid: 233\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-21f38da135\npermalink: acf9c2155b\ncreated_at: 2017-05-29 14:02:18.749482000 Z\nupdated_at: 2017-05-29 14:02:33.171969000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: uutyu@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:03:09.193716
956	Order	233	update	\N	---\nshipped: new\nid: 233\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-21f38da135\npermalink: acf9c2155b\ncreated_at: 2017-05-29 14:02:18.749482000 Z\nupdated_at: 2017-05-29 14:03:09.193716000 Z\nshipping_address_id: 204\nbilling_address_id: \ntoken: \nemail: uutyu@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:08:17.385044
957	Order	233	update	\N	---\nshipped: new\nid: 233\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-21f38da135\npermalink: acf9c2155b\ncreated_at: 2017-05-29 14:02:18.749482000 Z\nupdated_at: 2017-05-29 14:08:17.385044000 Z\nshipping_address_id: 204\nbilling_address_id: \ntoken: \nemail: abcd@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:08:50.935269
958	Order	234	create	\N	\N	2017-05-29 14:09:41.660672
959	Order	234	update	\N	---\nshipped: new\nid: 234\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-9e0f0bd389\npermalink: 8e70ac6513\ncreated_at: 2017-05-29 14:09:41.660672000 Z\nupdated_at: 2017-05-29 14:09:41.660672000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:10:12.542635
960	Order	234	update	\N	---\nshipped: new\nid: 234\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-9e0f0bd389\npermalink: 8e70ac6513\ncreated_at: 2017-05-29 14:09:41.660672000 Z\nupdated_at: 2017-05-29 14:10:12.542635000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: qwe@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:10:39.134051
961	Order	234	update	\N	---\nshipped: new\nid: 234\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-9e0f0bd389\npermalink: 8e70ac6513\ncreated_at: 2017-05-29 14:09:41.660672000 Z\nupdated_at: 2017-05-29 14:10:39.134051000 Z\nshipping_address_id: 205\nbilling_address_id: \ntoken: \nemail: qwe@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:10:57.246629
962	Order	234	update	\N	---\nshipped: new\nid: 234\nprice: \ncomplete: true\ntax: \nsubtotal: \nshipping: \nname: order-9e0f0bd389\npermalink: 8e70ac6513\ncreated_at: 2017-05-29 14:09:41.660672000 Z\nupdated_at: 2017-05-29 14:10:57.246629810 Z\nshipping_address_id: 205\nbilling_address_id: \ntoken: p8tRAafa8GoRwJM7BRkC7Q\nemail: qwe@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:10:57.849899
963	Order	234	update	\N	---\nshipped: new\norder_otp: 7212\nid: 234\nprice: \ncomplete: true\ntax: \nsubtotal: \nshipping: \nname: order-9e0f0bd389\npermalink: 8e70ac6513\ncreated_at: 2017-05-29 14:09:41.660672000 Z\nupdated_at: 2017-05-29 14:10:57.849899000 Z\nshipping_address_id: 205\nbilling_address_id: \ntoken: p8tRAafa8GoRwJM7BRkC7Q\nemail: qwe@gmail.com\nphone_verified: \n	2017-05-29 14:12:55.777526
964	Order	235	create	\N	\N	2017-05-29 14:13:27.350786
965	Order	235	update	\N	---\nshipped: new\nid: 235\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-80b412388b\npermalink: 61bce37e25\ncreated_at: 2017-05-29 14:13:27.350786000 Z\nupdated_at: 2017-05-29 14:13:27.350786000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:13:50.157475
966	Order	235	update	\N	---\nshipped: new\nid: 235\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-80b412388b\npermalink: 61bce37e25\ncreated_at: 2017-05-29 14:13:27.350786000 Z\nupdated_at: 2017-05-29 14:13:50.157475000 Z\nshipping_address_id: 206\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 14:14:45.39261
967	Order	236	create	\N	\N	2017-05-29 18:35:36.303061
968	Order	236	update	\N	---\nshipped: new\nid: 236\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-1e8f352505\npermalink: 7d0ce032e9\ncreated_at: 2017-05-29 18:35:36.303061000 Z\nupdated_at: 2017-05-29 18:35:36.303061000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 19:20:50.431513
969	Order	237	create	\N	\N	2017-05-29 20:22:39.413671
970	Order	238	create	\N	\N	2017-05-29 20:25:14.326611
971	Order	238	update	\N	---\nshipped: new\nid: 238\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-4daf858e9d\npermalink: 71685e166b\ncreated_at: 2017-05-29 20:25:14.326611000 Z\nupdated_at: 2017-05-29 20:25:14.326611000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-29 20:25:28.39665
972	Order	239	create	\N	\N	2017-05-29 20:34:18.101481
973	Order	240	create	\N	\N	2017-05-29 22:08:32.9344
974	Order	241	create	\N	\N	2017-05-30 07:13:03.256987
975	Order	242	create	\N	\N	2017-05-30 07:14:04.421977
976	Order	243	create	\N	\N	2017-05-30 12:19:14.6241
977	Order	244	create	\N	\N	2017-05-30 13:06:42.131214
978	Order	244	update	\N	---\nshipped: new\nid: 244\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-32f3a6d976\npermalink: cf1374a4a4\ncreated_at: 2017-05-30 13:06:42.131214000 Z\nupdated_at: 2017-05-30 13:06:42.131214000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-30 13:52:06.404892
979	Order	244	update	\N	---\nshipped: new\nid: 244\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-32f3a6d976\npermalink: cf1374a4a4\ncreated_at: 2017-05-30 13:06:42.131214000 Z\nupdated_at: 2017-05-30 13:52:06.404892000 Z\nshipping_address_id: 208\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-30 13:52:54.640599
980	Order	245	create	\N	\N	2017-05-30 14:14:33.346062
981	Order	245	update	\N	---\nshipped: new\nid: 245\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-4ebe557664\npermalink: 140225a10c\ncreated_at: 2017-05-30 14:14:33.346062000 Z\nupdated_at: 2017-05-30 14:14:33.346062000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \n	2017-05-30 14:25:14.122435
982	Order	246	create	\N	\N	2017-05-30 19:10:11.603793
983	Order	247	create	\N	\N	2017-05-31 08:30:22.062697
984	Order	248	create	\N	\N	2017-05-31 13:44:00.732569
985	Order	248	update	\N	---\nshipped: new\nid: 248\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-3d531fce01\npermalink: ca530af7e9\ncreated_at: 2017-05-31 13:44:00.732569000 Z\nupdated_at: 2017-05-31 13:44:00.732569000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \nuser_id: \n	2017-05-31 13:44:13.921658
986	Order	248	update	\N	---\nshipped: new\nid: 248\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-3d531fce01\npermalink: ca530af7e9\ncreated_at: 2017-05-31 13:44:00.732569000 Z\nupdated_at: 2017-05-31 13:44:13.921658000 Z\nshipping_address_id: 210\nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nphone_verified: \nuser_id: \n	2017-05-31 13:45:21.047094
987	Order	249	create	\N	\N	2017-06-01 13:55:23.255784
988	Order	250	create	\N	\N	2017-06-02 14:20:31.465943
989	Order	251	create	\N	\N	2017-06-02 20:38:56.772142
990	Order	251	update	\N	---\nshipped: new\nid: 251\nprice: \ncomplete: false\ntax: \nsubtotal: \nshipping: \nname: order-1bc3473b17\npermalink: fd4a12aed1\ncreated_at: 2017-06-02 20:38:56.772142000 Z\nupdated_at: 2017-06-02 20:38:56.772142000 Z\nshipping_address_id: \nbilling_address_id: \ntoken: \nemail: abc@gmail.com\norder_otp: \nuser_id: \n	2017-06-03 07:32:09.135399
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('versions_id_seq', 990, true);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: green_x
--

COPY votes (id, user_id, project_id, weight, created_at, updated_at) FROM stdin;
9	76	20	1	2017-06-01 13:25:32.180091	2017-06-01 13:25:32.180091
11	75	21	1	2017-06-02 14:12:33.38002	2017-06-02 14:12:33.38002
14	82	19	1	2017-06-02 16:12:58.921762	2017-06-02 16:12:58.921762
16	82	22	1	2017-06-02 16:16:41.543209	2017-06-02 16:16:41.543209
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: green_x
--

SELECT pg_catalog.setval('votes_id_seq', 16, true);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: book_types_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY book_types
    ADD CONSTRAINT book_types_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contests_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY contests
    ADD CONSTRAINT contests_pkey PRIMARY KEY (id);


--
-- Name: group_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY group_invitations
    ADD CONSTRAINT group_invitations_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: product_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY product_prices
    ADD CONSTRAINT product_prices_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: project_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_categories
    ADD CONSTRAINT project_categories_pkey PRIMARY KEY (id);


--
-- Name: project_users_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_users
    ADD CONSTRAINT project_users_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: redemption_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY redemption_codes
    ADD CONSTRAINT redemption_codes_pkey PRIMARY KEY (id);


--
-- Name: refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY refunds
    ADD CONSTRAINT refunds_pkey PRIMARY KEY (id);


--
-- Name: sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY sponsors
    ADD CONSTRAINT sponsors_pkey PRIMARY KEY (id);


--
-- Name: subscription_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY subscription_plans
    ADD CONSTRAINT subscription_plans_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: green_x
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: green_x
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_comments_on_commentable_type_and_commentable_id ON comments USING btree (commentable_type, commentable_id);


--
-- Name: index_comments_on_project_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_comments_on_project_id ON comments USING btree (project_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_group_invitations_on_group_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_group_invitations_on_group_id ON group_invitations USING btree (group_id);


--
-- Name: index_groups_on_project_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_groups_on_project_id ON groups USING btree (project_id);


--
-- Name: index_images_on_project_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_images_on_project_id ON images USING btree (project_id);


--
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_order_products_on_order_id ON order_products USING btree (order_id);


--
-- Name: index_order_products_on_product_price_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_order_products_on_product_price_id ON order_products USING btree (product_price_id);


--
-- Name: index_payments_on_order_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_payments_on_order_id ON payments USING btree (order_id);


--
-- Name: index_payments_on_subscription_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_payments_on_subscription_id ON payments USING btree (subscription_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_payments_on_user_id ON payments USING btree (user_id);


--
-- Name: index_product_prices_on_product_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_product_prices_on_product_id ON product_prices USING btree (product_id);


--
-- Name: index_products_on_book_types_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_products_on_book_types_id ON products USING btree (book_types_id);


--
-- Name: index_products_on_book_versions_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_products_on_book_versions_id ON products USING btree (book_versions_id);


--
-- Name: index_project_categories_on_category_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_project_categories_on_category_id ON project_categories USING btree (category_id);


--
-- Name: index_project_categories_on_project_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_project_categories_on_project_id ON project_categories USING btree (project_id);


--
-- Name: index_project_users_on_project_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_project_users_on_project_id ON project_users USING btree (project_id);


--
-- Name: index_project_users_on_user_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_project_users_on_user_id ON project_users USING btree (user_id);


--
-- Name: index_projects_on_contest_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_projects_on_contest_id ON projects USING btree (contest_id);


--
-- Name: index_refunds_on_order_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_refunds_on_order_id ON refunds USING btree (order_id);


--
-- Name: index_refunds_on_payment_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_refunds_on_payment_id ON refunds USING btree (payment_id);


--
-- Name: index_refunds_on_subscription_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_refunds_on_subscription_id ON refunds USING btree (subscription_id);


--
-- Name: index_subscriptions_on_subscription_plan_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_subscriptions_on_subscription_plan_id ON subscriptions USING btree (subscription_plan_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: green_x
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: green_x
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: green_x
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_votes_on_project_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_votes_on_project_id ON votes USING btree (project_id);


--
-- Name: index_votes_on_user_id; Type: INDEX; Schema: public; Owner: green_x
--

CREATE INDEX index_votes_on_user_id ON votes USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: green_x
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_034045bca4; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_034045bca4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_140df92c9d; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_categories
    ADD CONSTRAINT fk_rails_140df92c9d FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_2b3f0e1313; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_users
    ADD CONSTRAINT fk_rails_2b3f0e1313 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_58ab656b55; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_58ab656b55 FOREIGN KEY (subscription_plan_id) REFERENCES subscription_plans(id);


--
-- Name: fk_rails_85e5abc143; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT fk_rails_85e5abc143 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_8d3b6abcda; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_rails_8d3b6abcda FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_8dcacd974b; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY refunds
    ADD CONSTRAINT fk_rails_8dcacd974b FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_8e489abc06; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT fk_rails_8e489abc06 FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: fk_rails_8ed44ceae1; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY group_invitations
    ADD CONSTRAINT fk_rails_8ed44ceae1 FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: fk_rails_aa6f5257a4; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT fk_rails_aa6f5257a4 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_b2d7c49bec; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY refunds
    ADD CONSTRAINT fk_rails_b2d7c49bec FOREIGN KEY (payment_id) REFERENCES payments(id);


--
-- Name: fk_rails_b44c116138; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_users
    ADD CONSTRAINT fk_rails_b44c116138 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c0391eb770; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_c0391eb770 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c5b9bb64b0; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY refunds
    ADD CONSTRAINT fk_rails_c5b9bb64b0 FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: fk_rails_d1173d0eb7; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT fk_rails_d1173d0eb7 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_d96f20106d; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY project_categories
    ADD CONSTRAINT fk_rails_d96f20106d FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_de8998b498; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_rails_de8998b498 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_e27612e095; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_rails_e27612e095 FOREIGN KEY (contest_id) REFERENCES contests(id);


--
-- Name: fk_rails_f0da364ad7; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_f0da364ad7 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_f28afe93bc; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_rails_f28afe93bc FOREIGN KEY (product_price_id) REFERENCES product_prices(id);


--
-- Name: fk_rails_fc6dc19401; Type: FK CONSTRAINT; Schema: public; Owner: green_x
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT fk_rails_fc6dc19401 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

