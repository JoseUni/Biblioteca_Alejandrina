
CREATE TABLE Parametros (
NomParam	VARCHAR(10) NOT NULL,
Valor		int	NOT NULL,
--using index
--tablespace ema_ind pctfree 20
--storage (initial 10k next 10k pctincrease 0) 
PRIMARY KEY (NomParam)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

Create Table CatTipoPer (
TipPer  Varchar(10) NOT NULL UNIQUE,
Codigo  int NOT NULL,
--using index
--tablespace ema_ind pctfree 20
--storage (initial 10k next 10k pctincrease 0) 
PRIMARY KEY (Codigo)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

Create Table CatTel (
TipTel  Varchar(7) NOT NULL UNIQUE,
Codigo  number(1) NOT NULL,
--using index
--tablespace ema_ind pctfree 20
--storage (initial 10k next 10k pctincrease 0) 
PRIMARY KEY (Codigo)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE Persona (
Nombre	VARCHAR(20)	NOT NULL,
PApellido	VARCHAR(20) 	NOT NULL,
SApellido	VARCHAR(20)	NOT NULL,
IDPersona	int	NOT NULL,
TipPer int 	Not NULL,
PRIMARY KEY (IDPersona),
CONSTRAINT Persona_TipPer_nn FOREIGN KEY(TipPer) REFERENCES CatTipoPer(Codigo)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

Create Table Email (
IDPersona	int	NOT NULL,
Correo	VARCHAR(20),
PRIMARY KEY (Correo),
CONSTRAINT Email_IDPresona_nn FOREIGN KEY(IDPersona) REFERENCES Persona(IDPersona)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE TELEFONO (
TELEFONO int	NOT NULL,
IDPersona int 	NOT NULL,
TIPTEL	int	NOT NULL,
PRIMARY KEY (TELEFONO),
CONSTRAINT TELEFONO_IDPersona_nn FOREIGN KEY(IDPersona) REFERENCES Persona(IDPersona),
CONSTRAINT TELEFONO_TIPTEL_nn FOREIGN KEY(TIPTEL) REFERENCES CatTel(Codigo)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

Create Table CatTipoArt (
TipArt  Varchar(10) NOT NULL UNIQUE,
Codigo  int NOT NULL,
--using index
--tablespace ema_ind pctfree 20
--storage (initial 10k next 10k pctincrease 0) 
PRIMARY KEY (Codigo)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE Articulo (
Titulo	VARCHAR(20)	NOT NULL,
Calificacion	int 	NOT NULL,
CantidadPrest	int	NOT NULL,
IDGeneral	int	NOT NULL,
ImagenPortad BFILE 	Not NULL,
TipArt	int	NOT NULL,
Ocupado Number(1) NOT NULL,
PRIMARY KEY (IDGeneral),
CONSTRAINT Articulo_TipArt_nn FOREIGN KEY(TipArt) REFERENCES CatTipoArt(Codigo)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE ArtEspecifico (
IDGeneral	int	NOT NULL,
IDEspecifico	int NOT NULL,
PRIMARY KEY (IDEspecifico),
CONSTRAINT ArtEspecifico_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE ArtPrest (
IDGeneral int	NOT NULL,
IDEspecifico int 	NOT NULL,
FechaPrestamo	DATE	NOT NULL,
FechaDevol	DATE	NOT NULL,
IDPersona int	NOT NULL,
PRIMARY KEY (IDEspecifico),
CONSTRAINT ARTPrest_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral),
CONSTRAINT ARTPrest_IDEspecifico_nn FOREIGN KEY(IDEspecifico) REFERENCES ArtEspecifico(IDEspecifico),
CONSTRAINT ARTPrest_IDPersona_nn FOREIGN KEY(IDPersona) REFERENCES Persona(IDPersona)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE RevistaGeneral (
IDGeneral int	NOT NULL,
FechaSalida	DATE	NOT NULL,
Editorial	VARCHAR(20) NOT NULL,
PRIMARY KEY (IDGeneral),
CONSTRAINT REvistaGeneral_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE LibroGeneral (
IDGeneral int	NOT NULL,
Editorial	VARCHAR(20)	NOT NULL,
Edicion	VARCHAR(20) NOT NULL,
PRIMARY KEY (IDGeneral),
CONSTRAINT LibroGeneral_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE PeliculaGeneral (
IDGeneral int	NOT NULL,
FechaEstreno	DATE	NOT NULL,
Empresa	VARCHAR(20) NOT NULL,
PRIMARY KEY (IDGeneral),
CONSTRAINT PeliculaGeneral_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE Autor (
IDGeneral	int	NOT NULL,
Autor	VARCHAR(30) NOT NULL,
PRIMARY KEY (Autor),
CONSTRAINT Autor_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

CREATE TABLE Director (
IDGeneral	int	NOT NULL,
Director	VARCHAR(30) NOT NULL,
PRIMARY KEY (Director),
CONSTRAINT Director_IDGeneral_nn FOREIGN KEY(IDGeneral) REFERENCES Articulo(IDGeneral)
)
Tablespace ema_data
STORAGE (INITIAL 6144
NEXT 6144
MINEXTENTS 1
MAXEXTENTS 5
);

drop table ArtPrest;
drop table RevistaGeneral;
drop table LibroGeneral;
drop table PeliculaGeneral;
drop table Autor;
drop table Director;
drop table ArtEspecifico;
drop table Articulo;
drop table CatTipoArt;
drop table TELEFONO;
drop table Email;
drop table Persona;
drop table CatTel;
drop table CatTipoPer;
drop table Parametros;







