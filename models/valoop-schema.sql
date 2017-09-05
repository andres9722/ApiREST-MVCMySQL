DROP DATABASE IF EXISTS valoop;

CREATE DATABASE IF NOT EXISTS valoop;

USE valoop;

CREATE TABLE community (
     id VARCHAR (10) NOT NULL , 
     name VARCHAR (15) NOT NULL , 
     description VARCHAR (150) , 
     logo VARCHAR (80) , 
     inv_token VARCHAR (10) NOT NULL , 
     type_id VARCHAR (10) NOT NULL , 
     privacy_id VARCHAR (10) NOT NULL 
);

ALTER TABLE community ADD CONSTRAINT community_pk PRIMARY KEY ( id );

CREATE TABLE community_user (
     user_rol_id VARCHAR (10) NOT NULL , 
     community_id VARCHAR (10) NOT NULL , 
     user_email VARCHAR (50) NOT NULL 
);

ALTER TABLE community_user ADD CONSTRAINT community_user_pk PRIMARY KEY ( user_rol_id,community_id );

CREATE TABLE module (
     id VARCHAR (10) NOT NULL , 
     title VARCHAR (15) NOT NULL , 
     description VARCHAR (150) NOT NULL 
);

ALTER TABLE module ADD CONSTRAINT module_pk PRIMARY KEY ( id );

CREATE TABLE module_community (
     community_id VARCHAR (10) NOT NULL , 
     module_id VARCHAR (10) NOT NULL 
);

ALTER TABLE module_community ADD CONSTRAINT module_community_pk PRIMARY KEY ( community_id,module_id );

CREATE TABLE privacy (
     id VARCHAR (10) NOT NULL , 
     title VARCHAR (15) NOT NULL 
);

ALTER TABLE privacy ADD CONSTRAINT privacy_pk PRIMARY KEY ( id );

CREATE TABLE type (
     id VARCHAR (10) NOT NULL , 
     title VARCHAR (15) NOT NULL 
);

ALTER TABLE type ADD CONSTRAINT type_pk PRIMARY KEY ( id );

CREATE TABLE user (
     email VARCHAR (50) NOT NULL , 
     nick VARCHAR (15) NOT NULL , 
     name VARCHAR (15) NOT NULL , 
     last_name VARCHAR (15) , 
     password VARCHAR (15) NOT NULL 
);

ALTER TABLE user ADD CONSTRAINT user_pk PRIMARY KEY ( email );

CREATE TABLE user_rol (
     id VARCHAR (10) NOT NULL , 
     title VARCHAR (15) NOT NULL 
);

ALTER TABLE user_rol ADD CONSTRAINT user_rol_pk PRIMARY KEY ( id );


ALTER TABLE community ADD CONSTRAINT community_privacy_fk FOREIGN KEY ( privacy_id )REFERENCES privacy ( id );
ALTER TABLE community ADD CONSTRAINT community_type_fk FOREIGN KEY ( type_id )REFERENCES type ( id );

ALTER TABLE community_user ADD CONSTRAINT community_user_community_fk FOREIGN KEY ( community_id ) REFERENCES community ( id );
ALTER TABLE community_user ADD CONSTRAINT community_user_user_fk FOREIGN KEY ( user_email )REFERENCES user ( email );
ALTER TABLE community_user ADD CONSTRAINT community_user_user_rol_fk FOREIGN KEY ( user_rol_id ) REFERENCES user_rol ( id );

ALTER TABLE module_community ADD CONSTRAINT module_community_community_fk FOREIGN KEY ( community_id ) REFERENCES community ( id );
ALTER TABLE module_community ADD CONSTRAINT module_community_module_fk FOREIGN KEY ( module_id ) REFERENCES module ( id );
