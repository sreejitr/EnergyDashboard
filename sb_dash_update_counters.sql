SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.locations', 'location_id'), (SELECT MAX(location_id) FROM sb_dash.locations)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.nodes', 'node_id'), (SELECT MAX(node_id) FROM sb_dash.nodes)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.floors', 'floor_id'), (SELECT MAX(floor_id) FROM sb_dash.floors)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.node_profiles', 'node_profile_id'), (SELECT MAX(node_profile_id) FROM sb_dash.node_profiles)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.wings', 'wing_id'), (SELECT MAX(wing_id) FROM sb_dash.wings)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.channel_profiles', 'channel_profile_id'), (SELECT MAX(channel_profile_id) FROM sb_dash.channel_profiles)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.room_types', 'type_id'), (SELECT MAX(type_id) FROM sb_dash.room_types)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.cubicles', 'cubible_id'), (SELECT MAX(cubible_id) FROM sb_dash.cubicles)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('sb_dash.rooms', 'room_id'), (SELECT MAX(room_id) FROM sb_dash.rooms)+1);