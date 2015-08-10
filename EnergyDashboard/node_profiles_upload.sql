--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = sb_dash, pg_catalog;

--
-- Data for Name: node_profiles; Type: TABLE DATA; Schema: sb_dash; Owner: sreejitaray
--

INSERT INTO node_profiles (node_profile_id, node_name, metadata_url, num_of_channels, hardware_version, firmware_version) VALUES (1, 'EnmetricPowerPort, 000425A2', '/rest/v2/accounts/dUstq9m8RmCX7CGAzCY4ig/users/uYsmja9_SAOE2BEwXJgjfQ/nodes/metadata/efsCbNOaTReB5FjScZSPIg', 4, NULL, NULL);
INSERT INTO node_profiles (node_profile_id, node_name, metadata_url, num_of_channels, hardware_version, firmware_version) VALUES (2, 'EnmetricPowerPort, 000427DF', '/rest/v2/accounts/dUstq9m8RmCX7CGAzCY4ig/users/uYsmja9_SAOE2BEwXJgjfQ/nodes/metadata/H9M2IEinRw-ir-2NG7B0bQ', 4, NULL, NULL);


--
-- Name: node_profiles_node_profile_id_seq; Type: SEQUENCE SET; Schema: sb_dash; Owner: sreejitaray
--

SELECT pg_catalog.setval('node_profiles_node_profile_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

