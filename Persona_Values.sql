INSERT INTO Persona
VALUES ('Emmanuel','Barrantes','Chaves','Familiar',
'88255578','1','emanu.87@gmail.com','13');
INSERT INTO Persona
VALUES ('Kevin','Mendez','Arce','Estudiante',
'22222222','0','Kevin@gmail.com','8');
INSERT INTO Persona
VALUES ('Jose','Alvarado','Chaves','Colega',
'87014233','1','Jose@gmail.com','5');

SELECT NLibros
FROM Persona
WHERE Relacion_Ocupacion='Estudiante';
SELECT NLibros
FROM Persona
WHERE Relacion_Ocupacion='Colega';
SELECT NLibros
FROM Persona
WHERE Relacion_Ocupacion='Familiar';

DELETE FROM Persona
WHERE PNombre='Emmanuel';
DELETE FROM Persona
WHERE PNombre='Jose';
DELETE FROM Persona
WHERE PNombre='Kevin';

