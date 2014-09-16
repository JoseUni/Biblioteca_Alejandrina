--Persona
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Emmanuel','Barrantes','Chaves',incr_persona_ID.NextVal,2);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (88255578,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('emanu.87@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Jose','Perez','JP15',incr_Persona_ID.NextVal,1);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (86548907,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('JP15@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Joel','Campbell','JC12',incr_Persona_ID.NextVal,0);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (85413276,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('JC12@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Roy','Miller','RM.00',incr_Persona_ID.NextVal,2);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (80034861,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('RM.00@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Bryan','Ruiz','BR10',incr_Persona_ID.NextVal,2);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (88330689,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('BR10@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Patrcick','Pemberton','PB1',incr_Persona_ID.NextVal,1);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (81568945,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('PB1@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Keylor','Navas','KN13',incr_Persona_ID.NextVal,0);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (68255578,incr_persona_ID.currval,'0');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('KN13@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Yeltsin','Tejeda','YT15',incr_Persona_ID.NextVal,0);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (86017722,incr_persona_ID.currval,'1');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('YT15@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Jonny','Acosta','JA12',incr_Persona_ID.NextVal,1);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (60748923,incr_persona_ID.currval,'0');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('JA12@gmail.com',incr_persona_ID.currval);
INSERT INTO Persona (NOMBRE,PAPELLIDO,SAPELLIDO,IDPersona,TipPer )
VALUES ('Marco','Urena','MU21',incr_Persona_ID.NextVal,2);
INSERT INTO Telefono (Telefono,IDPersona,TIPTEL)
VALUES (53219089,incr_persona_ID.currval,'0');
INSERT INTO EMAIL (Correo,IDPersona)
Values ('MU21@gmail.com',incr_persona_ID.currval);

--Otras Pruebas

--Insertar personas

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('A','B','C',1,2);

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('D','E','F',2,2);

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('G','H','I',3,0);

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('J','K','L',4,1);

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('M','N','O',5,2);

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('P','Q','R',6,0);

INSERT INTO PERSONA (NOMBRE, PAPELLIDO, SAPELLIDO,IDPERSONA,TIPPER)
VALUES ('S','T','U',7,1);

--Insertar articulos
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('Carrera po', incr_articulo_ID_general.NextVal,9,0,0,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('The life od pi', incr_articulo_ID_general.NextVal,100,0,0,1);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('Marshal D teach', incr_articulo_ID_general.NextVal,19,0,1,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('q', incr_articulo_ID_general.NextVal,11,0,2,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('w', incr_articulo_ID_general.NextVal,67,0,1,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('e', incr_articulo_ID_general.NextVal,45,0,0,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('r', incr_articulo_ID_general.NextVal,89,0,2,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('t', incr_articulo_ID_general.NextVal,34,0,0,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('y', incr_articulo_ID_general.NextVal,90,0,1,0);
INSERT INTO articulo (TITULO,IDGENERAL,CALIFICACION,CANTIDADPREST,TIPART,OCUPADO)
VALUES ('u', incr_articulo_ID_general.NextVal,64,0,2,0);

INSERT INTO autor (IDGENERAL, AUTOR)
VALUES (33, 'C');
INSERT INTO autor (IDGENERAL, AUTOR)
VALUES (34, 'D');
INSERT INTO autor (IDGENERAL, AUTOR)
VALUES (35, 'E');
INSERT INTO autor (IDGENERAL, AUTOR)
VALUES (36, 'F');
INSERT INTO autor (IDGENERAL, AUTOR)
VALUES (37, 'G');
INSERT INTO autor (IDGENERAL, AUTOR)
VALUES (33, 'H');

INSERT INTO librogeneral (IDGENERAL, EDITORIAL, EDICION)
VALUES (33,'A','Z');
INSERT INTO librogeneral (IDGENERAL, EDITORIAL, EDICION)
VALUES (34,'B','Y');
INSERT INTO librogeneral (IDGENERAL, EDITORIAL, EDICION)
VALUES (35,'C','X');
INSERT INTO librogeneral (IDGENERAL, EDITORIAL, EDICION)
VALUES (36,'D','W');
INSERT INTO librogeneral (IDGENERAL, EDITORIAL, EDICION)
VALUES (38,'E','V');
INSERT INTO librogeneral (IDGENERAL, EDITORIAL, EDICION)
VALUES (37,'F','U');


INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (31,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (32,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (33,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (34,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (35,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (36,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (37,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (38,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (39,incr_articulo_ID_especifico.NextVal);
INSERT INTO ArtEspecifico (IDGeneral,IDEspecifico)
VALUES (40,incr_articulo_ID_especifico.NextVal);

INSERT INTO ARTPREST (IDGENERAL,IDESPECIFICO,FECHAPRESTAMO,FECHADEVOL,IDPERSONA)
VALUES (33,3,'12-NOV-2013','19-DEC-2014',3);
INSERT INTO ARTPREST (IDGENERAL,IDESPECIFICO,FECHAPRESTAMO,FECHADEVOL,IDPERSONA)
VALUES (34,4,'12-NOV-2013','19-DEC-2014',4);
INSERT INTO ARTPREST (IDGENERAL,IDESPECIFICO,FECHAPRESTAMO,FECHADEVOL,IDPERSONA)
VALUES (35,5,'12-NOV-2013','19-DEC-2014',5);
INSERT INTO ARTPREST (IDGENERAL,IDESPECIFICO,FECHAPRESTAMO,FECHADEVOL,IDPERSONA)
VALUES (36,6,'12-NOV-2013','19-DEC-2014',6);
INSERT INTO ARTPREST (IDGENERAL,IDESPECIFICO,FECHAPRESTAMO,FECHADEVOL,IDPERSONA)
VALUES (37,7,'12-NOV-2013','19-DEC-2014',7);

UPDATE ARTICULO 
SET OCUPADO = 1
WHERE IDGENERAL = 33;
UPDATE ARTICULO 
SET OCUPADO = 1
WHERE IDGENERAL = 34;
UPDATE ARTICULO 
SET OCUPADO = 1
WHERE IDGENERAL = 35;
UPDATE ARTICULO 
SET OCUPADO = 1
WHERE IDGENERAL = 36;
UPDATE ARTICULO 
SET OCUPADO = 1
WHERE IDGENERAL = 37;

