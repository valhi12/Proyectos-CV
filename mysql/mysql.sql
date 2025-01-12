-- conectar con el servidor
-- mysql -u root -p

/* PRACTICA 1: ACADEMIA DE IDIOMAS */
/*  CREACION DE LA BASE DE DATOS*/
CREATE DATABASE academia;
USE academia;

/* CREACION DE TABLAS */

/* Cambios:
	- dni tipo char y no VARCHAR
	- En alumno, constraint con las pk para que vean las 2 formas
	- curso se crea antes que alumno, sino hace referencia a algo que no existe
	*/
CREATE TABLE profesor(
	dni CHAR(9),
	nombre VARCHAR(15),
	apellido1 VARCHAR(15),
	apellido2 VARCHAR(15),
	direccion VARCHAR(50),
	titulo VARCHAR(30),
	gana DECIMAL(7,2) NOT NULL,
	CONSTRAINT prof_pk PRIMARY KEY(dni),
	CONSTRAINT nombre_unico_uq UNIQUE (nombre,apellido1,apellido2)
	CONSTRAINT gana_nn check (gana>0)
);
	
CREATE TABLE curso(
	cod_curso int(5) PRIMARY KEY,
	nombre_curso VARCHAR(30) NOT NULL UNIQUE,
	dni_profesor VARCHAR(9),
	max_alumnos int(2),
	fecha_inicio DATE,
	fecha_fin DATE, 
	num_horas int(3) NOT NULL,
	CONSTRAINT prof_fk FOREIGN KEY (dni_profesor) 
		REFERENCES profesor(dni),
	CONSTRAINT fin_chk CHECK (fecha_fin>fecha_inicio)
	
);

CREATE TABLE alumno(
	dni CHAR(9),
	nombre VARCHAR(15),
	apellido1 VARCHAR(15),
	apellido2 VARCHAR(15),
	direccion VARCHAR(50),
	sexo CHAR(1), 
	fecha_nacimiento DATE,
	curso INT(5) NOT NULL,
	CONSTRAINT curso_pk PRIMARY KEY (dni),
	CONSTRAINT curso_fk FOREIGN KEY (curso) REFERENCES curso(cod_curso),
	-- CONSTRAINT sexo_chk CHECK (sexo IN ('H','M'))	
	CONSTRAINT sexo_chk CHECK (sexo='H' or sexo='M')
-- No comprueba el chech
	);
	


/* INSERCION DE DATOS */
-- Da errores las tildes

INSERT INTO PROFESOR VALUES ('32432455', 'Juan', 'Arch','Lopez', 'Puerta Negra, 4', 'Ing. Informatica', 7500);
INSERT INTO PROFESOR VALUES ('43215643', 'Maria', 'Oliva','Rubio', 'Juan Alfonso, 32', 'Lda. Fil. Inglesa', 5400);

INSERT INTO CURSO VALUES (1, 'Ingles Basico', '43215643', 15, '01-NOV-00', '22-DIC-00', 120);
INSERT INTO CURSO VALUES (2, 'Administracion Linux', '32432455', , '01-SEPT-00', '', 80);

INSERT INTO ALUMNO VALUES ('123523', 'Lucas', 'Manilva','Lopez', 'Alhamar, 3', 'V', '01-NOV-1979',1);
INSERT INTO ALUMNO VALUES ('2567567', 'Antonia', 'Lopez', 'Alcantara', 'Manique, 21', 'M', '',2);
INSERT INTO ALUMNO VALUES ('3123689', 'Manuel', 'Alcantara', 'Pedr�s', 'Julian, 2', '', '',2);
INSERT INTO ALUMNO VALUES ('4896765', 'Jose', 'Perez', 'Caballar', 'Jarcha, 5', 'V', '03-FEB-1977',1);

-- Sin tildes
INSERT INTO PROFESOR VALUES ('32432455', 'Juan', 'Arch','Lopez', 'Puerta Negra, 4', 'Ing. Informatica', 7500);
INSERT INTO PROFESOR VALUES ('43215643', 'Maria', 'Oliva','Rubio', 'Juan Alfonso, 32', 'Lda. Fil. Inglesa', 5400);

INSERT INTO CURSO VALUES (1, 'Ingles Basico', '43215643', 15, '2000-11-01', '2000-12-22', 120);
INSERT INTO CURSO VALUES (2, 'Administracion Linux', '32432455',null , '2000-09-01',null, 80);

INSERT INTO ALUMNO VALUES ('123523', 'Lucas', 'Manilva','Lopez', 'Alhamar, 3', 'V', '1979-11-01',1);
INSERT INTO ALUMNO VALUES ('2567567', 'Antonia', 'Lopez', 'Alcantara', 'Maniqui, 21', 'M', null,2);
INSERT INTO ALUMNO VALUES ('3123689', 'Manuel', 'Alcantara', 'Pedros', 'Julian, 2', null, null,2);
INSERT INTO ALUMNO VALUES ('4896765', 'Jose', 'Perez', 'Caballar', 'Jarcha, 5', 'V', '1977-02-03',1);



/* CORRECCIONES INSERCIONES DE DATOS */

INSERT INTO CURSO VALUES (2, 'Administracion Linux', '32432455', NULL, '2000-09-01', '', 80);

