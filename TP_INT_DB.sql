CREATE DATABASE IF NOT EXISTS SDG_Educativa;
USE SDG_Educativa;

DROP TABLE IF EXISTS PROVINCIAS;
CREATE TABLE PROVINCIAS (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50),
	CONSTRAINT PK_id PRIMARY KEY(id)
);

DROP TABLE IF EXISTS LOCALIDADES;
CREATE TABLE LOCALIDADES (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50),
    id_provincia INT NOT NULL,
	CONSTRAINT PK_id PRIMARY KEY(id),
    CONSTRAINT FK_idProvincia FOREIGN KEY (id_provincia) REFERENCES PROVINCIAS (id) ON DELETE CASCADE ON UPDATE CASCADE    
);

DROP TABLE IF EXISTS PERSONAS;
CREATE TABLE PERSONAS (
	dni VARCHAR(10) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	fechaNacimiento VARCHAR(10) NULL,
	direccion VARCHAR(100) NULL,
	id_localidad INT NULL,
	id_provincia INT NULL,
	email VARCHAR(35) NOT NULL, 
	telefono VARCHAR(10) NOT NULL,
    estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_dni PRIMARY KEY(dni),
    CONSTRAINT FK_idLocalidad FOREIGN KEY (id_localidad) REFERENCES LOCALIDADES (id),
    CONSTRAINT FK_idProvincia_p FOREIGN KEY (id_provincia) REFERENCES PROVINCIAS (id)
);

DROP TABLE IF EXISTS ALUMNOS;
CREATE TABLE ALUMNOS (
	legajo INT NOT NULL AUTO_INCREMENT,
    dni VARCHAR(9) NOT NULL,
    estado BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_Legajo PRIMARY KEY(legajo),
    CONSTRAINT FK_dni FOREIGN KEY (dni) REFERENCES PERSONAS (dni) ON DELETE CASCADE ON UPDATE CASCADE    
) AUTO_INCREMENT = 1000;

DROP TABLE IF EXISTS PERFILES;
CREATE TABLE PERFILES(
	idperfil INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(30) NOT NULL,
    CONSTRAINT PK_idperfil PRIMARY KEY (idperfil)
);

DROP TABLE IF EXISTS LOGIN;
CREATE TABLE LOGIN (
	id INT NOT NULL AUTO_INCREMENT,
    userLogin VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    id_perfil int not null,
    estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_IdLogin PRIMARY KEY (id),
    CONSTRAINT FK_perfil FOREIGN KEY (id_perfil) REFERENCES PERFILES (idperfil) ON DELETE CASCADE ON UPDATE CASCADE    
);

