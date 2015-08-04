

CREATE TABLE "locations" (
"location_id" serial4,
PRIMARY KEY ("location_id") 
);

SELECT AddGeometryColumn('locations', 'location', -1, 'LINESTRING', 2);

CREATE TABLE "nodes" (
"node_id" serial4,
"node_profile_id" int4 NOT NULL,
"mac_addr" macaddr,
"bridge_mac_addr" macaddr,
"state" varchar(255),
"online" varchar(255),
"status_url" varchar(500),
"last_updated" timestamp(6),
"enmetric_node_guid" varchar(255),
"user_id" varchar(255) NOT NULL,
"cubicle_id" int4,
PRIMARY KEY ("node_id") 
);

CREATE TABLE "floors" (
"floor_id" serial,
"floor_number" int4,
"description" varchar(255),
"location_id" int4 NOT NULL,
PRIMARY KEY ("floor_id") 
);

CREATE TABLE "node_profiles" (
"node_profile_id" serial,
"node_name" varchar(255),
"metadata_url" varchar(500),
"num_of_channels" int4,
"hardware_version" varchar(255),
"firmware_version" varchar(255),
PRIMARY KEY ("node_profile_id") 
);

CREATE TABLE "wings" (
"wing_id" serial4,
"name" varchar(255) NOT NULL,
"description" varchar(255),
PRIMARY KEY ("wing_id") 
);

CREATE TABLE "channel_profiles" (
"channel_profile_id" serial4,
"description" varchar(255),
"name" varchar(255),
"metadata_url" varchar(500),
"user_id" varchar(255),
PRIMARY KEY ("channel_profile_id") 
);

CREATE TABLE "channels" (
"channel_profile_id" int4 NOT NULL,
"channel_id" serial4,
"node_id" int4 NOT NULL,
"enabled" varchar(255),
"sensor_num" int4,
"sensor_type" varchar(255),
"status_url" varchar(500),
"covThreshold" varchar(255),
"enmetric_channel_guid" varchar(255),
PRIMARY KEY ("channel_id") 
);

CREATE TABLE "room_types" (
"type_id" serial4,
"description" varchar(255),
PRIMARY KEY ("type_id") 
);

CREATE TABLE "cubicles" (
"cubible_id" serial4,
"room_id" int4 NOT NULL,
"cubicle_number" int4,
"description" varchar(255),
"location_id" int4 NOT NULL,
"user_id" varchar(255),
PRIMARY KEY ("cubible_id") 
);

CREATE TABLE "users" (
"user_id" varchar(255),
"password" varchar(255),
"node_id" int4,
PRIMARY KEY ("user_id") 
);

CREATE TABLE "rooms" (
"room_id" serial4,
"room_number" int4,
"floor_id" int4 NOT NULL,
"wing_id" int4 NOT NULL,
"description" varchar(255),
"type_id" int4 NOT NULL,
"location_id" int4 NOT NULL,
PRIMARY KEY ("room_id") 
);

CREATE TABLE "channel_plug_loads" (
"plug_load_id" serial4,
"channel_id" int4 NOT NULL,
"power" float4,
"status" int4,
"timestamp" timestamp(6),
"voltage" float4,
"current" float4,
"frequency" float4,
"power_factor" float4,
"sample_interval" varchar(255),
PRIMARY KEY ("plug_load_id") 
);


ALTER TABLE "nodes" ADD CONSTRAINT "fk_NODE_USER_ID" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "nodes" ADD CONSTRAINT "fk_NODE_NODE_PROFILE_ID" FOREIGN KEY ("node_profile_id") REFERENCES "node_profiles" ("node_profile_id");

ALTER TABLE "nodes" ADD CONSTRAINT "fk_NODE_CUBICLE_ID" FOREIGN KEY ("cubicle_id") REFERENCES "cubicles" ("cubible_id");

ALTER TABLE "floors" ADD CONSTRAINT "fk_FLOOR_LOCATION_ID" FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "channels" ADD CONSTRAINT "fk_CHANNEL_CHANNEL_PROFILE_ID" FOREIGN KEY ("channel_profile_id") REFERENCES "channel_profiles" ("channel_profile_id");

ALTER TABLE "channels" ADD CONSTRAINT "fk_CHANNEL_NODE_ID" FOREIGN KEY ("node_id") REFERENCES "nodes" ("node_id");

ALTER TABLE "cubicles" ADD CONSTRAINT "fk_CUBICLE_USER_ID" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "cubicles" ADD CONSTRAINT "fk_CUBICLE_ROOM_ID" FOREIGN KEY ("room_id") REFERENCES "rooms" ("room_id");

ALTER TABLE "cubicles" ADD CONSTRAINT "fk_CUBICLE_LOCATION_ID" FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "rooms" ADD CONSTRAINT "fk_ROOM_FLOOR_ID" FOREIGN KEY ("floor_id") REFERENCES "floors" ("floor_id");

ALTER TABLE "rooms" ADD CONSTRAINT "fk_ROOM_ROOM_TYPE_ID" FOREIGN KEY ("type_id") REFERENCES "room_types" ("type_id");

ALTER TABLE "rooms" ADD CONSTRAINT "fk_ROOM_WING_ID" FOREIGN KEY ("wing_id") REFERENCES "wings" ("wing_id");

ALTER TABLE "rooms" ADD CONSTRAINT "fk_ROOM_LOCATION_ID" FOREIGN KEY ("location_id") REFERENCES "locations" ("location_id");

ALTER TABLE "channel_plug_loads" ADD CONSTRAINT "fk_CHANNEL_PLUG_LOAD_CHANNEL_ID" FOREIGN KEY ("channel_id") REFERENCES "channels" ("channel_id");

