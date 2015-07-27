CREATE TABLE enmetric (
        device_id serial primary key, 
		location_id int references locations(location_id),
		floor_box_num int,
		bridge_name varchar(80),
		bridge_mac varchar(80),
		power_port_mac varchar(80),
		model_name varchar(80),
		description varchar(80),
		num_channels int,
		last_updated date
);

CREATE TABLE location (
		location_id SERIAL primary key,
		location point,
		room_id int references rooms(room_id)
);

CREATE TABLE room (
		room_id serial primary key,
		INHERITS (room_type);
);

CREATE TABLE room_type (
		type_id serial primary key,
		description varchar(80)
);

CREATE TABLE channel (
		channel_id serial,
		device_id uuid references enmetric(device_id),
		load_id int references loads(load_id),
		PRIMARY KEY (channel_id, device_id)
);

CREATE TABLE loads (
		load_id serial primary key,
		max_power real,
		desc varchar(80)
);

CREATE TABLE plug_data (
		device_id uuid references enmetric(device_id),
		channel_id int references channels(channel_id)
		time_stamp timestamp
		value real,
		PRIMARY KEY (device_id, channel_id, time_stamp)
);

CREATE TABLE other_device (
		device_id uuid references enmetric(device_id),
		location_id int references location(location_id)
		other_meta_data varchar(80),   -- ??
		PRIMARY KEY (device_id)
);

CREATE TABLE other_data (
		device_id uuid references enmetric(device_id),
		time_stamp timestamp,
		value real,
		PRIMARY KEY (device_id, time_stamp)
);



