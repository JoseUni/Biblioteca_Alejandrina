--Funciones
create or replace package types 
as 
    type cursorType is ref cursor; 
end; 
CREATE or REPLACE Function Consulta_Libros --Consulta todos los Libros
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT *
	FROM Articulo
	WHERE TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro')
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_Libros;

--El test de la funcion anterior
--var Libros refcursor;
--exec :Libros := consulta_libros();
--print Libros;

CREATE or REPLACE Function Consulta_Libros_T(TituloFunc VARCHAR) --Consulta de Libros por Titulo
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT *
	FROM Articulo
	WHERE TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro') AND Titulo = TituloFunc
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_Libros_T;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := consulta_libros_t('The life od pi');
--print LibrosP;

CREATE or REPLACE Function Consulta_Libros_E(EditorialFunc VARCHAR) --Consulta de Libros por Editorial
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT *
	FROM Articulo
	WHERE IDGENERAL =(SELECT IDGENERAL FROM LibroGeneral WHERE Editorial = EditorialFunc) AND
	TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro')
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_Libros_E;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := consulta_libros_E('D');
--print LibrosP;

CREATE or REPLACE Function Consulta_Libros_A(AutorFunc VARCHAR) --Consulta de Libros por Autor
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT *
	FROM Articulo
	WHERE IDGENERAL =(SELECT IDGENERAL FROM Autor WHERE Autor = AutorFunc) AND
	TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro')
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_Libros_A;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := consulta_libros_E('F');
--print LibrosP;


CREATE or REPLACE Function Consulta_Libros_NP --Consulta de Libros No Prestados
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT *
	FROM Articulo
	WHERE Ocupado = 0 AND
	TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro')
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_Libros_NP;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := Consulta_Libros_NP();
--print LibrosP;


CREATE or REPLACE Function Consulta_L_Prestados(NombreP VARCHAR) --Buscar libros prestados por persona, hay que arreglar para cuando haya mas de 1 persona con el mismo nombre
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT *
	FROM Articulo
	WHERE Ocupado = 1 AND 
	TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro') AND 
	IDGENERAL = (select IDGENERAL FROM ArtPrest WHERE IDPersona = (SELECT IDPERSONA FROM Persona WHERE Nombre = NombreP))
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_L_Prestados;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := Consulta_L_Prestados('P');
--print LibrosP;


--#############################################################################################################

CREATE or REPLACE PROCEDURE Consulta_L_N_Prestados()
AS 
BEGIN
	SELECT *
	FROM Articulo
	ORDER BY TITULO
	WHERE Ocupado = 1 AND TipArt = (SELECT Codigo FROM CatTipoArt WHERE TopArt = "Libro");
END;

CREATE or REPLACE PROCEDURE Consulta_top_n()
AS 
BEGIN
	CREATE VIEW NumPrest As
		SELECT ID_GENERAL,COUNT(ID_GENERAL)
		FROM ArtPrest;
	SELECT *
	FROM (SELECT * FROM NumPrest ORDER BY COUNT(ID_GENERAL)
	WHERE ROWNUM <= (SELECT VALOR FROM Parametro WHERE NomParam = "Top");
	DROP VIEW NumPrest;
END;

SELECT *
FROM (SELECT * FROM EMPLOYEE ORDER BY SALARIO DESC)
WHERE ROWNUM <= 3;


CREATE or REPLACE PROCEDURE Consulta_P_n_veces_en_m()
AS 
BEGIN
	CREATE VIEW NumPrest As
		SELECT ID_GENERAL,COUNT(ID_GENERAL)
		FROM ArtPrest;
	SELECT *
	FROM (SELECT * FROM NumPrest ORDER BY COUNT(ID_GENERAL)
	WHERE ROWNUM <= (SELECT VALOR FROM Parametro WHERE NomParam = "Top");
	DROP VIEW NumPrest;
END;

SELECT *
FROM (SELECT * FROM EMPLOYEE ORDER BY SALARIO DESC)
WHERE ROWNUM <= 3;
