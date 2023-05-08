--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

-- Started on 2023-05-07 23:10:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE desafio2_edson_salas_222;
--
-- TOC entry 3303 (class 1262 OID 16428)
-- Name: desafio2_edson_salas_222; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE desafio2_edson_salas_222 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Chile.1252';


ALTER DATABASE desafio2_edson_salas_222 OWNER TO postgres;

\connect desafio2_edson_salas_222

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


create table inscritos(cantidad INT, fecha DATE, fuente VARCHAR);
					   
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


select * from inscritos;

--¿Cuántos registros hay?
select count(*) from inscritos;

--¿Cuántos inscritos hay en total?
select sum(cantidad) from inscritos;

--¿Cuál o cuáles son los registros de mayor antigüedad?
select * from inscritos where fecha = (select min (fecha) from inscritos);

--¿Cuántos inscritos hay por día?
select fecha, sum(cantidad) from inscritos group by fecha order by fecha;

--¿Cuántos inscritos hay por fuente?
select fuente, sum(cantidad) from inscritos group by fuente order by fuente;

--¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
select fecha, sum(cantidad) as personas from inscritos group by fecha order by personas desc limit 1;

--¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
select max(cantidad) from inscritos where fuente='Blog';
select fecha, cantidad, fuente from inscritos where cantidad=(select max(cantidad) from inscritos where fuente='Blog');

--¿Cuántas personas en promedio se inscriben en un día?
select round(avg(cantidad),0) from inscritos;

--¿Qué días se inscribieron más de 50 personas?
select fecha, sum(cantidad) from inscritos group by fecha having sum(cantidad) > 50 order by fecha;

--¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
select fecha, round(avg(cantidad),0) as promedio from inscritos where fecha >= '2021/03/01' group by fecha order by fecha;

-- Completed on 2023-05-07 23:10:55

--
-- PostgreSQL database dump complete
--

