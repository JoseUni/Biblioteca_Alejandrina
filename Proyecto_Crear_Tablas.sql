CREATE TABLE Persona (
PNombre 			VARCHAR(20) 	NOT NULL,
PApellido 			VARCHAR(20) 	NOT NULL,
SApellido 			VARCHAR(20) 	NOT NULL,
Relacion_Ocupacion 	VARCHAR(10) 	NOT NULL,
Telefono 			INT 			NOT NULL,
Ttelefono			INT,
Email 				VARCHAR(20) 	NOT NULL, 
NLibros 			VARCHAR(20) 	NOT NULL,
PRIMARY KEY (Email)
);
CREATE TABLE Libro(
Titulo 			VARCHAR(20) 	NOT NULL,
Autores 		VARCHAR(20) 	NOT NULL,
Editorial 		VARCHAR(20) 	NOT NULL,
Edicion 		VARCHAR(20) 	NOT NULL,
Imagen 			INT 			NOT NULL,
Calificacion	INT,
NPrestamos 		VARCHAR(20) 	NOT NULL, 
FechaDePrestamo	DATE 	NOT NULL,
Estado 			VARCHAR(20) 	NOT NULL,
PRIMARY KEY (Titulo) 
);