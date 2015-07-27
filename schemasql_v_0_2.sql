CREATE TABLE "USER" (
"user_id" varchar(255),
"password" varchar(255) NOT NULL,
"node_id" int4,
"cubicle_id" int4,
PRIMARY KEY ("user_id") 
);

CREATE TABLE "NODE" (
"node_id" serial4,
"node_profile_id" int4 NOT NULL,
"mac_addr" macaddr,
"bridge_mac_addr" macaddr,
"state" varchar(255),
"online" varchar(255),
"status_url" varchar(500),
"location_id" int4,
"last_updated" timestamp,
"enmetric_node_guid" varchar(255),
"user_id" varchar(255),
PRIMARY KEY ("node_id") 
);

CREATE TABLE "CUBICLE" (
"cubible_id" serial4,
"room_id" varchar(255) NOT NULL,
"cubicle_number" int4,
"node_id" int4,
"description" varchar(255),
PRIMARY KEY ("cubible_id") 
);

CREATE TABLE "ROOM" (
"room_id" serial4,
"room_number" int4 NOT NULL,
"floor_id" int4 NOT NULL,
"wing_id" int4,
"description" varchar(255),
"type_id" int4,
PRIMARY KEY ("room_id") 
);

CREATE TABLE "FLOOR" (
"floor_id" serial4,
"floor_number" int4 NOT NULL,
"description" varchar(255),
PRIMARY KEY ("floor_id") 
);

CREATE TABLE "LOCATION" (
"location_id" serial4,
"location" point,
"floor_id" int4,
PRIMARY KEY ("location_id") 
);

CREATE TABLE "ROOM_TYPE" (
"type_id" serial4,
"description" varchar(255),
PRIMARY KEY ("type_id") 
);

CREATE TABLE "WING" (
"wing_id" serial4,
"name" varchar(255),
"description" varchar(255),
PRIMARY KEY ("wing_id") 
);

CREATE TABLE "NODE_PROFILE" (
"node_profile_id" serial4,
"node_name" varchar(255),
"metadata_url" varchar(500),
"num_of_channels" int4,
"hardware_version" varchar(255),
"firmware_version" varchar(255),
PRIMARY KEY ("node_profile_id") 
);

CREATE TABLE "CHANNEL" (
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

CREATE TABLE "CHANNEL_PROFILE" (
"channel_profile_id" serial4,
"description" varchar(255),
"name" varchar(255),
"metadata_url" varchar(500),
"user_id" varchar(255),
PRIMARY KEY ("channel_profile_id") 
);

CREATE TABLE "CHANNEL_PLUG_LOAD" (
"plug_load_id" serial4,
"channel_id" int4 NOT NULL,
"power" float4,
"status" int4,
"timestamp" timestamp,
"voltage" float4,
"current" float4,
"frequency" float4,
"power_factor" float4,
"sample_interval" varchar(255),
PRIMARY KEY ("plug_load_id") 
);


ALTER TABLE "USER" ADD CONSTRAINT "fk_USER_USER_1" FOREIGN KEY ("cubicle_id") REFERENCES "CUBICLE" ("cubible_id");
ALTER TABLE "CUBICLE" ADD CONSTRAINT "fk_CUBICLE_CUBICLE_1" FOREIGN KEY ("room_id") REFERENCES "ROOM" ("room_id");
ALTER TABLE "ROOM" ADD CONSTRAINT "fk_ROOM_ROOM_1" FOREIGN KEY ("floor_id") REFERENCES "FLOOR" ("floor_id");
ALTER TABLE "ROOM" ADD CONSTRAINT "fk_ROOM_ROOM_2" FOREIGN KEY ("type_id") REFERENCES "ROOM_TYPE" ("type_id");
ALTER TABLE "LOCATION" ADD CONSTRAINT "fk_LOCATION_LOCATION_1" FOREIGN KEY ("floor_id") REFERENCES "FLOOR" ("floor_id");
ALTER TABLE "ROOM" ADD CONSTRAINT "fk_ROOM_ROOM_3" FOREIGN KEY ("wing_id") REFERENCES "WING" ("wing_id");
ALTER TABLE "USER" ADD CONSTRAINT "fk_USER_USER_2" FOREIGN KEY ("node_id") REFERENCES "NODE" ("node_id");
ALTER TABLE "NODE" ADD CONSTRAINT "fk_NODE_NODE_2" FOREIGN KEY ("location_id") REFERENCES "LOCATION" ("location_id");
ALTER TABLE "NODE" ADD CONSTRAINT "fk_NODE_NODE_1" FOREIGN KEY ("node_profile_id") REFERENCES "NODE_PROFILE" ("node_profile_id");
ALTER TABLE "CHANNEL" ADD CONSTRAINT "fk_CHANNEL_CHANNEL_1" FOREIGN KEY ("channel_profile_id") REFERENCES "CHANNEL_PROFILE" ("channel_profile_id");
ALTER TABLE "CHANNEL" ADD CONSTRAINT "fk_CHANNEL_CHANNEL_2" FOREIGN KEY ("node_id") REFERENCES "NODE" ("node_id");
ALTER TABLE "CHANNEL_PLUG_LOAD" ADD CONSTRAINT "fk_CHANNEL_PLUG_LOAD_CHANNEL_PLUG_LOAD_1" FOREIGN KEY ("channel_id") REFERENCES "CHANNEL" ("channel_id");