DROP TABLE IF EXISTS DOCENTES;
CREATE TABLE DOCENTES (
	legajo INT NOT NULL AUTO_INCREMENT,
    dni VARCHAR(9) NOT NULL,
    id_login INT NOT NULL,
    estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_legajo PRIMARY KEY (legajo),
    CONSTRAINT FK_dniDocente FOREIGN KEY (dni) REFERENCES PERSONAS (dni) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_idLogin FOREIGN KEY (id_login) REFERENCES LOGIN (id) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 100;

DROP TABLE IF EXISTS CONDICIONES;
CREATE TABLE CONDICIONES (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(15) NOT NULL,
    CONSTRAINT PK_IdCondicion PRIMARY KEY (id)
);

DROP TABLE IF EXISTS NOTAS;
CREATE TABLE NOTAS (
	id INT NOT NULL AUTO_INCREMENT,
    nota1 INT NULL,
    recuperatorio1 INT NULL,
    nota2 INT NULL,
    recuperatorio2 INT NULL, 
    id_Condicion INT NOT NULL DEFAULT 2,
    CONSTRAINT PK_IdNota PRIMARY KEY (id),
    CONSTRAINT FK_IdCondicion FOREIGN KEY (id_Condicion) REFERENCES CONDICIONES (id)
);

DROP TABLE IF EXISTS TURNOS;
CREATE TABLE TURNOS (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(15) NOT NULL,
    CONSTRAINT PK_IdCondicion PRIMARY KEY (id)
);

DROP TABLE IF EXISTS MATERIAS;
CREATE TABLE MATERIAS (
  id INT NOT NULL AUTO_INCREMENT,
  descripcion varchar(30) NOT NULL,
  CONSTRAINT PK_IdMateria PRIMARY KEY(id) 
);

DROP TABLE IF EXISTS CURSOS;
CREATE TABLE CURSOS (
	id INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(30) NULL,
    cuatrimestre VARCHAR(20) NOT NULL,
    año INT NOT NULL,
    id_Turno INT NOT NULL,
    id_Materia INT NOT NULL,
    legajo_Docente INT NOT NULL,
    estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_IdCurso PRIMARY KEY (id),
    CONSTRAINT FK_IdTurno FOREIGN KEY (id_Turno) REFERENCES TURNOS (id),
    CONSTRAINT FK_IdMateria FOREIGN KEY (id_Materia) REFERENCES MATERIAS (id),
    CONSTRAINT FK_legajoDocente FOREIGN KEY (legajo_Docente) REFERENCES DOCENTES (legajo)
);

DROP TABLE IF EXISTS ALUMNOXCURSO;
CREATE TABLE ALUMNOXCURSO (
    legajo_Alumno INT NOT NULL,
    id_Curso INT NOT NULL,
    id_Nota INT NOT NULL,
    estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_IdCurso PRIMARY KEY (legajo_Alumno,id_Curso),
    CONSTRAINT FK_IdCurso FOREIGN KEY (id_Curso) REFERENCES CURSOS (id),
    CONSTRAINT FK_legajoAlumno FOREIGN KEY (legajo_Alumno) REFERENCES ALUMNOS (legajo),
    CONSTRAINT FK_IdNota FOREIGN KEY (id_Nota) REFERENCES NOTAS (id)
);

INSERT INTO PROVINCIAS (descripcion) VALUES ('Buenos Aires'),('Mendoza'),('La Pampa'),('Rio Negro'),('Neuquen'),('Cordoba'),('Tierra del Fuego'),('Chubut'),('Misiones'),('Santa Cruz');

INSERT INTO LOCALIDADES (descripcion, id_provincia) VALUES ('Tigre','1'),('General Pacheco','1'),
('San Fernando','1'),('Don Torcuato','1'),('Agua Escondida','2'),('Pedriel','2'),('Guaymallén','2'),('Catriló','3'),
('La Adela','3'),('Quehue','3'),('Cipolletti','4'),('Bariloche','4'),('Allen','4'),('Neuquen','5'),('Zapala','5'),
('Plottier','5'),('Villa Carlos Paz','6'),('Ciudad de Cordoba','6'),('San Agustín','6'),('Ushuaia','7'),('Lago Escondido','7'),
('Timaukel','7'),('Rawson','8'),('Trelew','8'),('Puerto Madryn','8'),('Posadas','9'),('Puerto Iguazu','9'),('Montecarlo','9'),
('Rio Gallegos','10'),('El Calafate','10'),('Puerto Deseado','10');

INSERT INTO PERSONAS (dni,nombre,apellido,fechaNacimiento,direccion,id_localidad,id_provincia,email,telefono)
VALUES
('41619879','Agustin','Pantoja','1999-09-07','Paraguay 1573',11,4,'agustin.pantojab@hotmail.com','2995022557'),
('41627913','Dario','Bravo','1999-06-03','Uruguay 13',15,5,'dariox@gmail.com','296602845'),
('40684234','Marcelo','Saez','1998-01-11','Los Notros 497',17,6,'marcelisho@hotmail.com','1550225579'),
('40696611','Matias','Cofre','1997-12-27','Esmeralda 8971',27,9,'cofim@outlook.com','1597042571'),
('39996952','Luciana','Romero','1993-08-20','Menguelle 1797',13,4,'lucii_rom@hotmail.com','1552349876'),
('41989741','Pedro','Lanthier','1999-04-17','Rio Colorado 872',12,4,'pedrito.la@live.com','1545804740'),
('40987123','Ruben','Blanco','1997-10-15','Antartida Argentina 761',15,5,'mr.blanco@gmail.com','1548761349'),
('41891338','Ana','García','1999-10-20','Avellaneda 782',21,7,'anita_lago@gmail.com','1542647893'),
('38274818','Victoria','Fernandez','1993-02-01','Avenida Alem 1598',9,3,'vikoofer@hotmail.com','1557498623'),
('41618791','Matias','Oszczypok-Czop','1999-09-28','Sobremonte 618',7,2,'oxi.matii@outlook.com','1552398764'),
('39274818','Jorgelina','Rey','1995-03-18','Lago Hess 2341',22,7,'jorr_rey@hotmail.com','1554753159'),
('38176048','Valentina','Robles','1994-06-30','Avenida Santa Fe 8791',18,6,'valencita.ro12@hotmail.com','1541597534'),
('40696895','Nicolas','Vera','1997-07-30','Fondo de la legua 159',30,10,'nikooo159@hotmail.com','1551599513'),
('35820026','Ulises','Munch','1994-05-17','Juan XIII 799',23,8,'uli_mu_rawson@gmail.com','1553579638'),
('41539270','Daiana','Huenchuñir','1998-11-28','9 de Julio 2578',19,6,'daii_98@hotmail.com','1543691472'),
('41972523','Sebastian','Correa','1999-12-01','España 746',14,5,'seba.nqn.correa@gmail.com','1559871235'),
('40763345','Roberto','Perez','1997-06-15','Gandolfo 123',1,1,'rperez@gmail.com','15124578'),
('38639732','Amelia','Rodriguez','1995-10-12','Garibaldi 456',2,1,'ameliar@gmail.com','15986532'),
('38521672','Rocio','Garcia','1994-11-02','Pasteur 1256',3,1,'rgarcia@hotmail.com','15142536'),
('40521669','Mauro','Poncio','1999-09-07','Quintana 2007',3,1,'maurop@hotmail.com','15748596'),

('18318716','Sergio','Faiad','1967-07-09','25 de Mayo 157',31,10,'sergiof-prog@hotmail.com','1553216549'),
('11959307','Ricardo','Roberts','1955-02-07','Bariloche 6445',16,5,'ricardo.roberts@hotmail.com','1547539518'),
('25735166','Hector','Bracho','1977-09-28','Mexico 9874',8,3,'hector.mex@hotmail.com','1553649798'),
('31551372','Carlos','Gonza','1981-04-25','Naciones Unidas 4194',24,8,'gonzacar@gmail.com','1569413570'),
('23288141','Facundo','Aranda','1973-05-09','Pastor Bowdler 4813',26,9,'aranda-facundo-pb@hotmail.com','1569742401'),
('14569566','Florencia','Salamanca','1961-07-07','Olazabal 2815',16,5,'salamancaflor@hotmail.com','1568713800'),
('25485644','Alejandro','Marquez','1977-02-09','Garcia Mansilla 3066',1,1,'marqueza@gmail.com','15647789'),
('28389405','Damian','Natan','1981-11-02','Peron 80',6,2,'damiannatale@hotmail.com','15010214'),
('26949397','Cesar','Tejedor','1979-07-14','Alvarez Thomas 541',29,10,'cesartejedor-79@hotmail.com','1567813495'),
('20332183','Tomas','Morales','1968-11-29','Alvear 451',8,3,'moralestomas-work@hotmail.com','1559302408'),	
('32839092','Agustina','Rojas','1987-05-17','Avenida Dorrego 804',4,1,'agusrojas.contacto@gmail.com','1553497260'),
('35727743','Jorge','Carrizo','1990-08-27','La Plata 1039',6,2,'jorgecarrizo.oficial@gmail.com','1559845301'),
('32684666','Bautista','Cantero','1985-07-18','Puyrredon 299',10,3,'bauti-cantero.prof@hotmail.com','1543907805'),
('21773823','Martina','Saso','1971-02-19','Saenz Peña 640',20,7,'martu-saso@outlook.com','1549871640'),
('32869143','German','Quiroga','1997-03-11','San Martin 1607',11,4,'ger_quiroga_97@gmail.com','1569730460');

INSERT INTO ALUMNOS (dni) VALUES ('40763345'),('38639732'),('38521672'),('40521669'),('41619879'),('41627913'),('40684234'),
('40696611'),('39996952'),('41989741'),('40987123'),('41891338'),('38274818'),('41618791'),('39274818'),('38176048'),('40696895'),
('35820026'),('41539270'),('41972523');

INSERT INTO PERFILES (descripcion) VALUES ('ADMINISTRADOR'),('DOCENTE');

INSERT INTO LOGIN (userLogin,password,id_perfil) VALUES ('Admin','UTN9',1),('Prof1','Prof1',2),
('Prof2','Prof2',2),('Prof3','Prof3',2),('Prof4','Prof4',2),('Prof5','Prof5',2),('Prof6','Prof6',2),
('Prof7','Prof7',2),('Prof8','Prof8',2),('Prof9','Prof9',2),('Prof10','Prof10',2),('Prof11','Prof11',2),
('Prof12','Prof12',2),('Prof13','Prof13',2),('Prof14','Prof14',2),('Prof15','Prof15',2);

INSERT INTO DOCENTES (dni,id_login) VALUES ('18318716','2'),('11959307','3'),('25735166','4'),('31551372','5'),
('23288141','6'),('14569566','7'),('25485644','8'),('28389405','9'),('26949397','10'),('20332183','11'),('32839092','12'),
('35727743','13'),('32684666','14'),('21773823','15'),('32869143','16');

INSERT INTO CONDICIONES (descripcion) VALUES ('Regular'),('Libre');

INSERT INTO TURNOS (descripcion) VALUES ('Mañana'),('Noche');

INSERT INTO MATERIAS (descripcion) VALUES ('Programacion_1'),('Programacion_2'),('Programacion_3'),
('Matematica'),('Ingles'),('Laboratorio_1'),('Laboratorio_2'),('Laboratorio_3'),('Legislacion'),
('Estadistica');

INSERT INTO CURSOS (descripcion,cuatrimestre,año,id_Turno,id_Materia,legajo_Docente) VALUES
('Programacion 1','Primer cuatrimestre',2019,1,1,100),
('Programacion 1','Primer cuatrimestre',2020,1,1,100),
('Programacion 1','Primer cuatrimestre',2019,2,1,102),
('Programacion 1','Primer cuatrimestre',2020,2,1,102),
('Programacion 2','Segundo cuatrimestre',2019,1,2,105),
('Programacion 2','Segundo cuatrimestre',2020,1,2,105),
('Programacion 2','Segundo cuatrimestre',2019,2,2,107),
('Programacion 2','Segundo cuatrimestre',2020,2,2,107),
('Programacion 3','Primer cuatrimestre',2020,1,3,108),
('Programacion 3','Primer cuatrimestre',2020,2,3,110),
('Matematica','Primer cuatrimestre',2019,1,4,102),
('Matematica','Primer cuatrimestre',2020,1,4,112),
('Matematica','Primer cuatrimestre',2019,2,4,113),
('Matematica','Primer cuatrimestre',2020,2,4,113),
('Ingles','Segundo cuatrimestre',2019,1,5,101),
('Ingles','Segundo cuatrimestre',2020,1,5,101),
('Ingles','Segundo cuatrimestre',2019,2,5,102),
('Ingles','Segundo cuatrimestre',2020,2,5,102),
('Laboratorio 1','Primer cuatrimestre',2019,1,6,103),
('Laboratorio 1','Primer cuatrimestre',2020,1,6,103),
('Laboratorio 1','Primer cuatrimestre',2019,2,6,104),
('Laboratorio 1','Primer cuatrimestre',2020,2,6,104),
('Laboratorio 2','Segundo cuatrimestre',2019,1,7,105),
('Laboratorio 2','Segundo cuatrimestre',2020,1,7,105),
('Laboratorio 2','Segundo cuatrimestre',2019,2,7,106),
('Laboratorio 2','Segundo cuatrimestre',2020,2,7,102),
('Laboratorio 3','Primer cuatrimestre',2020,1,8,107),
('Laboratorio 3','Primer cuatrimestre',2020,2,8,108),
('Legislacion','Segundo cuatrimestre',2019,1,9,109),
('Legislacion','Segundo cuatrimestre',2020,1,9,109),
('Legislacion','Segundo cuatrimestre',2019,2,9,101),
('Legislacion','Segundo cuatrimestre',2020,2,9,101),
('Estadistica','Primer cuatrimestre',2019,1,10,100),
('Estadistica','Primer cuatrimestre',2020,1,10,100),
('Estadistica','Primer cuatrimestre',2019,2,10,112);



DELIMITER $$
CREATE PROCEDURE SP_AgregarAlumno (
IN _dni VARCHAR(9),
IN _nombre VARCHAR(30),
IN _apellido VARCHAR(30),
IN _fechaNacimiento VARCHAR(10),
IN _direccion VARCHAR(100),
IN _idLocalidad VARCHAR(30),
IN _idProvincia VARCHAR(30),
IN _email VARCHAR(35),
IN _telefono VARCHAR(10)
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
		START TRANSACTION;        		
			INSERT INTO personas (dni, nombre, apellido, fechaNacimiento, direccion, id_localidad, id_provincia, email, telefono) 
					VALUES(_dni, _nombre, _apellido, _fechaNacimiento, _direccion, _idLocalidad, _idProvincia, _email, _telefono);
			INSERT INTO alumnos (dni) VALUES (_dni);
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_EliminarAlumno (
IN _legajo INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
		START TRANSACTION;			
			UPDATE personas p INNER JOIN alumnos a ON a.dni = p.dni 
				SET p.estado = 0, a.estado = 0 WHERE a.legajo = _legajo;
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_ModificarAlumno (
IN _dni VARCHAR(9),
IN _nombre VARCHAR(30),
IN _apellido VARCHAR(30),
IN _fechaNacimiento VARCHAR(10),
IN _direccion VARCHAR(100),
IN _idLocalidad INT,
IN _idProvincia INT,
IN _email VARCHAR(35),
IN _telefono VARCHAR(10)
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
START TRANSACTION;					
			UPDATE personas 
				SET nombre = _nombre, apellido = _apellido, fechaNacimiento = _fechaNacimiento, direccion = _direccion, 
					id_localidad = _idLocalidad, id_provincia = _idProvincia, email = _email, telefono = _telefono
				WHERE dni = _dni;
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_AgregarDocente (
IN _dni VARCHAR(9),
IN _nombre VARCHAR(30),
IN _apellido VARCHAR(30),
IN _fechaNacimiento VARCHAR(10),
IN _direccion VARCHAR(100),
IN _idLocalidad VARCHAR(30),
IN _idProvincia VARCHAR(30),
IN _email VARCHAR(35),
IN _telefono VARCHAR(10),
IN _user VARCHAR(30),
IN _passw VARCHAR(30),
IN _id_perfil INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
        START TRANSACTION;        		
			INSERT INTO personas (dni, nombre, apellido, fechaNacimiento, direccion, id_localidad, id_provincia, email, telefono) 
					VALUES(_dni, _nombre, _apellido, _fechaNacimiento, _direccion, _idLocalidad, _idProvincia, _email, _telefono);
			INSERT INTO LOGIN (userLogin,password,id_perfil)
					VALUES (_user,_passw,_id_perfil);
				SET @_id_login = LAST_INSERT_ID();
			INSERT INTO docentes (dni, login_d) 
					VALUES (_dni, @_id_login);
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_EliminarDocente (
IN _legajo INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
		START TRANSACTION;			
			UPDATE personas p INNER JOIN docentes d ON d.dni = p.dni
				SET p.estado = 0, d.estado = 0 WHERE d.legajo = _legajo;
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_ModificarDocente (
IN _dni VARCHAR(9),
IN _nombre VARCHAR(30),
IN _apellido VARCHAR(30),
IN _fechaNacimiento VARCHAR(10),
IN _direccion VARCHAR(100),
IN _idLocalidad INT,
IN _idProvincia INT,
IN _email VARCHAR(35),
IN _telefono VARCHAR(10),
IN _user VARCHAR(30),
IN _passw VARCHAR(30),
IN _id_perfil INT,
IN _id_login INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;			
        START TRANSACTION;			
			UPDATE personas 
				SET nombre = _nombre, apellido = _apellido, fechaNacimiento = _fechaNacimiento, direccion = _direccion, 
					id_localidad = _idLocalidad, id_provincia = _idProvincia, email = _email, telefono = _telefono
				WHERE dni = _dni;		
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_AgregarCurso (
IN descripcion VARCHAR(30),
IN _cuatrimestre VARCHAR(20),
IN _año INT,
IN _id_Turno INT,
IN _id_Materia INT,
IN _legajo_Docente INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
    START TRANSACTION;        		
			INSERT INTO cursos (descripcion,cuatrimestre,año,id_Turno,id_Materia,legajo_Docente) 
					VALUES(_descripcion,_cuatrimestre,_año,_id_Turno,_id_Materia,_legajo_Docente);
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_EliminarCurso (
IN _id INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
		START TRANSACTION;
			UPDATE cursos SET estado = 0 WHERE id = _id;
            UPDATE alumnoxcurso SET estado = 0 WHERE id_curso = _id;
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_ModificarCurso (
IN _id INT,
IN descripcion VARCHAR(30),
IN _cuatrimestre VARCHAR(20),
IN _año INT,
IN _id_Turno INT,
IN _id_Materia INT,
IN _id_Docente INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
		START TRANSACTION;					
			UPDATE cursos 
				SET descripcion = _descripcion, cuatrimestre = _cuatrimestre, año = _año,
					id_Turno = _id_Turno, id_Materia = _id_Materia, id_Docente =_id_Docente
				WHERE id = _id;
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_AgregarAlumnoACurso (
IN _legajo INT,
IN _idCurso INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
        START TRANSACTION;
                INSERT INTO NOTAS (nota1,recuperatorio1,nota2,recuperatorio2) VALUES (0,0,0,0);
					SET @_idNotas = LAST_INSERT_ID();
				INSERT INTO alumnoxcurso (legajo_Alumno,id_Curso,id_nota) 
						VALUES (_legajo, _idCurso, @_idNotas);
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_EliminarAlumnoCurso(
IN _id INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
		START TRANSACTION;
			UPDATE alumnoxcurso SET estado = 0 WHERE LEGAJO_ALUMNO = _id;
		COMMIT WORK;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_CargarNotas (
IN _id_notas INT,
IN _nota1 INT,
IN _rec1 INT,
IN _nota2 INT,
IN _rec2 INT,
IN _id_Condicion INT
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		ROLLBACK;
    END;
        START TRANSACTION;        		
			UPDATE NOTAS SET nota1 = _nota1, recuperatorio1 = _rec1, nota2 = _nota2, 
				recuperatorio2 = _rec2, id_Condicion = _id_Condicion WHERE id = _id_Notas;
		COMMIT WORK;
END$$
DELIMITER ;


CALL SP_AgregarAlumnoACurso(1000,1); CALL SP_AgregarAlumnoACurso(1001,1);
CALL SP_AgregarAlumnoACurso(1002,1); CALL SP_AgregarAlumnoACurso(1003,1);
CALL SP_AgregarAlumnoACurso(1004,1); CALL SP_AgregarAlumnoACurso(1005,1);
CALL SP_AgregarAlumnoACurso(1006,1); CALL SP_AgregarAlumnoACurso(1007,1);
CALL SP_AgregarAlumnoACurso(1008,1); CALL SP_AgregarAlumnoACurso(1009,1);
CALL SP_AgregarAlumnoACurso(1006,2); CALL SP_AgregarAlumnoACurso(1007,2);
CALL SP_AgregarAlumnoACurso(1008,2); CALL SP_AgregarAlumnoACurso(1009,2);
CALL SP_AgregarAlumnoACurso(1010,2); CALL SP_AgregarAlumnoACurso(1011,2);
CALL SP_AgregarAlumnoACurso(1018,3); CALL SP_AgregarAlumnoACurso(1019,3);
CALL SP_AgregarAlumnoACurso(1012,3); CALL SP_AgregarAlumnoACurso(1013,3);
CALL SP_AgregarAlumnoACurso(1014,4); CALL SP_AgregarAlumnoACurso(1015,4);
CALL SP_AgregarAlumnoACurso(1016,4); CALL SP_AgregarAlumnoACurso(1017,4);
CALL SP_AgregarAlumnoACurso(1000,5); CALL SP_AgregarAlumnoACurso(1001,5);
CALL SP_AgregarAlumnoACurso(1002,5); CALL SP_AgregarAlumnoACurso(1003,5);
CALL SP_AgregarAlumnoACurso(1004,5); CALL SP_AgregarAlumnoACurso(1005,5);
CALL SP_AgregarAlumnoACurso(1006,5); CALL SP_AgregarAlumnoACurso(1007,5);
CALL SP_AgregarAlumnoACurso(1008,5); CALL SP_AgregarAlumnoACurso(1009,5);
CALL SP_AgregarAlumnoACurso(1006,6); CALL SP_AgregarAlumnoACurso(1007,6);
CALL SP_AgregarAlumnoACurso(1008,6); CALL SP_AgregarAlumnoACurso(1009,6);
CALL SP_AgregarAlumnoACurso(1010,6); CALL SP_AgregarAlumnoACurso(1011,6);
CALL SP_AgregarAlumnoACurso(1018,7); CALL SP_AgregarAlumnoACurso(1019,7);
CALL SP_AgregarAlumnoACurso(1012,7); CALL SP_AgregarAlumnoACurso(1013,7);
CALL SP_AgregarAlumnoACurso(1014,8); CALL SP_AgregarAlumnoACurso(1015,8);
CALL SP_AgregarAlumnoACurso(1016,8); CALL SP_AgregarAlumnoACurso(1017,8);
CALL SP_AgregarAlumnoACurso(1000,9); CALL SP_AgregarAlumnoACurso(1001,9);
CALL SP_AgregarAlumnoACurso(1002,9); CALL SP_AgregarAlumnoACurso(1003,9);
CALL SP_AgregarAlumnoACurso(1004,9); CALL SP_AgregarAlumnoACurso(1005,9);
CALL SP_AgregarAlumnoACurso(1006,9); CALL SP_AgregarAlumnoACurso(1007,9);
CALL SP_AgregarAlumnoACurso(1008,9); CALL SP_AgregarAlumnoACurso(1009,9);
CALL SP_AgregarAlumnoACurso(1012,10); CALL SP_AgregarAlumnoACurso(1013,10);
CALL SP_AgregarAlumnoACurso(1008,10); CALL SP_AgregarAlumnoACurso(1009,10);
CALL SP_AgregarAlumnoACurso(1010,10); CALL SP_AgregarAlumnoACurso(1011,10);
CALL SP_AgregarAlumnoACurso(1000,11); CALL SP_AgregarAlumnoACurso(1001,11);
CALL SP_AgregarAlumnoACurso(1002,11); CALL SP_AgregarAlumnoACurso(1003,11);
CALL SP_AgregarAlumnoACurso(1004,11); CALL SP_AgregarAlumnoACurso(1005,11);
CALL SP_AgregarAlumnoACurso(1006,11); CALL SP_AgregarAlumnoACurso(1007,11);
CALL SP_AgregarAlumnoACurso(1008,11); CALL SP_AgregarAlumnoACurso(1009,11);
CALL SP_AgregarAlumnoACurso(1012,12); CALL SP_AgregarAlumnoACurso(1013,12);
CALL SP_AgregarAlumnoACurso(1008,12); CALL SP_AgregarAlumnoACurso(1009,12);
CALL SP_AgregarAlumnoACurso(1010,12); CALL SP_AgregarAlumnoACurso(1011,12);
CALL SP_AgregarAlumnoACurso(1018,13); CALL SP_AgregarAlumnoACurso(1019,13);
CALL SP_AgregarAlumnoACurso(1010,13); CALL SP_AgregarAlumnoACurso(1011,13);
CALL SP_AgregarAlumnoACurso(1000,14); CALL SP_AgregarAlumnoACurso(1001,14);
CALL SP_AgregarAlumnoACurso(1002,14); CALL SP_AgregarAlumnoACurso(1003,14);
CALL SP_AgregarAlumnoACurso(1000,15); CALL SP_AgregarAlumnoACurso(1001,15);
CALL SP_AgregarAlumnoACurso(1002,15); CALL SP_AgregarAlumnoACurso(1003,15);
CALL SP_AgregarAlumnoACurso(1004,15); CALL SP_AgregarAlumnoACurso(1005,15);
CALL SP_AgregarAlumnoACurso(1006,15); CALL SP_AgregarAlumnoACurso(1007,15);
CALL SP_AgregarAlumnoACurso(1008,15); CALL SP_AgregarAlumnoACurso(1009,15);
CALL SP_AgregarAlumnoACurso(1012,16); CALL SP_AgregarAlumnoACurso(1013,16);
CALL SP_AgregarAlumnoACurso(1008,16); CALL SP_AgregarAlumnoACurso(1009,16);
CALL SP_AgregarAlumnoACurso(1010,16); CALL SP_AgregarAlumnoACurso(1011,16);
CALL SP_AgregarAlumnoACurso(1018,17); CALL SP_AgregarAlumnoACurso(1019,17);
CALL SP_AgregarAlumnoACurso(1004,17); CALL SP_AgregarAlumnoACurso(1005,17);
CALL SP_AgregarAlumnoACurso(1014,18); CALL SP_AgregarAlumnoACurso(1015,18);
CALL SP_AgregarAlumnoACurso(1016,18); CALL SP_AgregarAlumnoACurso(1017,18);
CALL SP_AgregarAlumnoACurso(1000,19); CALL SP_AgregarAlumnoACurso(1001,19);
CALL SP_AgregarAlumnoACurso(1002,19); CALL SP_AgregarAlumnoACurso(1003,19);
CALL SP_AgregarAlumnoACurso(1004,19); CALL SP_AgregarAlumnoACurso(1005,19);
CALL SP_AgregarAlumnoACurso(1006,19); CALL SP_AgregarAlumnoACurso(1007,19);
CALL SP_AgregarAlumnoACurso(1008,19); CALL SP_AgregarAlumnoACurso(1009,19);
CALL SP_AgregarAlumnoACurso(1012,20); CALL SP_AgregarAlumnoACurso(1013,20);
CALL SP_AgregarAlumnoACurso(1008,20); CALL SP_AgregarAlumnoACurso(1009,20);
CALL SP_AgregarAlumnoACurso(1010,20); CALL SP_AgregarAlumnoACurso(1011,20);
CALL SP_AgregarAlumnoACurso(1018,21); CALL SP_AgregarAlumnoACurso(1019,21);
CALL SP_AgregarAlumnoACurso(1014,21); CALL SP_AgregarAlumnoACurso(1015,21);
CALL SP_AgregarAlumnoACurso(1016,21); CALL SP_AgregarAlumnoACurso(1017,21);
CALL SP_AgregarAlumnoACurso(1000,22); CALL SP_AgregarAlumnoACurso(1001,22);
CALL SP_AgregarAlumnoACurso(1002,22); CALL SP_AgregarAlumnoACurso(1003,22);
CALL SP_AgregarAlumnoACurso(1004,22); CALL SP_AgregarAlumnoACurso(1005,22);
CALL SP_AgregarAlumnoACurso(1000,23); CALL SP_AgregarAlumnoACurso(1001,23);
CALL SP_AgregarAlumnoACurso(1002,23); CALL SP_AgregarAlumnoACurso(1003,23);
CALL SP_AgregarAlumnoACurso(1004,23); CALL SP_AgregarAlumnoACurso(1005,23);
CALL SP_AgregarAlumnoACurso(1006,23); CALL SP_AgregarAlumnoACurso(1007,23);
CALL SP_AgregarAlumnoACurso(1008,23); CALL SP_AgregarAlumnoACurso(1009,23);
CALL SP_AgregarAlumnoACurso(1012,24); CALL SP_AgregarAlumnoACurso(1013,24);
CALL SP_AgregarAlumnoACurso(1014,24); CALL SP_AgregarAlumnoACurso(1015,24);
CALL SP_AgregarAlumnoACurso(1016,24); CALL SP_AgregarAlumnoACurso(1017,24);
CALL SP_AgregarAlumnoACurso(1018,25); CALL SP_AgregarAlumnoACurso(1019,25);
CALL SP_AgregarAlumnoACurso(1000,25); CALL SP_AgregarAlumnoACurso(1001,25);
CALL SP_AgregarAlumnoACurso(1012,26); CALL SP_AgregarAlumnoACurso(1013,26);
CALL SP_AgregarAlumnoACurso(1008,26); CALL SP_AgregarAlumnoACurso(1009,26);
CALL SP_AgregarAlumnoACurso(1010,26); CALL SP_AgregarAlumnoACurso(1011,26);
CALL SP_AgregarAlumnoACurso(1012,27); CALL SP_AgregarAlumnoACurso(1013,27);
CALL SP_AgregarAlumnoACurso(1014,27); CALL SP_AgregarAlumnoACurso(1015,27);
CALL SP_AgregarAlumnoACurso(1016,27); CALL SP_AgregarAlumnoACurso(1017,27);
CALL SP_AgregarAlumnoACurso(1000,28); CALL SP_AgregarAlumnoACurso(1001,28);
CALL SP_AgregarAlumnoACurso(1002,28); CALL SP_AgregarAlumnoACurso(1003,28);
CALL SP_AgregarAlumnoACurso(1004,28); CALL SP_AgregarAlumnoACurso(1005,28);
CALL SP_AgregarAlumnoACurso(1006,28); CALL SP_AgregarAlumnoACurso(1007,28);
CALL SP_AgregarAlumnoACurso(1000,29); CALL SP_AgregarAlumnoACurso(1001,29);
CALL SP_AgregarAlumnoACurso(1002,29); CALL SP_AgregarAlumnoACurso(1003,29);
CALL SP_AgregarAlumnoACurso(1004,29); CALL SP_AgregarAlumnoACurso(1005,29);
CALL SP_AgregarAlumnoACurso(1012,30); CALL SP_AgregarAlumnoACurso(1013,30);
CALL SP_AgregarAlumnoACurso(1014,30); CALL SP_AgregarAlumnoACurso(1015,30);
CALL SP_AgregarAlumnoACurso(1016,30); CALL SP_AgregarAlumnoACurso(1017,30);
CALL SP_AgregarAlumnoACurso(1018,31); CALL SP_AgregarAlumnoACurso(1019,31);
CALL SP_AgregarAlumnoACurso(1006,31); CALL SP_AgregarAlumnoACurso(1007,31);
CALL SP_AgregarAlumnoACurso(1008,31); CALL SP_AgregarAlumnoACurso(1009,31);
CALL SP_AgregarAlumnoACurso(1000,32); CALL SP_AgregarAlumnoACurso(1001,32);
CALL SP_AgregarAlumnoACurso(1002,32); CALL SP_AgregarAlumnoACurso(1003,32);
CALL SP_AgregarAlumnoACurso(1004,32); CALL SP_AgregarAlumnoACurso(1005,32);
CALL SP_AgregarAlumnoACurso(1006,33); CALL SP_AgregarAlumnoACurso(1007,33);
CALL SP_AgregarAlumnoACurso(1002,33); CALL SP_AgregarAlumnoACurso(1003,33);
CALL SP_AgregarAlumnoACurso(1004,33); CALL SP_AgregarAlumnoACurso(1005,33);
CALL SP_AgregarAlumnoACurso(1012,34); CALL SP_AgregarAlumnoACurso(1013,34);
CALL SP_AgregarAlumnoACurso(1014,34); CALL SP_AgregarAlumnoACurso(1015,34);
CALL SP_AgregarAlumnoACurso(1016,34); CALL SP_AgregarAlumnoACurso(1017,34);
CALL SP_AgregarAlumnoACurso(1018,35); CALL SP_AgregarAlumnoACurso(1019,35);
CALL SP_AgregarAlumnoACurso(1000,35); CALL SP_AgregarAlumnoACurso(1001,35);

CALL SP_CargarNotas(1,8,0,5,7,1); CALL SP_CargarNotas(2,4,7,3,9,1);
CALL SP_CargarNotas(3,8,0,1,6,1); CALL SP_CargarNotas(4,3,2,6,0,2);
CALL SP_CargarNotas(5,6,0,6,0,1); CALL SP_CargarNotas(6,10,0,8,0,1); CALL SP_CargarNotas(7,3,8,2,6,1);
CALL SP_CargarNotas(8,1,3,4,2,2); CALL SP_CargarNotas(9,2,6,5,7,1); CALL SP_CargarNotas(10,8,0,3,8,1);
CALL SP_CargarNotas(11,4,5,7,0,2); CALL SP_CargarNotas(12,6,0,3,7,1); CALL SP_CargarNotas(13,8,0,5,5,2);
CALL SP_CargarNotas(14,3,6,5,9,1); CALL SP_CargarNotas(15,9,0,3,7,1); CALL SP_CargarNotas(16,2,3,4,5,2);
CALL SP_CargarNotas(17,3,4,5,6,2); CALL SP_CargarNotas(18,4,5,6,0,2); CALL SP_CargarNotas(19,5,6,7,0,1);
CALL SP_CargarNotas(20,6,0,8,0,1); CALL SP_CargarNotas(21,7,0,9,0,1); CALL SP_CargarNotas(22,8,0,10,0,1);
CALL SP_CargarNotas(23,1,2,3,4,2); CALL SP_CargarNotas(24,2,3,4,5,2); CALL SP_CargarNotas(25,3,4,5,6,2);
CALL SP_CargarNotas(26,4,3,2,1,2); CALL SP_CargarNotas(27,5,4,3,2,2); CALL SP_CargarNotas(28,6,0,4,3,2);
CALL SP_CargarNotas(29,7,0,5,4,2); CALL SP_CargarNotas(30,8,0,6,0,1); CALL SP_CargarNotas(31,9,0,7,0,1);
CALL SP_CargarNotas(32,10,0,9,0,1); CALL SP_CargarNotas(33,5,6,5,6,1); CALL SP_CargarNotas(34,6,0,6,0,1);
CALL SP_CargarNotas(41,7,0,5,6,1); CALL SP_CargarNotas(42,8,0,9,0,1); CALL SP_CargarNotas(43,5,4,5,6,2);
CALL SP_CargarNotas(44,7,0,5,8,1); CALL SP_CargarNotas(49,7,0,5,6,1); CALL SP_CargarNotas(50,3,7,5,6,1);
CALL SP_CargarNotas(51,3,5,5,6,2); CALL SP_CargarNotas(52,7,0,2,9,1); CALL SP_CargarNotas(53,9,0,5,6,1);
CALL SP_CargarNotas(54,1,2,3,4,2); CALL SP_CargarNotas(56,2,3,4,5,2); CALL SP_CargarNotas(57,3,4,5,6,2);
CALL SP_CargarNotas(58,4,5,6,7,2); CALL SP_CargarNotas(59,5,6,7,8,1); CALL SP_CargarNotas(60,6,0,7,0,1);
CALL SP_CargarNotas(61,7,0,8,0,1); CALL SP_CargarNotas(62,8,0,9,0,1); CALL SP_CargarNotas(63,9,0,10,0,1);
CALL SP_CargarNotas(64,10,0,10,0,1); CALL SP_CargarNotas(65,2,3,5,3,2); CALL SP_CargarNotas(66,5,6,5,6,1);
CALL SP_CargarNotas(67,4,5,5,6,2); CALL SP_CargarNotas(68,7,0,2,6,1); CALL SP_CargarNotas(69,2,6,1,6,1);
CALL SP_CargarNotas(70,7,0,8,0,1); CALL SP_CargarNotas(71,4,8,6,0,1); CALL SP_CargarNotas(72,4,3,2,1,2);
CALL SP_CargarNotas(73,5,4,3,2,2); CALL SP_CargarNotas(74,4,5,4,3,2); CALL SP_CargarNotas(75,6,0,5,4,2);
CALL SP_CargarNotas(76,7,0,5,5,2); CALL SP_CargarNotas(77,7,0,5,6,1); CALL SP_CargarNotas(78,8,0,5,3,2);
CALL SP_CargarNotas(79,2,6,2,5,2); CALL SP_CargarNotas(80,7,0,6,0,1); CALL SP_CargarNotas(81,7,0,7,0,1);
CALL SP_CargarNotas(82,8,0,2,6,1); CALL SP_CargarNotas(83,3,4,5,6,2); CALL SP_CargarNotas(84,1,1,1,1,2);
CALL SP_CargarNotas(85,2,2,2,5,2); CALL SP_CargarNotas(86,3,4,5,6,2); CALL SP_CargarNotas(87,7,0,8,0,1);
CALL SP_CargarNotas(88,2,7,5,6,1); CALL SP_CargarNotas(89,9,0,2,8,1); CALL SP_CargarNotas(90,7,0,5,6,1);
CALL SP_CargarNotas(91,9,0,6,0,1); CALL SP_CargarNotas(92,7,0,8,0,1); CALL SP_CargarNotas(93,5,3,5,2,2);
CALL SP_CargarNotas(94,7,0,8,0,1); CALL SP_CargarNotas(95,6,0,5,4,2); CALL SP_CargarNotas(96,10,0,8,0,1);
CALL SP_CargarNotas(97,2,6,1,8,1); CALL SP_CargarNotas(98,2,4,5,7,2); CALL SP_CargarNotas(105,3,6,4,6,1);
CALL SP_CargarNotas(106,7,0,4,6,1); CALL SP_CargarNotas(107,8,0,7,0,1); CALL SP_CargarNotas(108,10,0,10,0,1);
CALL SP_CargarNotas(113,7,0,5,6,1); CALL SP_CargarNotas(114,3,7,4,6,1); CALL SP_CargarNotas(115,1,2,3,4,2);
CALL SP_CargarNotas(116,2,3,4,5,2); CALL SP_CargarNotas(117,3,4,5,6,2); CALL SP_CargarNotas(118,4,5,6,0,2);
CALL SP_CargarNotas(119,5,6,7,0,1); CALL SP_CargarNotas(120,2,7,1,7,1); CALL SP_CargarNotas(121,5,4,5,6,2);
CALL SP_CargarNotas(122,7,0,5,6,1); CALL SP_CargarNotas(123,8,0,4,6,1); CALL SP_CargarNotas(124,7,0,6,0,1);
CALL SP_CargarNotas(125,7,0,5,6,1); CALL SP_CargarNotas(126,8,0,5,4,2); CALL SP_CargarNotas(127,7,0,5,6,1);
CALL SP_CargarNotas(128,9,0,10,0,1); CALL SP_CargarNotas(129,1,4,3,5,2); CALL SP_CargarNotas(130,2,5,4,5,2);
CALL SP_CargarNotas(131,6,0,5,5,2); CALL SP_CargarNotas(132,7,0,4,6,1); CALL SP_CargarNotas(133,3,5,2,6,2);
CALL SP_CargarNotas(134,7,0,5,9,1); CALL SP_CargarNotas(135,6,0,6,0,1); CALL SP_CargarNotas(136,7,0,7,0,1);
CALL SP_CargarNotas(137,8,0,8,0,1); CALL SP_CargarNotas(138,9,0,9,0,1); CALL SP_CargarNotas(139,5,6,5,5,2);
CALL SP_CargarNotas(140,9,0,5,8,1); CALL SP_CargarNotas(141,3,4,3,3,2); CALL SP_CargarNotas(142,7,0,5,6,1);
CALL SP_CargarNotas(143,7,0,3,8,1); CALL SP_CargarNotas(144,8,0,7,0,1); CALL SP_CargarNotas(145,2,2,5,4,2);
CALL SP_CargarNotas(146,3,6,4,5,2); CALL SP_CargarNotas(147,2,7,5,8,1); CALL SP_CargarNotas(148,1,4,3,5,2);
CALL SP_CargarNotas(149,2,8,4,7,1); CALL SP_CargarNotas(150,9,0,6,0,1); CALL SP_CargarNotas(157,10,0,8,0,1);
CALL SP_CargarNotas(158,9,0,7,0,1); CALL SP_CargarNotas(159,2,6,4,8,1); CALL SP_CargarNotas(160,6,0,5,7,1);
CALL SP_CargarNotas(167,2,2,5,4,2); CALL SP_CargarNotas(168,5,4,6,0,2); CALL SP_CargarNotas(169,2,6,4,7,1);
CALL SP_CargarNotas(170,3,2,8,0,2); CALL SP_CargarNotas(171,9,0,6,0,1); CALL SP_CargarNotas(172,7,0,8,0,1);
CALL SP_CargarNotas(173,5,3,5,2,2); CALL SP_CargarNotas(174,7,0,8,0,1); CALL SP_CargarNotas(175,6,0,5,4,2);
CALL SP_CargarNotas(176,10,0,8,0,1); CALL SP_CargarNotas(177,2,6,1,8,1); CALL SP_CargarNotas(178,2,4,5,7,2);
CALL SP_CargarNotas(179,3,6,4,6,1); CALL SP_CargarNotas(180,7,0,4,6,1); CALL SP_CargarNotas(181,8,0,7,0,1);
CALL SP_CargarNotas(182,10,0,10,0,1); CALL SP_CargarNotas(183,7,0,5,6,1); CALL SP_CargarNotas(184,3,7,4,6,1);
CALL SP_CargarNotas(185,1,2,3,4,2); CALL SP_CargarNotas(186,2,2,5,4,2); CALL SP_CargarNotas(193,8,0,5,7,1);
CALL SP_CargarNotas(194,4,7,3,9,1); CALL SP_CargarNotas(195,8,0,1,6,1); CALL SP_CargarNotas(196,3,2,6,0,2);
CALL SP_CargarNotas(197,6,0,6,0,1); CALL SP_CargarNotas(198,10,0,8,0,1); CALL SP_CargarNotas(205,3,8,2,6,1);
CALL SP_CargarNotas(206,1,3,4,2,2); CALL SP_CargarNotas(207,2,6,5,7,1); CALL SP_CargarNotas(208,8,0,3,8,1);
CALL SP_CargarNotas(209,4,5,7,0,2); CALL SP_CargarNotas(210,6,0,3,7,1); CALL SP_CargarNotas(211,8,0,5,5,2);
CALL SP_CargarNotas(212,3,6,5,9,1); CALL SP_CargarNotas(213,9,0,3,7,1); CALL SP_CargarNotas(214,2,3,4,5,2);
CALL SP_CargarNotas(215,3,4,5,6,2); CALL SP_CargarNotas(216,4,5,6,0,2); CALL SP_CargarNotas(217,5,6,7,0,1);
CALL SP_CargarNotas(218,6,0,8,0,1); CALL SP_CargarNotas(219,7,0,9,0,1); CALL SP_CargarNotas(220,8,0,10,0,1);