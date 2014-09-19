--Parametros
INSERT INTO Parametros(NomParam,Valor) --Dias de Presstamos permitidos
Values ('DiasPrest',5);
INSERT INTO Parametros(NomParam,Valor)--Los dias de tolerancia despues de vencido el prestamo
Values ('DiasTole',2);
INSERT INTO Parametros(NomParam,Valor)--Dias de alerta despues de los dias de tolerancia
Values ('DiasAlert',1);
INSERT INTO Parametros(NomParam,Valor)--Top de libros mas prestados
Values ('TOP',10);
INSERT INTO Parametros(NomParam,Valor)--Libros prestados N veces en M meses
Values ('N',3);
INSERT INTO Parametros(NomParam,Valor)--Libros prestados N veces en M meses
Values ('M',6);

--Catalogo Telefono
INSERT INTO CatTel(TipTel,Codigo)--Codigo de tipo de telefono casa
Values ('Casa',0);
INSERT INTO CatTel(TipTel,Codigo)--Codigo de tipo de telefono Celular
Values ('Celular',1);

--Catalogo Persona
INSERT INTO CatTipoPer(TipPer,Codigo)--Codigo de tipo de persona Estudiante
Values ('Estudiante',0);
INSERT INTO CatTipoPer(TipPer,Codigo)--Codigo de tipo de persona Colega
Values ('Colega',1);
INSERT INTO CatTipoPer(TipPer,Codigo)--Codigo de tipo de persona Familiar
Values ('Familiar',2);

--Catalogo Articulo CatTipoArt
INSERT INTO CatTipoArt(TipArt,Codigo)--Codigo de tipo de persona Libro
Values ('Libro',0);
INSERT INTO CatTipoArt(TipArt,Codigo)--Codigo de tipo de persona Pelicula
Values ('Pelicula',1);
INSERT INTO CatTipoArt(TipArt,Codigo)--Codigo de tipo de persona Revista
Values ('Revista',2);