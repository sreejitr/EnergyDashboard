--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: sb_dash; Type: SCHEMA; Schema: -; Owner: sreejitaray
--

CREATE SCHEMA sb_dash;


ALTER SCHEMA sb_dash OWNER TO sreejitaray;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA sb_dash;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = sb_dash, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: channel_plug_loads; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE channel_plug_loads (
    node_id integer NOT NULL,
    channel_id integer NOT NULL,
    power real,
    status integer,
    time_stamp timestamp(6) without time zone NOT NULL,
    voltage real,
    current real,
    frequency real,
    power_factor real,
    sample_interval real
);


ALTER TABLE sb_dash.channel_plug_loads OWNER TO sreejitaray;

--
-- Name: channel_profiles; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE channel_profiles (
    channel_profile_id integer NOT NULL,
    description character varying(255),
    name character varying(255),
    device character varying(255),
    metadata_url character varying(500),
    user_id character varying(255),
    additional_info character varying(255)
);


ALTER TABLE sb_dash.channel_profiles OWNER TO sreejitaray;

--
-- Name: channel_profiles_channel_profile_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE channel_profiles_channel_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.channel_profiles_channel_profile_id_seq OWNER TO sreejitaray;

--
-- Name: channel_profiles_channel_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE channel_profiles_channel_profile_id_seq OWNED BY channel_profiles.channel_profile_id;


--
-- Name: channels; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE channels (
    channel_profile_id integer NOT NULL,
    channel_id integer NOT NULL,
    node_id integer NOT NULL,
    enabled character varying(255),
    sensor_num integer,
    sensor_type character varying(255),
    status_url character varying(500),
    "covThreshold" character varying(255),
    enmetric_channel_guid character varying(255)
);


ALTER TABLE sb_dash.channels OWNER TO sreejitaray;

--
-- Name: cubicles; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE cubicles (
    cubible_id integer NOT NULL,
    room_id integer NOT NULL,
    cubicle_number integer,
    description character varying(255),
    location_id integer NOT NULL,
    user_id character varying(255)
);


ALTER TABLE sb_dash.cubicles OWNER TO sreejitaray;

--
-- Name: cubicles_cubible_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE cubicles_cubible_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.cubicles_cubible_id_seq OWNER TO sreejitaray;

--
-- Name: cubicles_cubible_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE cubicles_cubible_id_seq OWNED BY cubicles.cubible_id;


--
-- Name: floors; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE floors (
    floor_id integer NOT NULL,
    floor_number integer,
    description character varying(255),
    location_id integer NOT NULL
);


ALTER TABLE sb_dash.floors OWNER TO sreejitaray;

--
-- Name: floors_floor_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE floors_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.floors_floor_id_seq OWNER TO sreejitaray;

--
-- Name: floors_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE floors_floor_id_seq OWNED BY floors.floor_id;


--
-- Name: locations; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE locations (
    location_id integer NOT NULL,
    location geometry(LineString)
);


ALTER TABLE sb_dash.locations OWNER TO sreejitaray;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE locations_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.locations_location_id_seq OWNER TO sreejitaray;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE locations_location_id_seq OWNED BY locations.location_id;


--
-- Name: node_profiles; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE node_profiles (
    node_profile_id integer NOT NULL,
    node_name character varying(255),
    metadata_url character varying(500),
    num_of_channels integer,
    hardware_version character varying(255),
    firmware_version character varying(255)
);


ALTER TABLE sb_dash.node_profiles OWNER TO sreejitaray;

--
-- Name: node_profiles_node_profile_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE node_profiles_node_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.node_profiles_node_profile_id_seq OWNER TO sreejitaray;

--
-- Name: node_profiles_node_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE node_profiles_node_profile_id_seq OWNED BY node_profiles.node_profile_id;


--
-- Name: nodes; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE nodes (
    node_id integer NOT NULL,
    node_profile_id integer NOT NULL,
    mac_addr character varying(255),
    bridge_mac_addr character varying(255),
    state character varying(255),
    online character varying(255),
    status_url character varying(500),
    last_updated timestamp(6) without time zone,
    enmetric_node_guid character varying(255),
    user_id character varying(255) NOT NULL,
    cubicle_id integer
);


ALTER TABLE sb_dash.nodes OWNER TO sreejitaray;

--
-- Name: nodes_node_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE nodes_node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.nodes_node_id_seq OWNER TO sreejitaray;

--
-- Name: nodes_node_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE nodes_node_id_seq OWNED BY nodes.node_id;


--
-- Name: room_types; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE room_types (
    type_id integer NOT NULL,
    description character varying(255)
);


ALTER TABLE sb_dash.room_types OWNER TO sreejitaray;

--
-- Name: room_types_type_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE room_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.room_types_type_id_seq OWNER TO sreejitaray;

--
-- Name: room_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE room_types_type_id_seq OWNED BY room_types.type_id;


