/*Grants*/
/*Grant connect database*/
GRANT CONNECT ON DATABASE database_name TO username;
/*Grant usage schema*/
GRANT USAGE ON SCHEMA schema_name TO username;
/*Grant all tables DML*/
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA schema_name TO username;
/*Grant all privileges on all tables in the schema*/
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA schema_name TO username;
/*Grant all privileges on all sequences in the schema*/
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA schema_name TO username;
/*Grant all privileges on the database*/
GRANT ALL PRIVILEGES ON DATABASE database_name TO username;
/* Grant permission to create database:*/
ALTER USER username CREATEDB;
/*Make a user superuser:*/
ALTER USER myuser WITH SUPERUSER;
/*Remove superuser status:*/
ALTER USER username WITH NOSUPERUSER;
/*Those statements above only affect the current existing tables. To apply to newly created tables, you need to use alter default. For example:*/
ALTER DEFAULT PRIVILEGES
FOR USER username
IN SCHEMA schema_name
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO username;

/*Show Roles*/

SELECT usename AS role_name,
  CASE 
     WHEN usesuper AND usecreatedb THEN 
	   CAST('superuser, create database' AS pg_catalog.text)
     WHEN usesuper THEN 
	    CAST('superuser' AS pg_catalog.text)
     WHEN usecreatedb THEN 
	    CAST('create database' AS pg_catalog.text)
     ELSE 
	    CAST('' AS pg_catalog.text)
  END role_attributes
FROM pg_catalog.pg_user
ORDER BY role_name desc;

/*Create roles*/
CREATE ROLE role_name;

SELECT role_name FROM pg_roles;

/*'/du+'*/

/*CREATE ROLE WITH OPTIONS*/
CREATE ROLE alice 
LOGIN 
PASSWORD 'securePass1';

CREATE ROLE john 
SUPERUSER 
LOGIN 
PASSWORD 'securePass1';

CREATE ROLE dba 
CREATEDB 
LOGIN 
PASSWORD 'Abcd1234';

CREATE ROLE dev_api WITH
LOGIN
PASSWORD 'securePass1'
VALID UNTIL '2030-01-01';


CREATE ROLE api
LOGIN
PASSWORD 'securePass1'
CONNECTION LIMIT 1000;





