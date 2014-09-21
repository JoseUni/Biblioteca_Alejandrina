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
	Join LibroGeneral 
	ON LibroGeneral.IDGENERAL = Articulo.IDGENERAL
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
	Join LibroGeneral 
	ON LibroGeneral.IDGENERAL = Articulo.IDGENERAL
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
	Join LibroGeneral 
	ON LibroGeneral.IDGENERAL = Articulo.IDGENERAL
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
	Join LibroGeneral 
	ON LibroGeneral.IDGENERAL = Articulo.IDGENERAL
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
	Join LibroGeneral 
	ON LibroGeneral.IDGENERAL = Articulo.IDGENERAL
	WHERE IDGENERAL = (SELECT IDGENERAL from ArtPrest WHERE PoseeArt = 1) AND
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
	OPEN Rcursor FOR -- Maybe using a second cursor in order to iterate through it looking for all persons 
	SELECT *
	FROM Articulo
	Join LibroGeneral 
	ON LibroGeneral.IDGENERAL = Articulo.IDGENERAL
	WHERE IDGENERAL = (SELECT IDGENERAL from ArtPrest WHERE PoseeArt = 1 AND IDPersona = (SELECT IDPERSONA FROM Persona WHERE Nombre = NombreP)) AND
	TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro')
	ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_L_Prestados;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := Consulta_L_Prestados('P');
--print LibrosP;

CREATE or REPLACE Function Consulta_Top_N --Muestra el top N de libros prestados 
RETURN types.cursorType
AS 
Rcursor types.cursorType;
BEGIN
	OPEN Rcursor FOR
	SELECT IDGENERAL
	FROM (	SELECT IDGENERAL,COUNT(IDGENERAL) 
			FROM ARTPREST
			GROUP BY IDGENERAL
			ORDER BY COUNT(IDGENERAL) DESC)
	WHERE ROWNUM <= (SELECT VALOR FROM PARAMETROS WHERE NOMPARAM = 'TOP');
	--WHERE Ocupado = 1 AND 
	--TipArt = (SELECT Codigo FROM CatTipoArt WHERE TipArt = 'Libro') AND 
	--IDGENERAL = (select IDGENERAL FROM ArtPrest WHERE IDPersona = (SELECT IDPERSONA FROM Persona WHERE Nombre = NombreP))
	--ORDER BY TITULO;
	RETURN Rcursor;
END Consulta_Top_N;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := Consulta_Top_N();
--print LibrosP;

CREATE or REPLACE Function Consulta_P_n_veces_en_m --Muestra los libros prestados n veces en los ultimos m meses 
RETURN types.cursorType
AS 
Rcursor types.cursorType;
temp int;
tempd date;
BEGIN
  SELECT VALOR INTO temp FROM PARAMETROS WHERE NOMPARAM = 'M'; --obtener parametro
  DBMS_OUTPUT.PUT_LINE('Parametro '|| temp);
  tempd := ADD_MONTHS(TO_DATE(TRUNC(sysdate),'dd/mm/yyyy'),-1*temp);
	OPEN Rcursor FOR
      SELECT IDGENERAL 
			FROM ARTPREST
			WHERE TO_DATE(TRUNC(FECHAPRESTAMO),'dd/mm/yyyy') > ADD_MONTHS(TO_DATE(TRUNC(sysdate),'dd/mm/yyyy'),-1*temp)
			GROUP BY IDGENERAL
			HAVING COUNT(IDGENERAL) >= (SELECT VALOR FROM PARAMETROS WHERE NOMPARAM = 'N')
			ORDER BY COUNT(IDGENERAL) DESC;
--	WHERE COUNT(IDGENERAL) >= (SELECT VALOR FROM PARAMETROS WHERE NOMPARAM = 'N');
	RETURN Rcursor;
END Consulta_P_n_veces_en_m;

--El test de la funcion anterior
--var LibrosP refcursor;
--exec :LibrosP := Consulta_P_n_veces_en_m();
--print LibrosP;

CREATE or REPLACE Function Tipo_per(Tipoper VARCHAR) --Devuelve el Codigo del tipo de persona 
RETURN int
AS 
CodigoPer int;
BEGIN
	SELECT Codigo INTO CodigoPer FROM CatTipoPer WHERE TipPer = Tipoper;
	RETURN CodigoPer;
END Tipo_per;

--El test de la funcion anterior
--declare 
--Codigy int;
--begin
--Codigy := Tipo_per('Familiar');
--DBMS_OUTPUT.PUT_LINE('Codigo '|| Codigy);
--end;

CREATE or REPLACE Function Tipo_Art(TipoArti VARCHAR) --Devuelve el Codigo del tipo de Articulo 
RETURN int
AS 
CodigoArt int;
BEGIN
	SELECT Codigo INTO CodigoArt FROM CatTipoArt WHERE TipArt = TipoArti;
	RETURN CodigoArt;
END Tipo_Art;

--El test de la funcion anterior
--declare 
--Codigy int;
--begin
--Codigy := Tipo_Art('Familiar');
--DBMS_OUTPUT.PUT_LINE('Codigo '|| Codigy);
--end;

CREATE or REPLACE Function Tipo_Tel(TipoTel VARCHAR) --Devuelve el Codigo del tipo de Articulo 
RETURN int
AS 
CodigoTel int;
BEGIN
	SELECT Codigo INTO CodigoTel FROM CatTTel WHERE TipTel = TipoTel;
	RETURN CodigoTel;
END Tipo_Tel;

--El test de la funcion anterior
--declare 
--Codigy int;
--begin
--Codigy := Tipo_Art('Familiar');
--DBMS_OUTPUT.PUT_LINE('Codigo '|| Codigy);
--end;

CREATE or REPLACE Function Tipo_Param(TipoParam VARCHAR) --Devuelve el Codigo del tipo de Articulo 
RETURN int
AS 
CodigoParam int;
BEGIN
	SELECT Valor INTO CodigoParam FROM Parametros WHERE NomParam = TipoParam;
	RETURN CodigoParam;
END Tipo_Param;

--El test de la funcion anterior
--declare 
--Codigy int;
--begin
--Codigy := Tipo_Param('Familiar');
--DBMS_OUTPUT.PUT_LINE('Codigo '|| Codigy);
--end;
--#############################################################################################################