--
-- Name: rooms; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE rooms (
    room_id integer NOT NULL,
    room_number integer,
    floor_id integer NOT NULL,
    wing_id integer NOT NULL,
    description character varying(255),
    type_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE sb_dash.rooms OWNER TO sreejitaray;

--
-- Name: rooms_room_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE rooms_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.rooms_room_id_seq OWNER TO sreejitaray;

--
-- Name: rooms_room_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE rooms_room_id_seq OWNED BY rooms.room_id;


--
-- Name: users; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE users (
    user_id character varying(255) NOT NULL,
    password character varying(255),
    node_id integer
);


ALTER TABLE sb_dash.users OWNER TO sreejitaray;

--
-- Name: wings; Type: TABLE; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

CREATE TABLE wings (
    wing_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE sb_dash.wings OWNER TO sreejitaray;

--
-- Name: wings_wing_id_seq; Type: SEQUENCE; Schema: sb_dash; Owner: sreejitaray
--

CREATE SEQUENCE wings_wing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sb_dash.wings_wing_id_seq OWNER TO sreejitaray;

--
-- Name: wings_wing_id_seq; Type: SEQUENCE OWNED BY; Schema: sb_dash; Owner: sreejitaray
--

ALTER SEQUENCE wings_wing_id_seq OWNED BY wings.wing_id;


--
-- Name: channel_profile_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY channel_profiles ALTER COLUMN channel_profile_id SET DEFAULT nextval('channel_profiles_channel_profile_id_seq'::regclass);


--
-- Name: cubible_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY cubicles ALTER COLUMN cubible_id SET DEFAULT nextval('cubicles_cubible_id_seq'::regclass);


--
-- Name: floor_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY floors ALTER COLUMN floor_id SET DEFAULT nextval('floors_floor_id_seq'::regclass);


--
-- Name: location_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY locations ALTER COLUMN location_id SET DEFAULT nextval('locations_location_id_seq'::regclass);


--
-- Name: node_profile_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY node_profiles ALTER COLUMN node_profile_id SET DEFAULT nextval('node_profiles_node_profile_id_seq'::regclass);


--
-- Name: node_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY nodes ALTER COLUMN node_id SET DEFAULT nextval('nodes_node_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY room_types ALTER COLUMN type_id SET DEFAULT nextval('room_types_type_id_seq'::regclass);


--
-- Name: room_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY rooms ALTER COLUMN room_id SET DEFAULT nextval('rooms_room_id_seq'::regclass);


--
-- Name: wing_id; Type: DEFAULT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY wings ALTER COLUMN wing_id SET DEFAULT nextval('wings_wing_id_seq'::regclass);


--
-- Data for Name: channel_plug_loads; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY channel_plug_loads (node_id, channel_id, power, status, time_stamp, voltage, current, frequency, power_factor, sample_interval) FROM stdin;
1	1	3.43000007	1	2014-06-20 07:00:00	118.040001	0.0489999987	60.2000008	0.600000024	1
1	2	10.4200001	1	2014-06-20 07:00:00	118.040001	0.150999993	60.2000008	0.600000024	1
1	3	3.13000011	1	2014-06-20 07:00:00	118.040001	0.0529999994	60.2000008	0.5	1
1	4	12.5200005	1	2014-06-20 07:00:00	118.040001	0.187000006	60.2000008	0.600000024	1
2	1	1.03999996	1	2014-06-20 07:00:00	117.839996	0.0769999996	60.2000008	0.100000001	1
2	2	0.790000021	1	2014-06-20 07:00:00	117.839996	0.0179999992	60.2000008	0.400000006	1
2	3	0.529999971	1	2014-06-20 07:00:00	117.839996	0.0130000003	60.2000008	0.300000012	1
2	4	1.53999996	1	2014-06-20 07:00:00	117.839996	0.0289999992	60.2000008	0.400000006	1
1	1	3.43000007	1	2014-06-20 07:01:00	117.900002	0.0489999987	60.2000008	0.600000024	1
1	2	10.4099998	1	2014-06-20 07:01:00	117.900002	0.150000006	60.2000008	0.600000024	1
1	3	3.13000011	1	2014-06-20 07:01:00	117.900002	0.0529999994	60.2000008	0.5	1
1	4	12.79	1	2014-06-20 07:01:00	117.900002	0.191	60.2000008	0.600000024	1
2	1	1.03999996	1	2014-06-20 07:01:00	117.709999	0.0769999996	60.2000008	0.100000001	1
2	2	0.790000021	1	2014-06-20 07:01:00	117.709999	0.0170000009	60.2000008	0.400000006	1
2	3	0.529999971	1	2014-06-20 07:01:00	117.709999	0.0130000003	60.2000008	0.300000012	1
2	4	1.53999996	1	2014-06-20 07:01:00	117.709999	0.0289999992	60.2000008	0.400000006	1
\.


--
-- Data for Name: channel_profiles; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY channel_profiles (channel_profile_id, description, name, device, metadata_url, user_id, additional_info) FROM stdin;
1	Node 1.0 Channel 1	\N	Windows Power Supply	\N	user1	RCP-1UI
2	Node 1.0 Channel 2	\N	Windows Power Supply	\N	user1	RCP-1UI
3	Node 1.0 Channel 3	\N	Windows Power Supply	\N	user1	RCP-1UI
4	Node 1.0 Channel 4	\N		\N	user1	
5	Node 2.0 Channel 1	\N	Windows Power Supply Upper	\N	user2	RCP-1UI
6	Node 2.0 Channel 2	\N	Windows Power Supply Upper	\N	user2	RCP-1UI
7	Node 2.0 Channel 3	\N	Windows Power Supply Upper	\N	user2	RCP-1UI
8	Node 2.0 Channel 4	\N		\N	user2	
9	Node 3.0 Channel 1	\N	MechoShade I-Con	\N	user3	Sun Dialer
10	Node 3.0 Channel 2	\N	MechoShade PCI-3	\N	user3	RS-485
11	Node 3.0 Channel 3	\N	MechoShade I-Con	\N	user3	Sun Dialer
12	Node 3.0 Channel 4	\N		\N	user3	
13	Node 4.0 Channel 1	\N	Laptop	\N	user4	MechoShade HP ProBook 4720s
14	Node 4.0 Channel 2	\N	Cart Power Strip	\N	user4	nothing plugged in
15	Node 4.0 Channel 3	\N		\N	user4	
16	Node 4.0 Channel 4	\N	Desktop Computer	\N	user4	Lutron Dell PowerEdge T610 with APS
17	Node 5.0 Channel 1	\N	Power Strip	\N	user5	Digital Clock
18	Node 5.0 Channel 2	\N		\N	user5	
19	Node 5.0 Channel 3	\N	Lamp	\N	user5	
20	Node 5.0 Channel 4	\N	Power Strip	\N	user5	2 Monitors and 3 Chargers
21	Node 6.0 Channel 1	\N		\N	user6	
22	Node 6.0 Channel 2	\N	Monitor	\N	user6	Dell
23	Node 6.0 Channel 3	\N		\N	user6	
24	Node 6.0 Channel 4	\N		\N	user6	
25	Node 7.0 Channel 1	\N		\N	user7	
26	Node 7.0 Channel 2	\N		\N	user7	
27	Node 7.0 Channel 3	\N		\N	user7	
28	Node 7.0 Channel 4	\N	Polycom	\N	user7	
29	Node 8.0 Channel 1	\N		\N	user8	
30	Node 8.0 Channel 2	\N		\N	user8	
31	Node 8.0 Channel 3	\N	Monitor	\N	user8	HP w2408
32	Node 8.0 Channel 4	\N	Laptop Dock	\N	user8	Dell
33	Node 9.0 Channel 1	\N	Table Power Receptacles	\N	user9	
34	Node 9.0 Channel 2	\N	B224 Bridge	\N	user9	
35	Node 9.0 Channel 3	\N		\N	user9	
36	Node 9.0 Channel 4	\N	Polycom	\N	user9	
37	Node 10.0 Channel 1	\N		\N	user10	
38	Node 10.0 Channel 2	\N	Polycom	\N	user10	
39	Node 10.0 Channel 3	\N		\N	user10	
40	Node 10.0 Channel 4	\N	Polycom	\N	user10	
41	Node 11.0 Channel 1	\N	Table power receptacles	\N	user11	Total from 4 plugs
42	Node 11.0 Channel 2	\N		\N	user11	
43	Node 11.0 Channel 3	\N		\N	user11	
44	Node 11.0 Channel 4	\N	Polycom	\N	user11	
45	Node 12.0 Channel 1	\N	Table power receptacles	\N	user12	Total from 4 plugs
46	Node 12.0 Channel 2	\N	Polycom	\N	user12	
47	Node 12.0 Channel 3	\N		\N	user12	
48	Node 12.0 Channel 4	\N		\N	user12	
49	Node 13.0 Channel 1	\N		\N	user13	
50	Node 13.0 Channel 2	\N		\N	user13	
51	Node 13.0 Channel 3	\N		\N	user13	
52	Node 13.0 Channel 4	\N		\N	user13	
53	Node 14.0 Channel 1	\N		\N	user14	
54	Node 14.0 Channel 2	\N		\N	user14	
55	Node 14.0 Channel 3	\N	Speakers	\N	user14	Logitech
56	Node 14.0 Channel 4	\N	Desktop Computer	\N	user14	Lenovo Think Center
57	Node 15.0 Channel 1	\N		\N	user15	
58	Node 15.0 Channel 2	\N	Desktop Computer	\N	user15	Dell Precision T1500
59	Node 15.0 Channel 3	\N	Monitor	\N	user15	Dell 
60	Node 15.0 Channel 4	\N	Scanner	\N	user15	Epson Perfection V30
61	Node 16.0 Channel 1	\N	Desktop computer	\N	user16	Apple iMAC 27-inch
62	Node 16.0 Channel 2	\N		\N	user16	
63	Node 16.0 Channel 3	\N	Battery Recharger	\N	user16	Energier NiMH Battery Charger AA-AAA
64	Node 16.0 Channel 4	\N		\N	user16	
65	Node 17.0 Channel 1	\N		\N	user17	
66	Node 17.0 Channel 2	\N		\N	user17	
67	Node 17.0 Channel 3	\N	External Hard Drive	\N	user17	WD
68	Node 17.0 Channel 4	\N	Laptop 	\N	user17	Macbook Pro
69	Node 18.0 Channel 1	\N	Monitor	\N	user18	Samsung
70	Node 18.0 Channel 2	\N	Computer	\N	user18	Dell
71	Node 18.0 Channel 3	\N	Monitor	\N	user18	HP Compaq LA2405x
72	Node 18.0 Channel 4	\N	Phone Headset	\N	user18	Plantronics
73	Node 19.0 Channel 1	\N	Printer	\N	user19	HP Color LaserJet
74	Node 19.0 Channel 2	\N	Monitor	\N	user19	ViewSonic
75	Node 19.0 Channel 3	\N	Laptop	\N	user19	Dock and Charger
76	Node 19.0 Channel 4	\N		\N	user19	
77	Node 20.0 Channel 1	\N		\N	user20	
78	Node 20.0 Channel 2	\N		\N	user20	
79	Node 20.0 Channel 3	\N	Monitor	\N	user20	Acer
80	Node 20.0 Channel 4	\N		\N	user20	
81	Node 21.0 Channel 1	\N		\N	user21	
82	Node 21.0 Channel 2	\N		\N	user21	
83	Node 21.0 Channel 3	\N		\N	user21	
84	Node 21.0 Channel 4	\N	Monitor	\N	user21	Samsung
85	Node 22.0 Channel 1	\N	Desktop Computer	\N	user22	Dell Precision T3500
86	Node 22.0 Channel 2	\N	Monitor	\N	user22	Dell 
87	Node 22.0 Channel 3	\N	Charger	\N	user22	Macbook
88	Node 22.0 Channel 4	\N		\N	user22	
89	Node 23.0 Channel 1	\N	Laptop Charger	\N	user23	Dell
90	Node 23.0 Channel 2	\N	Monitor	\N	user23	Dell 
91	Node 23.0 Channel 3	\N	Headset Charger	\N	user23	Plantronics
92	Node 23.0 Channel 4	\N	Monitor	\N	user23	Dell
93	Node 24.0 Channel 1	\N	Phone Headset	\N	user24	Plantronics
94	Node 24.0 Channel 2	\N	Monitor	\N	user24	Plavvar
95	Node 24.0 Channel 3	\N	Monitor	\N	user24	Plavvar
96	Node 24.0 Channel 4	\N	Electronic Picture Frame	\N	user24	
97	Node 25.0 Channel 1	\N		\N	user25	
98	Node 25.0 Channel 2	\N		\N	user25	
99	Node 25.0 Channel 3	\N		\N	user25	
100	Node 25.0 Channel 4	\N	Monitor	\N	user25	HP W2371d
101	Node 26.0 Channel 1	\N		\N	user26	
102	Node 26.0 Channel 2	\N		\N	user26	
103	Node 26.0 Channel 3	\N		\N	user26	
104	Node 26.0 Channel 4	\N	Charager	\N	user26	Macbook
105	Node 27.0 Channel 1	\N	Charger	\N	user27	Macbook
106	Node 27.0 Channel 2	\N		\N	user27	
107	Node 27.0 Channel 3	\N		\N	user27	
108	Node 27.0 Channel 4	\N	Smartphone Charger	\N	user27	Blackberry Z10
109	Node 28.0 Channel 1	\N		\N	user28	
110	Node 28.0 Channel 2	\N		\N	user28	
111	Node 28.0 Channel 3	\N		\N	user28	
112	Node 28.0 Channel 4	\N	External Hard Drive	\N	user28	Seagate
113	Node 29.0 Channel 1	\N	Computer	\N	user29	Dell Precision T1700
114	Node 29.0 Channel 2	\N	Monitor	\N	user29	Dell
115	Node 29.0 Channel 3	\N	External hard Drive	\N	user29	Seagate
116	Node 29.0 Channel 4	\N	Charger	\N	user29	PC
117	Node 30.0 Channel 1	\N		\N	user30	
118	Node 30.0 Channel 2	\N		\N	user30	
119	Node 30.0 Channel 3	\N	Power Strip	\N	user30	nothing plugged in
120	Node 30.0 Channel 4	\N		\N	user30	
121	Node 31.0 Channel 1	\N	Monitor	\N	user31	Dell
122	Node 31.0 Channel 2	\N	Monitor	\N	user31	Apple Cinema Display
123	Node 31.0 Channel 3	\N	Laptop	\N	user31	Macbook Pro
124	Node 31.0 Channel 4	\N	Phone Headset	\N	user31	Plantronics
125	Node 32.0 Channel 1	\N	Desktop	\N	user32	Dell Precision T3500
126	Node 32.0 Channel 2	\N	Monitor	\N	user32	Samsung SyncMaster 225bw
127	Node 32.0 Channel 3	\N	External Hard Drive	\N	user32	Seagate
128	Node 32.0 Channel 4	\N	External Hard Drive	\N	user32	Seagate
129	Node 33.0 Channel 1	\N	External Hard Drive	\N	user33	Seagate
130	Node 33.0 Channel 2	\N		\N	user33	
131	Node 33.0 Channel 3	\N	External Hard Drive	\N	user33	Buffalo
132	Node 33.0 Channel 4	\N	Phone Headset	\N	user33	Plantronics
133	Node 34.0 Channel 1	\N		\N	user34	
134	Node 34.0 Channel 2	\N	Desktop computer	\N	user34	Dell Vostro 400
135	Node 34.0 Channel 3	\N		\N	user34	
136	Node 34.0 Channel 4	\N		\N	user34	
137	Node 35.0 Channel 1	\N		\N	user35	
138	Node 35.0 Channel 2	\N		\N	user35	
139	Node 35.0 Channel 3	\N	Monitor	\N	user35	Dell
140	Node 35.0 Channel 4	\N	Monitor 	\N	user35	Samsung
141	Node 36.0 Channel 1	\N	USB hub	\N	user36	Belkin
142	Node 36.0 Channel 2	\N	External Hard Drive	\N	user36	Seagate
143	Node 36.0 Channel 3	\N	External Hard Drive	\N	user36	Seagate (slim design)
144	Node 36.0 Channel 4	\N	External Hard Drive	\N	user36	Seagate
145	Node 37.0 Channel 1	\N		\N	user37	
146	Node 37.0 Channel 2	\N	iMAC 	\N	user37	23-inch ?
147	Node 37.0 Channel 3	\N	Desktop Computer	\N	user37	Dell Vostro 400
148	Node 37.0 Channel 4	\N	Monitor 	\N	user37	HP w2408
149	Node 38.0 Channel 1	\N	External Hard Drive	\N	user38	Seagate (slim design)
150	Node 38.0 Channel 2	\N		\N	user38	
151	Node 38.0 Channel 3	\N	Phone Headset	\N	user38	Plantronics
152	Node 38.0 Channel 4	\N		\N	user38	
153	Node 39.0 Channel 1	\N		\N	user39	
154	Node 39.0 Channel 2	\N		\N	user39	
155	Node 39.0 Channel 3	\N		\N	user39	
156	Node 39.0 Channel 4	\N	Phone Headset	\N	user39	Plantronics
157	Node 40.0 Channel 1	\N	Laptop	\N	user40	HP
158	Node 40.0 Channel 2	\N	Speakers	\N	user40	Logitech
159	Node 40.0 Channel 3	\N	Monitor	\N	user40	Dell
160	Node 40.0 Channel 4	\N	Monitor	\N	user40	HP Compaq LA2206x
161	Node 41.0 Channel 1	\N	Computer	\N	user41	
162	Node 41.0 Channel 2	\N	Monitor	\N	user41	Dell
163	Node 41.0 Channel 3	\N		\N	user41	
164	Node 41.0 Channel 4	\N	Phone Headset	\N	user41	Plantronics
165	Node 42.0 Channel 1	\N		\N	user42	
166	Node 42.0 Channel 2	\N		\N	user42	
167	Node 42.0 Channel 3	\N		\N	user42	
168	Node 42.0 Channel 4	\N		\N	user42	
169	Node 43.0 Channel 1	\N	Power Strip	\N	user43	Samsung tablet charger, Mac charger
170	Node 43.0 Channel 2	\N	Phone Headset	\N	user43	Plantronics
171	Node 43.0 Channel 3	\N	Monitor	\N	user43	HP
172	Node 43.0 Channel 4	\N	Monitor	\N	user43	Apple
173	Node 44.0 Channel 1	\N		\N	user44	
174	Node 44.0 Channel 2	\N		\N	user44	
175	Node 44.0 Channel 3	\N		\N	user44	
176	Node 44.0 Channel 4	\N		\N	user44	
177	Node 45.0 Channel 1	\N		\N	user45	
178	Node 45.0 Channel 2	\N		\N	user45	
179	Node 45.0 Channel 3	\N		\N	user45	
180	Node 45.0 Channel 4	\N	Refrigerator	\N	user45	
181	Node 46.0 Channel 1	\N	Coffee Maker	\N	user46	Cuisinart 
182	Node 46.0 Channel 2	\N	Espresso Maker	\N	user46	Cuisinart
183	Node 46.0 Channel 3	\N		\N	user46	
184	Node 46.0 Channel 4	\N	Lights	\N	user46	
185	Node 47.0 Channel 1	\N		\N	user47	
186	Node 47.0 Channel 2	\N		\N	user47	
187	Node 47.0 Channel 3	\N	Electric Kettle	\N	user47	Hamilton Beach
188	Node 47.0 Channel 4	\N	Coffee Grinder	\N	user47	Krups
189	Node 48.0 Channel 1	\N	Touch Screen	\N	user48	
190	Node 48.0 Channel 2	\N	60" Monitor	\N	user48	Samsung LN60C630K1F
191	Node 48.0 Channel 3	\N		\N	user48	
192	Node 48.0 Channel 4	\N	Desktop Computer	\N	user48	Dell Vostro 400
193	Node 49.0 Channel 1	\N	Desktop Computer	\N	user49	HP Pavilion a310n
194	Node 49.0 Channel 2	\N		\N	user49	
195	Node 49.0 Channel 3	\N	Monitor	\N	user49	ViewSonic ViewPanel VE170m
196	Node 49.0 Channel 4	\N	Weather Station	\N	user49	Acurite
197	Node 50.0 Channel 1	\N		\N	user50	
198	Node 50.0 Channel 2	\N	External Hard Drive	\N	user50	Toshiba
199	Node 50.0 Channel 3	\N		\N	user50	
200	Node 50.0 Channel 4	\N		\N	user50	
201	Node 51.0 Channel 1	\N	Shared Copier	\N	user51	Konica Minolta bizhub 363
202	Node 51.0 Channel 2	\N	Paper Shredder	\N	user51	HSM ShredStar PS817c
203	Node 51.0 Channel 3	\N	Electronic Pencil Sharpener	\N	user51	Panasonic KP-310
204	Node 51.0 Channel 4	\N	Fax Machine	\N	user51	Brother Intellifax 2820
205	Node 52.0 Channel 1	\N	Printer	\N	user52	HP Color LaserJet CP4525
206	Node 52.0 Channel 2	\N		\N	user52	
207	Node 52.0 Channel 3	\N		\N	user52	
208	Node 52.0 Channel 4	\N		\N	user52	
209	Node 53.0 Channel 1	\N	Phone Charger	\N	user53	
210	Node 53.0 Channel 2	\N	Computer	\N	user53	iMac
211	Node 53.0 Channel 3	\N		\N	user53	
212	Node 53.0 Channel 4	\N	Desktop Computer	\N	user53	iMAC
213	Node 54.0 Channel 1	\N	Laptop	\N	user54	MacBook Pro; smart strip is plugged into Enmetric
214	Node 54.0 Channel 2	\N	External Hard Drive	\N	user54	WD
215	Node 54.0 Channel 3	\N	Monitor	\N	user54	Samsung
216	Node 54.0 Channel 4	\N	Heater	\N	user54	Lakewood 792/AA
217	Node 55.0 Channel 1	\N	External Hard Drive	\N	user55	WD
218	Node 55.0 Channel 2	\N	USB Hub	\N	user55	
219	Node 55.0 Channel 3	\N		\N	user55	
220	Node 55.0 Channel 4	\N	Monitor	\N	user55	Samsung
221	Node 56.0 Channel 1	\N	Monitor 	\N	user56	Samsung
222	Node 56.0 Channel 2	\N	Laptop	\N	user56	Macbook Pro
223	Node 56.0 Channel 3	\N		\N	user56	
224	Node 56.0 Channel 4	\N	USB Hub	\N	user56	Plugable
225	Node 57.0 Channel 1	\N	Laptop	\N	user57	MacBook Pro 15" 
226	Node 57.0 Channel 2	\N		\N	user57	
227	Node 57.0 Channel 3	\N	Monitor	\N	user57	Samsung
228	Node 57.0 Channel 4	\N	External Hard Drive	\N	user57	Seagate
229	Node 58.0 Channel 1	\N		\N	user58	
230	Node 58.0 Channel 2	\N		\N	user58	
231	Node 58.0 Channel 3	\N		\N	user58	
232	Node 58.0 Channel 4	\N		\N	user58	
233	Node 59.0 Channel 1	\N		\N	user59	
234	Node 59.0 Channel 2	\N	Laptop	\N	user59	MacBook Pro
235	Node 59.0 Channel 3	\N	External Hard Drive	\N	user59	WD
236	Node 59.0 Channel 4	\N	Monitor	\N	user59	Samsung EX2220
237	Node 60.0 Channel 1	\N	Power Strip	\N	user60	Macbook Charger, battery charger, phone charger
238	Node 60.0 Channel 2	\N	USB Hub	\N	user60	OSN
239	Node 60.0 Channel 3	\N	Laptop	\N	user60	Macbook
240	Node 60.0 Channel 4	\N	Phone Headset	\N	user60	Plantronics
241	Node 61.0 Channel 1	\N		\N	user61	
242	Node 61.0 Channel 2	\N	Monitor	\N	user61	acer x233H
243	Node 61.0 Channel 3	\N	USB Hub	\N	user61	Amaon
244	Node 61.0 Channel 4	\N	External Hard Drive	\N	user61	
245	Node 62.0 Channel 1	\N	 Monitor/Laptop 	\N	user62	(Apple 27-inch Cinema Display + MacBook Pro)
246	Node 62.0 Channel 2	\N		\N	user62	
247	Node 62.0 Channel 3	\N	External Hard Drive	\N	user62	Western Digital MyBook
248	Node 62.0 Channel 4	\N		\N	user62	had heating pad for awhile
249	Node 63.0 Channel 1	\N	Laptop	\N	user63	MacBook Pro
250	Node 63.0 Channel 2	\N		\N	user63	
251	Node 63.0 Channel 3	\N		\N	user63	
252	Node 63.0 Channel 4	\N	Phone Headset	\N	user63	Plantronics
253	Node 64.0 Channel 1	\N	Monitor 	\N	user64	Acer x223w
254	Node 64.0 Channel 2	\N	External Hard Drive	\N	user64	Seagate
255	Node 64.0 Channel 3	\N	USB hub	\N	user64	CyberPower
256	Node 64.0 Channel 4	\N		\N	user64	
257	Node 65.0 Channel 1	\N	Computer	\N	user65	iMac
258	Node 65.0 Channel 2	\N		\N	user65	
259	Node 65.0 Channel 3	\N		\N	user65	
260	Node 65.0 Channel 4	\N	Power Strip	\N	user65	Charger Macbook
261	Node 66.0 Channel 1	\N		\N	user66	
262	Node 66.0 Channel 2	\N		\N	user66	
263	Node 66.0 Channel 3	\N		\N	user66	
264	Node 66.0 Channel 4	\N	Monitor	\N	user66	Apple Cinema
265	Node 67.0 Channel 1	\N		\N	user67	
266	Node 67.0 Channel 2	\N		\N	user67	
267	Node 67.0 Channel 3	\N		\N	user67	
268	Node 67.0 Channel 4	\N		\N	user67	
269	Node 68.0 Channel 1	\N		\N	user68	
270	Node 68.0 Channel 2	\N		\N	user68	
271	Node 68.0 Channel 3	\N		\N	user68	
272	Node 68.0 Channel 4	\N		\N	user68	
273	Node 69.0 Channel 1	\N	Phone Headset	\N	user69	Plantronics CS55
274	Node 69.0 Channel 2	\N		\N	user69	
275	Node 69.0 Channel 3	\N		\N	user69	
276	Node 69.0 Channel 4	\N		\N	user69	
277	Node 70.0 Channel 1	\N	Phone Headset	\N	user70	Plantronics CS55
278	Node 70.0 Channel 2	\N		\N	user70	
279	Node 70.0 Channel 3	\N		\N	user70	
280	Node 70.0 Channel 4	\N		\N	user70	
281	Node 71.0 Channel 1	\N	Monitor	\N	user71	Samsung
282	Node 71.0 Channel 2	\N		\N	user71	
283	Node 71.0 Channel 3	\N	External Hardrive	\N	user71	WD
284	Node 71.0 Channel 4	\N	Charger	\N	user71	Macbook
285	Node 72.0 Channel 1	\N	Speakers	\N	user72	Alesis
286	Node 72.0 Channel 2	\N	Laptop	\N	user72	MacBook Pro
287	Node 72.0 Channel 3	\N		\N	user72	
288	Node 72.0 Channel 4	\N		\N	user72	
289	Node 73.0 Channel 1	\N	External Hard Drive	\N	user73	Seagate
290	Node 73.0 Channel 2	\N	Coffee Maker	\N	user73	Braun
291	Node 73.0 Channel 3	\N		\N	user73	
292	Node 73.0 Channel 4	\N		\N	user73	
293	Node 74.0 Channel 1	\N		\N	user74	
294	Node 74.0 Channel 2	\N	Laptop	\N	user74	MacBook Pro 5.5
295	Node 74.0 Channel 3	\N	usb hub	\N	user74	iq
296	Node 74.0 Channel 4	\N	Phone Headset	\N	user74	Plantronics
297	Node 75.0 Channel 1	\N		\N	user75	
298	Node 75.0 Channel 2	\N	Printer	\N	user75	HP Color LaserJet2605dn
299	Node 75.0 Channel 3	\N	Electric Stapler	\N	user75	Panasonic AS302NN
300	Node 75.0 Channel 4	\N	Monitor	\N	user75	Planar PX 2210MW
301	Node 76.0 Channel 1	\N	Electric Pencil Sharpener	\N	user76	Panasonic Model KP-77 (1.2 amps)
302	Node 76.0 Channel 2	\N	Laptop	\N	user76	Macbook Pro
303	Node 76.0 Channel 3	\N	Fan (small table top)	\N	user76	Air Duracraft
304	Node 76.0 Channel 4	\N	Scanner	\N	user76	Fujitsu ScanSnap S1500M
305	Node 77.0 Channel 1	\N		\N	user77	
306	Node 77.0 Channel 2	\N		\N	user77	
307	Node 77.0 Channel 3	\N		\N	user77	
308	Node 77.0 Channel 4	\N	Desktop Computer	\N	user77	iMAC
309	Node 78.0 Channel 1	\N		\N	user78	
310	Node 78.0 Channel 2	\N		\N	user78	
311	Node 78.0 Channel 3	\N		\N	user78	
312	Node 78.0 Channel 4	\N	Monitor	\N	user78	Apple Cinema
313	Node 79.0 Channel 1	\N		\N	user79	
314	Node 79.0 Channel 2	\N		\N	user79	
315	Node 79.0 Channel 3	\N		\N	user79	
316	Node 79.0 Channel 4	\N	External Hard Drive 	\N	user79	WD
317	Node 80.0 Channel 1	\N		\N	user80	
318	Node 80.0 Channel 2	\N		\N	user80	
319	Node 80.0 Channel 3	\N		\N	user80	
320	Node 80.0 Channel 4	\N	Monitor	\N	user80	Samsung
321	Node 81.0 Channel 1	\N		\N	user81	
322	Node 81.0 Channel 2	\N		\N	user81	
323	Node 81.0 Channel 3	\N	Charger	\N	user81	Macbook
324	Node 81.0 Channel 4	\N	Phone Headset	\N	user81	Plantronics
325	Node 82.0 Channel 1	\N	Desktop Server	\N	user82	Dell PowerEdgeT300 (Ozone)
326	Node 82.0 Channel 2	\N	Desktop Server	\N	user82	Dell PowerEdge T610 (Cloud1)
327	Node 82.0 Channel 3	\N	UPS	\N	user82	APC Smart UPS 1000
328	Node 82.0 Channel 4	\N	UPS	\N	user82	APC Smart UPS 1400
329	Node 83.0 Channel 1	\N	Desktop Computer	\N	user83	iMAC
330	Node 83.0 Channel 2	\N		\N	user83	
331	Node 83.0 Channel 3	\N	Scanner	\N	user83	Fujitsu ScanScap S1500M
332	Node 83.0 Channel 4	\N	Lamp	\N	user83	
333	Node 84.0 Channel 1	\N	Printer	\N	user84	HP Color LaserJet 4700dn
334	Node 84.0 Channel 2	\N		\N	user84	
335	Node 84.0 Channel 3	\N	Fan	\N	user84	Bionaire
336	Node 84.0 Channel 4	\N		\N	user84	
337	Node 85.0 Channel 1	\N	Polycom	\N	user85	
338	Node 85.0 Channel 2	\N	Battery Recharger	\N	user85	Sanyo(AA)
339	Node 85.0 Channel 3	\N	Monitor	\N	user85	Samsung
340	Node 85.0 Channel 4	\N		\N	user85	
341	Node 86.0 Channel 1	\N	Battery Charger	\N	user86	
342	Node 86.0 Channel 2	\N	60" Monitor	\N	user86	Sharp Aquos LC-60LE831U
343	Node 86.0 Channel 3	\N		\N	user86	
344	Node 86.0 Channel 4	\N	Polycom	\N	user86	SoundStation2
345	Node 87.0 Channel 1	\N	Monitor	\N	user87	Mac/Connected to Macbok Pro
346	Node 87.0 Channel 2	\N		\N	user87	
347	Node 87.0 Channel 3	\N		\N	user87	
348	Node 87.0 Channel 4	\N		\N	user87	
349	Node 88.0 Channel 1	\N	B268 Bridge	\N	user88	
350	Node 88.0 Channel 2	\N		\N	user88	
351	Node 88.0 Channel 3	\N	Laptop	\N	user88	MacBoook Air
352	Node 88.0 Channel 4	\N	Monitor	\N	user88	Apple
353	Node 89.0 Channel 1	\N		\N	user89	
354	Node 89.0 Channel 2	\N		\N	user89	
355	Node 89.0 Channel 3	\N	Monitor	\N	user89	Dell
356	Node 89.0 Channel 4	\N		\N	user89	
\.


--
-- Name: channel_profiles_channel_profile_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('channel_profiles_channel_profile_id_seq', 356, true);


--
-- Data for Name: channels; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY channels (channel_profile_id, channel_id, node_id, enabled, sensor_num, sensor_type, status_url, "covThreshold", enmetric_channel_guid) FROM stdin;
1	1	1	\N	\N	\N	\N	\N	\N
2	2	1	\N	\N	\N	\N	\N	\N
3	3	1	\N	\N	\N	\N	\N	\N
4	4	1	\N	\N	\N	\N	\N	\N
5	1	2	\N	\N	\N	\N	\N	\N
6	2	2	\N	\N	\N	\N	\N	\N
7	3	2	\N	\N	\N	\N	\N	\N
8	4	2	\N	\N	\N	\N	\N	\N
9	1	3	\N	\N	\N	\N	\N	\N
10	2	3	\N	\N	\N	\N	\N	\N
11	3	3	\N	\N	\N	\N	\N	\N
12	4	3	\N	\N	\N	\N	\N	\N
13	1	4	\N	\N	\N	\N	\N	\N
14	2	4	\N	\N	\N	\N	\N	\N
15	3	4	\N	\N	\N	\N	\N	\N
16	4	4	\N	\N	\N	\N	\N	\N
17	1	5	\N	\N	\N	\N	\N	\N
18	2	5	\N	\N	\N	\N	\N	\N
19	3	5	\N	\N	\N	\N	\N	\N
20	4	5	\N	\N	\N	\N	\N	\N
21	1	6	\N	\N	\N	\N	\N	\N
22	2	6	\N	\N	\N	\N	\N	\N
23	3	6	\N	\N	\N	\N	\N	\N
24	4	6	\N	\N	\N	\N	\N	\N
25	1	7	\N	\N	\N	\N	\N	\N
26	2	7	\N	\N	\N	\N	\N	\N
27	3	7	\N	\N	\N	\N	\N	\N
28	4	7	\N	\N	\N	\N	\N	\N
29	1	8	\N	\N	\N	\N	\N	\N
30	2	8	\N	\N	\N	\N	\N	\N
31	3	8	\N	\N	\N	\N	\N	\N
32	4	8	\N	\N	\N	\N	\N	\N
33	1	9	\N	\N	\N	\N	\N	\N
34	2	9	\N	\N	\N	\N	\N	\N
35	3	9	\N	\N	\N	\N	\N	\N
36	4	9	\N	\N	\N	\N	\N	\N
37	1	10	\N	\N	\N	\N	\N	\N
38	2	10	\N	\N	\N	\N	\N	\N
39	3	10	\N	\N	\N	\N	\N	\N
40	4	10	\N	\N	\N	\N	\N	\N
41	1	11	\N	\N	\N	\N	\N	\N
42	2	11	\N	\N	\N	\N	\N	\N
43	3	11	\N	\N	\N	\N	\N	\N
44	4	11	\N	\N	\N	\N	\N	\N
45	1	12	\N	\N	\N	\N	\N	\N
46	2	12	\N	\N	\N	\N	\N	\N
47	3	12	\N	\N	\N	\N	\N	\N
48	4	12	\N	\N	\N	\N	\N	\N
49	1	13	\N	\N	\N	\N	\N	\N
50	2	13	\N	\N	\N	\N	\N	\N
51	3	13	\N	\N	\N	\N	\N	\N
52	4	13	\N	\N	\N	\N	\N	\N
53	1	14	\N	\N	\N	\N	\N	\N
54	2	14	\N	\N	\N	\N	\N	\N
55	3	14	\N	\N	\N	\N	\N	\N
56	4	14	\N	\N	\N	\N	\N	\N
57	1	15	\N	\N	\N	\N	\N	\N
58	2	15	\N	\N	\N	\N	\N	\N
59	3	15	\N	\N	\N	\N	\N	\N
60	4	15	\N	\N	\N	\N	\N	\N
61	1	16	\N	\N	\N	\N	\N	\N
62	2	16	\N	\N	\N	\N	\N	\N
63	3	16	\N	\N	\N	\N	\N	\N
64	4	16	\N	\N	\N	\N	\N	\N
65	1	17	\N	\N	\N	\N	\N	\N
66	2	17	\N	\N	\N	\N	\N	\N
67	3	17	\N	\N	\N	\N	\N	\N
68	4	17	\N	\N	\N	\N	\N	\N
69	1	18	\N	\N	\N	\N	\N	\N
70	2	18	\N	\N	\N	\N	\N	\N
71	3	18	\N	\N	\N	\N	\N	\N
72	4	18	\N	\N	\N	\N	\N	\N
73	1	19	\N	\N	\N	\N	\N	\N
74	2	19	\N	\N	\N	\N	\N	\N
75	3	19	\N	\N	\N	\N	\N	\N
76	4	19	\N	\N	\N	\N	\N	\N
77	1	20	\N	\N	\N	\N	\N	\N
78	2	20	\N	\N	\N	\N	\N	\N
79	3	20	\N	\N	\N	\N	\N	\N
80	4	20	\N	\N	\N	\N	\N	\N
81	1	21	\N	\N	\N	\N	\N	\N
82	2	21	\N	\N	\N	\N	\N	\N
83	3	21	\N	\N	\N	\N	\N	\N
84	4	21	\N	\N	\N	\N	\N	\N
85	1	22	\N	\N	\N	\N	\N	\N
86	2	22	\N	\N	\N	\N	\N	\N
87	3	22	\N	\N	\N	\N	\N	\N
88	4	22	\N	\N	\N	\N	\N	\N
89	1	23	\N	\N	\N	\N	\N	\N
90	2	23	\N	\N	\N	\N	\N	\N
91	3	23	\N	\N	\N	\N	\N	\N
92	4	23	\N	\N	\N	\N	\N	\N
93	1	24	\N	\N	\N	\N	\N	\N
94	2	24	\N	\N	\N	\N	\N	\N
95	3	24	\N	\N	\N	\N	\N	\N
96	4	24	\N	\N	\N	\N	\N	\N
97	1	25	\N	\N	\N	\N	\N	\N
98	2	25	\N	\N	\N	\N	\N	\N
99	3	25	\N	\N	\N	\N	\N	\N
100	4	25	\N	\N	\N	\N	\N	\N
101	1	26	\N	\N	\N	\N	\N	\N
102	2	26	\N	\N	\N	\N	\N	\N
103	3	26	\N	\N	\N	\N	\N	\N
104	4	26	\N	\N	\N	\N	\N	\N
105	1	27	\N	\N	\N	\N	\N	\N
106	2	27	\N	\N	\N	\N	\N	\N
107	3	27	\N	\N	\N	\N	\N	\N
108	4	27	\N	\N	\N	\N	\N	\N
109	1	28	\N	\N	\N	\N	\N	\N
110	2	28	\N	\N	\N	\N	\N	\N
111	3	28	\N	\N	\N	\N	\N	\N
112	4	28	\N	\N	\N	\N	\N	\N
113	1	29	\N	\N	\N	\N	\N	\N
114	2	29	\N	\N	\N	\N	\N	\N
115	3	29	\N	\N	\N	\N	\N	\N
116	4	29	\N	\N	\N	\N	\N	\N
117	1	30	\N	\N	\N	\N	\N	\N
118	2	30	\N	\N	\N	\N	\N	\N
119	3	30	\N	\N	\N	\N	\N	\N
120	4	30	\N	\N	\N	\N	\N	\N
121	1	31	\N	\N	\N	\N	\N	\N
122	2	31	\N	\N	\N	\N	\N	\N
123	3	31	\N	\N	\N	\N	\N	\N
124	4	31	\N	\N	\N	\N	\N	\N
125	1	32	\N	\N	\N	\N	\N	\N
126	2	32	\N	\N	\N	\N	\N	\N
127	3	32	\N	\N	\N	\N	\N	\N
128	4	32	\N	\N	\N	\N	\N	\N
129	1	33	\N	\N	\N	\N	\N	\N
130	2	33	\N	\N	\N	\N	\N	\N
131	3	33	\N	\N	\N	\N	\N	\N
132	4	33	\N	\N	\N	\N	\N	\N
133	1	34	\N	\N	\N	\N	\N	\N
134	2	34	\N	\N	\N	\N	\N	\N
135	3	34	\N	\N	\N	\N	\N	\N
136	4	34	\N	\N	\N	\N	\N	\N
137	1	35	\N	\N	\N	\N	\N	\N
138	2	35	\N	\N	\N	\N	\N	\N
139	3	35	\N	\N	\N	\N	\N	\N
140	4	35	\N	\N	\N	\N	\N	\N
141	1	36	\N	\N	\N	\N	\N	\N
142	2	36	\N	\N	\N	\N	\N	\N
143	3	36	\N	\N	\N	\N	\N	\N
144	4	36	\N	\N	\N	\N	\N	\N
145	1	37	\N	\N	\N	\N	\N	\N
146	2	37	\N	\N	\N	\N	\N	\N
147	3	37	\N	\N	\N	\N	\N	\N
148	4	37	\N	\N	\N	\N	\N	\N
149	1	38	\N	\N	\N	\N	\N	\N
150	2	38	\N	\N	\N	\N	\N	\N
151	3	38	\N	\N	\N	\N	\N	\N
152	4	38	\N	\N	\N	\N	\N	\N
153	1	39	\N	\N	\N	\N	\N	\N
154	2	39	\N	\N	\N	\N	\N	\N
155	3	39	\N	\N	\N	\N	\N	\N
156	4	39	\N	\N	\N	\N	\N	\N
157	1	40	\N	\N	\N	\N	\N	\N
158	2	40	\N	\N	\N	\N	\N	\N
159	3	40	\N	\N	\N	\N	\N	\N
160	4	40	\N	\N	\N	\N	\N	\N
161	1	41	\N	\N	\N	\N	\N	\N
162	2	41	\N	\N	\N	\N	\N	\N
163	3	41	\N	\N	\N	\N	\N	\N
164	4	41	\N	\N	\N	\N	\N	\N
165	1	42	\N	\N	\N	\N	\N	\N
166	2	42	\N	\N	\N	\N	\N	\N
167	3	42	\N	\N	\N	\N	\N	\N
168	4	42	\N	\N	\N	\N	\N	\N
169	1	43	\N	\N	\N	\N	\N	\N
170	2	43	\N	\N	\N	\N	\N	\N
171	3	43	\N	\N	\N	\N	\N	\N
172	4	43	\N	\N	\N	\N	\N	\N
173	1	44	\N	\N	\N	\N	\N	\N
174	2	44	\N	\N	\N	\N	\N	\N
175	3	44	\N	\N	\N	\N	\N	\N
176	4	44	\N	\N	\N	\N	\N	\N
177	1	45	\N	\N	\N	\N	\N	\N
178	2	45	\N	\N	\N	\N	\N	\N
179	3	45	\N	\N	\N	\N	\N	\N
180	4	45	\N	\N	\N	\N	\N	\N
181	1	46	\N	\N	\N	\N	\N	\N
182	2	46	\N	\N	\N	\N	\N	\N
183	3	46	\N	\N	\N	\N	\N	\N
184	4	46	\N	\N	\N	\N	\N	\N
185	1	47	\N	\N	\N	\N	\N	\N
186	2	47	\N	\N	\N	\N	\N	\N
187	3	47	\N	\N	\N	\N	\N	\N
188	4	47	\N	\N	\N	\N	\N	\N
189	1	48	\N	\N	\N	\N	\N	\N
190	2	48	\N	\N	\N	\N	\N	\N
191	3	48	\N	\N	\N	\N	\N	\N
192	4	48	\N	\N	\N	\N	\N	\N
193	1	49	\N	\N	\N	\N	\N	\N
194	2	49	\N	\N	\N	\N	\N	\N
195	3	49	\N	\N	\N	\N	\N	\N
196	4	49	\N	\N	\N	\N	\N	\N
197	1	50	\N	\N	\N	\N	\N	\N
198	2	50	\N	\N	\N	\N	\N	\N
199	3	50	\N	\N	\N	\N	\N	\N
200	4	50	\N	\N	\N	\N	\N	\N
201	1	51	\N	\N	\N	\N	\N	\N
202	2	51	\N	\N	\N	\N	\N	\N
203	3	51	\N	\N	\N	\N	\N	\N
204	4	51	\N	\N	\N	\N	\N	\N
205	1	52	\N	\N	\N	\N	\N	\N
206	2	52	\N	\N	\N	\N	\N	\N
207	3	52	\N	\N	\N	\N	\N	\N
208	4	52	\N	\N	\N	\N	\N	\N
209	1	53	\N	\N	\N	\N	\N	\N
210	2	53	\N	\N	\N	\N	\N	\N
211	3	53	\N	\N	\N	\N	\N	\N
212	4	53	\N	\N	\N	\N	\N	\N
213	1	54	\N	\N	\N	\N	\N	\N
214	2	54	\N	\N	\N	\N	\N	\N
215	3	54	\N	\N	\N	\N	\N	\N
216	4	54	\N	\N	\N	\N	\N	\N
217	1	55	\N	\N	\N	\N	\N	\N
218	2	55	\N	\N	\N	\N	\N	\N
219	3	55	\N	\N	\N	\N	\N	\N
220	4	55	\N	\N	\N	\N	\N	\N
221	1	56	\N	\N	\N	\N	\N	\N
222	2	56	\N	\N	\N	\N	\N	\N
223	3	56	\N	\N	\N	\N	\N	\N
224	4	56	\N	\N	\N	\N	\N	\N
225	1	57	\N	\N	\N	\N	\N	\N
226	2	57	\N	\N	\N	\N	\N	\N
227	3	57	\N	\N	\N	\N	\N	\N
228	4	57	\N	\N	\N	\N	\N	\N
229	1	58	\N	\N	\N	\N	\N	\N
230	2	58	\N	\N	\N	\N	\N	\N
231	3	58	\N	\N	\N	\N	\N	\N
232	4	58	\N	\N	\N	\N	\N	\N
233	1	59	\N	\N	\N	\N	\N	\N
234	2	59	\N	\N	\N	\N	\N	\N
235	3	59	\N	\N	\N	\N	\N	\N
236	4	59	\N	\N	\N	\N	\N	\N
237	1	60	\N	\N	\N	\N	\N	\N
238	2	60	\N	\N	\N	\N	\N	\N
239	3	60	\N	\N	\N	\N	\N	\N
240	4	60	\N	\N	\N	\N	\N	\N
241	1	61	\N	\N	\N	\N	\N	\N
242	2	61	\N	\N	\N	\N	\N	\N
243	3	61	\N	\N	\N	\N	\N	\N
244	4	61	\N	\N	\N	\N	\N	\N
245	1	62	\N	\N	\N	\N	\N	\N
246	2	62	\N	\N	\N	\N	\N	\N
247	3	62	\N	\N	\N	\N	\N	\N
248	4	62	\N	\N	\N	\N	\N	\N
249	1	63	\N	\N	\N	\N	\N	\N
250	2	63	\N	\N	\N	\N	\N	\N
251	3	63	\N	\N	\N	\N	\N	\N
252	4	63	\N	\N	\N	\N	\N	\N
253	1	64	\N	\N	\N	\N	\N	\N
254	2	64	\N	\N	\N	\N	\N	\N
255	3	64	\N	\N	\N	\N	\N	\N
256	4	64	\N	\N	\N	\N	\N	\N
257	1	65	\N	\N	\N	\N	\N	\N
258	2	65	\N	\N	\N	\N	\N	\N
259	3	65	\N	\N	\N	\N	\N	\N
260	4	65	\N	\N	\N	\N	\N	\N
261	1	66	\N	\N	\N	\N	\N	\N
262	2	66	\N	\N	\N	\N	\N	\N
263	3	66	\N	\N	\N	\N	\N	\N
264	4	66	\N	\N	\N	\N	\N	\N
265	1	67	\N	\N	\N	\N	\N	\N
266	2	67	\N	\N	\N	\N	\N	\N
267	3	67	\N	\N	\N	\N	\N	\N
268	4	67	\N	\N	\N	\N	\N	\N
269	1	68	\N	\N	\N	\N	\N	\N
270	2	68	\N	\N	\N	\N	\N	\N
271	3	68	\N	\N	\N	\N	\N	\N
272	4	68	\N	\N	\N	\N	\N	\N
273	1	69	\N	\N	\N	\N	\N	\N
274	2	69	\N	\N	\N	\N	\N	\N
275	3	69	\N	\N	\N	\N	\N	\N
276	4	69	\N	\N	\N	\N	\N	\N
277	1	70	\N	\N	\N	\N	\N	\N
278	2	70	\N	\N	\N	\N	\N	\N
279	3	70	\N	\N	\N	\N	\N	\N
280	4	70	\N	\N	\N	\N	\N	\N
281	1	71	\N	\N	\N	\N	\N	\N
282	2	71	\N	\N	\N	\N	\N	\N
283	3	71	\N	\N	\N	\N	\N	\N
284	4	71	\N	\N	\N	\N	\N	\N
285	1	72	\N	\N	\N	\N	\N	\N
286	2	72	\N	\N	\N	\N	\N	\N
287	3	72	\N	\N	\N	\N	\N	\N
288	4	72	\N	\N	\N	\N	\N	\N
289	1	73	\N	\N	\N	\N	\N	\N
290	2	73	\N	\N	\N	\N	\N	\N
291	3	73	\N	\N	\N	\N	\N	\N
292	4	73	\N	\N	\N	\N	\N	\N
293	1	74	\N	\N	\N	\N	\N	\N
294	2	74	\N	\N	\N	\N	\N	\N
295	3	74	\N	\N	\N	\N	\N	\N
296	4	74	\N	\N	\N	\N	\N	\N
297	1	75	\N	\N	\N	\N	\N	\N
298	2	75	\N	\N	\N	\N	\N	\N
299	3	75	\N	\N	\N	\N	\N	\N
300	4	75	\N	\N	\N	\N	\N	\N
301	1	76	\N	\N	\N	\N	\N	\N
302	2	76	\N	\N	\N	\N	\N	\N
303	3	76	\N	\N	\N	\N	\N	\N
304	4	76	\N	\N	\N	\N	\N	\N
305	1	77	\N	\N	\N	\N	\N	\N
306	2	77	\N	\N	\N	\N	\N	\N
307	3	77	\N	\N	\N	\N	\N	\N
308	4	77	\N	\N	\N	\N	\N	\N
309	1	78	\N	\N	\N	\N	\N	\N
310	2	78	\N	\N	\N	\N	\N	\N
311	3	78	\N	\N	\N	\N	\N	\N
312	4	78	\N	\N	\N	\N	\N	\N
313	1	79	\N	\N	\N	\N	\N	\N
314	2	79	\N	\N	\N	\N	\N	\N
315	3	79	\N	\N	\N	\N	\N	\N
316	4	79	\N	\N	\N	\N	\N	\N
317	1	80	\N	\N	\N	\N	\N	\N
318	2	80	\N	\N	\N	\N	\N	\N
319	3	80	\N	\N	\N	\N	\N	\N
320	4	80	\N	\N	\N	\N	\N	\N
321	1	81	\N	\N	\N	\N	\N	\N
322	2	81	\N	\N	\N	\N	\N	\N
323	3	81	\N	\N	\N	\N	\N	\N
324	4	81	\N	\N	\N	\N	\N	\N
325	1	82	\N	\N	\N	\N	\N	\N
326	2	82	\N	\N	\N	\N	\N	\N
327	3	82	\N	\N	\N	\N	\N	\N
328	4	82	\N	\N	\N	\N	\N	\N
329	1	83	\N	\N	\N	\N	\N	\N
330	2	83	\N	\N	\N	\N	\N	\N
331	3	83	\N	\N	\N	\N	\N	\N
332	4	83	\N	\N	\N	\N	\N	\N
333	1	84	\N	\N	\N	\N	\N	\N
334	2	84	\N	\N	\N	\N	\N	\N
335	3	84	\N	\N	\N	\N	\N	\N
336	4	84	\N	\N	\N	\N	\N	\N
337	1	85	\N	\N	\N	\N	\N	\N
338	2	85	\N	\N	\N	\N	\N	\N
339	3	85	\N	\N	\N	\N	\N	\N
340	4	85	\N	\N	\N	\N	\N	\N
341	1	86	\N	\N	\N	\N	\N	\N
342	2	86	\N	\N	\N	\N	\N	\N
343	3	86	\N	\N	\N	\N	\N	\N
344	4	86	\N	\N	\N	\N	\N	\N
345	1	87	\N	\N	\N	\N	\N	\N
346	2	87	\N	\N	\N	\N	\N	\N
347	3	87	\N	\N	\N	\N	\N	\N
348	4	87	\N	\N	\N	\N	\N	\N
349	1	88	\N	\N	\N	\N	\N	\N
350	2	88	\N	\N	\N	\N	\N	\N
351	3	88	\N	\N	\N	\N	\N	\N
352	4	88	\N	\N	\N	\N	\N	\N
353	1	89	\N	\N	\N	\N	\N	\N
354	2	89	\N	\N	\N	\N	\N	\N
355	3	89	\N	\N	\N	\N	\N	\N
356	4	89	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: cubicles; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY cubicles (cubible_id, room_id, cubicle_number, description, location_id, user_id) FROM stdin;
\.


--
-- Name: cubicles_cubible_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('cubicles_cubible_id_seq', 1, false);


--
-- Data for Name: floors; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY floors (floor_id, floor_number, description, location_id) FROM stdin;
\.


--
-- Name: floors_floor_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('floors_floor_id_seq', 1, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY locations (location_id, location) FROM stdin;
\.


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('locations_location_id_seq', 1, false);


--
-- Data for Name: node_profiles; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY node_profiles (node_profile_id, node_name, metadata_url, num_of_channels, hardware_version, firmware_version) FROM stdin;
1	EnmetricPowerPort, 000425A2	/rest/v2/accounts/dUstq9m8RmCX7CGAzCY4ig/users/uYsmja9_SAOE2BEwXJgjfQ/nodes/metadata/efsCbNOaTReB5FjScZSPIg	4	\N	\N
2	EnmetricPowerPort, 000427DF	/rest/v2/accounts/dUstq9m8RmCX7CGAzCY4ig/users/uYsmja9_SAOE2BEwXJgjfQ/nodes/metadata/H9M2IEinRw-ir-2NG7B0bQ	4	\N	\N
\.


--
-- Name: node_profiles_node_profile_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('node_profiles_node_profile_id_seq', 2, true);


--
-- Data for Name: nodes; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY nodes (node_id, node_profile_id, mac_addr, bridge_mac_addr, state, online, status_url, last_updated, enmetric_node_guid, user_id, cubicle_id) FROM stdin;
1	1	040E1E	0100A4	\N	\N	\N	\N	\N	user1	\N
2	1	040D60	0100A4	\N	\N	\N	\N	\N	user2	\N
3	1	040D6B	0100A4	\N	\N	\N	\N	\N	user3	\N
4	1	021DEF	0100A4	\N	\N	\N	\N	\N	user4	\N
5	1	0300F9	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user5	\N
6	1	040F64	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user6	\N
7	1	30783.0	0100A4	\N	\N	\N	2015-06-18 00:00:00	\N	user7	\N
8	1	0307A0	0100A4	\N	\N	\N	2015-06-22 00:00:00	\N	user8	\N
9	1	30792.0	0100A4	\N	\N	\N	2015-06-17 00:00:00	\N	user9	\N
10	1	021DCF	0100A4	\N	\N	\N	2015-06-17 00:00:00	\N	user10	\N
11	1	30779.0	0100A4	\N	\N	\N	2015-06-17 00:00:00	\N	user11	\N
12	1	021DF0	0100A4	\N	\N	\N	2015-06-17 00:00:00	\N	user12	\N
13	1	040F6D	0100A4	\N	\N	\N	2015-06-17 00:00:00	\N	user13	\N
14	1	030BE3	0100A4	\N	\N	\N	2015-06-17 00:00:00	\N	user14	\N
15	1	040EDC	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user15	\N
16	1	040E0F	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user16	\N
17	1	040ED8	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user17	\N
18	1	021DC1	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user18	\N
19	1	040EE7	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user19	\N
20	1	040F07	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user20	\N
21	1	30193.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user21	\N
22	1	03078D	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user22	\N
23	1	30797.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user23	\N
24	1	30775.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user24	\N
25	1	0307A3	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user25	\N
26	1	040E0E	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user26	\N
27	1	30777.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user27	\N
28	1	040E2D	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user28	\N
29	1	040E1D	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user29	\N
30	1	400000000000	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user30	\N
31	1	400000000.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user31	\N
32	1	021DC2	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user32	\N
33	1	030BF3	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user33	\N
34	1	021DA5	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user34	\N
35	1	030BF8	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user35	\N
36	1	021D99	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user36	\N
37	1	30974.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user37	\N
38	1	4E+34	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user38	\N
39	1	021DDF	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user39	\N
40	1	040E2C	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user40	\N
41	1	040D74	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user41	\N
42	1	030BD4	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user42	\N
43	1	03013B	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user43	\N
44	1	2.1E+63	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user44	\N
45	2	030BD2	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user45	\N
46	2	030BF2	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user46	\N
47	2	021DE8	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user47	\N
48	2	30171.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user48	\N
49	2	03078B	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user49	\N
50	2	03078B	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user50	\N
51	2	03079A	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user51	\N
52	2	030BF9	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user52	\N
53	2	021DA1	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user53	\N
54	2	021DF6	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user54	\N
55	2	021D9E	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user55	\N
56	2	2.1E+47	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user56	\N
57	2	040D65	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user57	\N
58	2	30131.0	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user58	\N
59	2	040D7C	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user59	\N
60	2	03096A	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user60	\N
61	2	30973.0	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user61	\N
62	2	040D8E	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user62	\N
63	2	021E1F	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user63	\N
64	2	03077B	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user64	\N
65	2	030BDD	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user65	\N
66	2	040D7D	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user66	\N
67	2	040D73	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user67	\N
68	2	30170.0	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user68	\N
69	2	030BDB	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user69	\N
70	2	21000000000	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user70	\N
71	2	040EFA	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user71	\N
72	2	021DF1	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user72	\N
73	2	0307A1	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user73	\N
74	2	021DF9	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user74	\N
75	2	30968.0	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user75	\N
76	2	040DFC	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user76	\N
77	2	30985.0	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user77	\N
78	2	40000000000000000000	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user78	\N
79	2	021DD6	0100DC	\N	\N	\N	2014-06-18 00:00:00	\N	user79	\N
80	2	021E7F	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user80	\N
81	2	03079F	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user81	\N
82	2	021DB5	0100DC	\N	\N	\N	2013-01-16 00:00:00	\N	user82	\N
83	2	0307A4	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user83	\N
84	2	30780.0	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user84	\N
85	2	021E6B	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user85	\N
86	2	4000000000000	0100DC	\N	\N	\N	2014-06-18 00:00:00	\N	user86	\N
87	2	040D8C	0100DC	\N	\N	\N	2015-06-18 00:00:00	\N	user87	\N
88	2	040F45	0100DC	\N	\N	\N	2015-06-17 00:00:00	\N	user88	\N
89	2	03077E	01009F	\N	\N	\N	2015-06-17 00:00:00	\N	user89	\N
\.


--
-- Name: nodes_node_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('nodes_node_id_seq', 89, true);


--
-- Data for Name: room_types; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY room_types (type_id, description) FROM stdin;
\.


--
-- Name: room_types_type_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('room_types_type_id_seq', 1, false);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY rooms (room_id, room_number, floor_id, wing_id, description, type_id, location_id) FROM stdin;
\.


--
-- Name: rooms_room_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('rooms_room_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY users (user_id, password, node_id) FROM stdin;
user1	pass1	1
user2	pass2	2
user3	pass3	3
user4	pass4	4
user5	pass5	5
user6	pass6	6
user7	pass7	7
user8	pass8	8
user9	pass9	9
user10	pass10	10
user11	pass11	11
user12	pass12	12
user13	pass13	13
user14	pass14	14
user15	pass15	15
user16	pass16	16
user17	pass17	17
user18	pass18	18
user19	pass19	19
user20	pass20	20
user21	pass21	21
user22	pass22	22
user23	pass23	23
user24	pass24	24
user25	pass25	25
user26	pass26	26
user27	pass27	27
user28	pass28	28
user29	pass29	29
user30	pass30	30
user31	pass31	31
user32	pass32	32
user33	pass33	33
user34	pass34	34
user35	pass35	35
user36	pass36	36
user37	pass37	37
user38	pass38	38
user39	pass39	39
user40	pass40	40
user41	pass41	41
user42	pass42	42
user43	pass43	43
user44	pass44	44
user45	pass45	45
user46	pass46	46
user47	pass47	47
user48	pass48	48
user49	pass49	49
user50	pass50	50
user51	pass51	51
user52	pass52	52
user53	pass53	53
user54	pass54	54
user55	pass55	55
user56	pass56	56
user57	pass57	57
user58	pass58	58
user59	pass59	59
user60	pass60	60
user61	pass61	61
user62	pass62	62
user63	pass63	63
user64	pass64	64
user65	pass65	65
user66	pass66	66
user67	pass67	67
user68	pass68	68
user69	pass69	69
user70	pass70	70
user71	pass71	71
user72	pass72	72
user73	pass73	73
user74	pass74	74
user75	pass75	75
user76	pass76	76
user77	pass77	77
user78	pass78	78
user79	pass79	79
user80	pass80	80
user81	pass81	81
user82	pass82	82
user83	pass83	83
user84	pass84	84
user85	pass85	85
user86	pass86	86
user87	pass87	87
user88	pass88	88
user89	pass89	89
\.


--
-- Data for Name: wings; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

COPY wings (wing_id, name, description) FROM stdin;
\.


--
-- Name: wings_wing_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('wings_wing_id_seq', 1, false);


--
-- Name: channel_plug_loads_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY channel_plug_loads
    ADD CONSTRAINT channel_plug_loads_pkey PRIMARY KEY (node_id, channel_id, time_stamp);


--
-- Name: channel_profiles_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY channel_profiles
    ADD CONSTRAINT channel_profiles_pkey PRIMARY KEY (channel_profile_id);


--
-- Name: channels_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (channel_id, node_id);


--
-- Name: cubicles_location_id_key; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY cubicles
    ADD CONSTRAINT cubicles_location_id_key UNIQUE (location_id);


--
-- Name: cubicles_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY cubicles
    ADD CONSTRAINT cubicles_pkey PRIMARY KEY (cubible_id);


--
-- Name: floors_location_id_key; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY floors
    ADD CONSTRAINT floors_location_id_key UNIQUE (location_id);


--
-- Name: floors_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY floors
    ADD CONSTRAINT floors_pkey PRIMARY KEY (floor_id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: node_profiles_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY node_profiles
    ADD CONSTRAINT node_profiles_pkey PRIMARY KEY (node_profile_id);


--
-- Name: nodes_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (node_id);


--
-- Name: room_types_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (type_id);


--
-- Name: rooms_location_id_key; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_location_id_key UNIQUE (location_id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: wings_pkey; Type: CONSTRAINT; Schema: sb_dash; Owner: sreejitaray; Tablespace: 
--

ALTER TABLE ONLY wings
    ADD CONSTRAINT wings_pkey PRIMARY KEY (wing_id);


--
-- Name: channel_plug_loads_node_id_fkey; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY channel_plug_loads
    ADD CONSTRAINT channel_plug_loads_node_id_fkey FOREIGN KEY (node_id, channel_id) REFERENCES channels(node_id, channel_id);


--
-- Name: fk_CHANNEL_CHANNEL_PROFILE_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY channels
    ADD CONSTRAINT "fk_CHANNEL_CHANNEL_PROFILE_ID" FOREIGN KEY (channel_profile_id) REFERENCES channel_profiles(channel_profile_id);


--
-- Name: fk_CHANNEL_NODE_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY channels
    ADD CONSTRAINT "fk_CHANNEL_NODE_ID" FOREIGN KEY (node_id) REFERENCES nodes(node_id);


--
-- Name: fk_CUBICLE_LOCATION_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY cubicles
    ADD CONSTRAINT "fk_CUBICLE_LOCATION_ID" FOREIGN KEY (location_id) REFERENCES locations(location_id);


--
-- Name: fk_CUBICLE_ROOM_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY cubicles
    ADD CONSTRAINT "fk_CUBICLE_ROOM_ID" FOREIGN KEY (room_id) REFERENCES rooms(room_id);


--
-- Name: fk_CUBICLE_USER_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY cubicles
    ADD CONSTRAINT "fk_CUBICLE_USER_ID" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_FLOOR_LOCATION_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY floors
    ADD CONSTRAINT "fk_FLOOR_LOCATION_ID" FOREIGN KEY (location_id) REFERENCES locations(location_id);


--
-- Name: fk_NODE_CUBICLE_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT "fk_NODE_CUBICLE_ID" FOREIGN KEY (cubicle_id) REFERENCES cubicles(cubible_id);


--
-- Name: fk_NODE_NODE_PROFILE_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT "fk_NODE_NODE_PROFILE_ID" FOREIGN KEY (node_profile_id) REFERENCES node_profiles(node_profile_id);


--
-- Name: fk_NODE_USER_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT "fk_NODE_USER_ID" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_ROOM_FLOOR_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT "fk_ROOM_FLOOR_ID" FOREIGN KEY (floor_id) REFERENCES floors(floor_id);


--
-- Name: fk_ROOM_LOCATION_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT "fk_ROOM_LOCATION_ID" FOREIGN KEY (location_id) REFERENCES locations(location_id);


--
-- Name: fk_ROOM_ROOM_TYPE_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT "fk_ROOM_ROOM_TYPE_ID" FOREIGN KEY (type_id) REFERENCES room_types(type_id);


--
-- Name: fk_ROOM_WING_ID; Type: FK CONSTRAINT; Schema: sb_dash; Owner: sreejitaray
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT "fk_ROOM_WING_ID" FOREIGN KEY (wing_id) REFERENCES wings(wing_id);


--
-- PostgreSQL database dump complete
--