INSERT INTO ALUMNO VALUES ('123523', 'Lucas', 'Manilva','Lopez', 'Alhamar, 3', 'H', '1979-11-01',1);

INSERT INTO ALUMNO VALUES ('4896765', 'Jose', 'Perez', 'Caballar', 'Jarcha, 5', 'H', '1977-02-03',1);

/* APTDO 3 */

INSERT INTO ALUMNO VALUES ('123523', 'Sergio', 'Navas', 'Retal', '', 'P', '',);

/* SUCESIVAS CORRECCIONES PARA DESCUBRIR QUE SE VIOLA LA RESTRICCION DE UNICIDAD DE LA CLAVE PRIMARIA */

INSERT INTO ALUMNO VALUES ('123523', 'Sergio', 'Navas', 'Retal', '', 'P', '',NULL);

INSERT INTO ALUMNO VALUES ('123523', 'Sergio', 'Navas', 'Retal', null, 'H', null,1);


/* APTDO 4 */

ALTER TABLE profesor ADD COLUMN (edad INT(3) );

/* APTDO 5 a) */

ALTER TABLE profesor ADD CONSTRAINT edad_prof_chk1 CHECK (edad>18);
ALTER TABLE profesor ADD CONSTRAINT edad_prof_chk2 CHECK (edad<65);

-- Otras posibilidades:
ALTER TABLE profesor ADD CONSTRAINT edad_prof_chk CHECK ((edad>18) AND (edad<65)); 
ALTER TABLE profesor ADD CONSTRAINT edad_prof_chk CHECK (edad BETWEEN 18 AND 65);

-- Comprueba
INSERT INTO PROFESOR VALUES ('53215643', 'Maria', 'Oliva','Rubio', 'Juan Alfonso, 32', 'Lda. Fil. Inglesa', 5400, 17);

/* APTDO 5 b) */

ALTER TABLE curso ADD CONSTRAINT max_alumnos_chk CHECK (max_alumnos>=10);

/* APTDO 5 c) */

ALTER TABLE curso ADD CONSTRAINT num_horas_chk CHECK (num_horas>100);

/* Para realizar este ejercicio eliminar primero la tupla para el curso con codigo=2 */

DELETE FROM curso WHERE cod_curso = 2;

/* APTDO 6 */

ALTER TABLE alumno DROP CONSTRAINT sexo_chk;

/* APTDO 7 */

ALTER TABLE alumno ADD CONSTRAINT curso_alumno_uq UNIQUE (curso);

/* ERROR ORA-02299 que alude a la existencia de codigos de curso duplicados. Tal y como se ha dicho en clases, de esta forma cada curso solo podria tener un alumno*/

/* APTDO 8 */

ALTER TABLE profesor DROP CONSTRAINT gana_nn;

/* APTDO 9 */

ALTER TABLE curso MODIFY fecha_inicio NOT NULL;

/* APTDO 10 */

-- Añado CASCADE, para poder eliminar la PK de PROFESORES estando esta referenciada en la FK_DNI_PROFESORES.
ALTER TABLE PROFESORES DROP CONSTRAINT prof_pk CASCADE;
ALTER TABLE PROFESORES ADD CONSTRAINT prof_pk PRIMARY KEY(nombre, apellido1, apellido2);



/* APTDO 11 */
INSERT INTO PROFESOR VALUES ('32432455', 'Juan', 'Arch','Lopez', 'Puerta Negra, 4', 'Ing. Informatica', NULL);
INSERT INTO ALUMNO VALUES ('789678', 'Maria', 'Jaen', 'Sevilla', 'Martos 5', 'M', '10-MAR-1977', 3);

-- Haria esto pero da error
-- El profesor '32432455' ya existe, necesita update */
UPDATE PROFESORES
SET GANA=NULL
WHERE DNI='32432455';

-- No existe el curso 3. O le cambio el curso o introduzco un curso 3 en la tabla CURSOS.


/* APTDO 12 */
UPDATE ALUMNO
SET fecha_nacimiento='23-DIC-1976' 
WHERE nombre ='Antonia' AND apellido1='Lopez';

/* APTDO 13 */
UPDATE ALUMNO
SET curso=5 
WHERE nombre ='Antonia' AND apellido1='Lopez';
--No existe el curso 5, da error. 


/* APTDO 14. Eliminar la profesora Laura Jimenez */
DELETE profesor 
WHERE nombre ='Laura' AND apellido1='Jimenez';
--Imposible eliminar una profesora que NO existe.

/* APTDO 15. Crea la tabla:NOMBRE DE ALUMNOS. El atributo (NOMBRE_COMPLETO) de tipo cadena de caracteres */
CREATE TABLE NOMBRE_DE_ALUMNOS(
	NOMBRE_COMPLETO VARCHAR(50)
);

INSERT INTO NOMBRE_DE_ALUMNOS (NOMBRE_COMPLETO)
SELECT concat(nombre,' ', apellido1, ' ', apellido2)
FROM ALUMNO;

	
/* APTDO 16. Borrar las tablas */
DROP TABLE CURSO; 
DROP TABLE ALUMNO; 
DROP TABLE PROFESOR; 
