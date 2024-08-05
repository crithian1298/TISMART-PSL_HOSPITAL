-------HABILITAR LA VISUALIZACIÓN DE LA SALIDA ------------------
SET SERVEROUTPUT ON

-------CAMBIAR LA CONFIGURACIÓN COMO SEPARADOR DECIMAL ---------
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';

-----------------------------------------------------------PROCEDIMENTO INSERTAR TABLA HOSPITAL------------------------------------------------------

CREATE OR REPLACE PROCEDURE SP_HOSPITAL_REGISTRAR (
    p_idHospital IN Hospital.idHospital%TYPE,
    p_idDistrito IN Hospital.idDistrito%TYPE,
    p_Nombre IN Hospital.Nombre%TYPE,
    p_Antiguedad IN Hospital.Antiguedad%TYPE,
    p_Area IN Hospital.Area%TYPE,
    p_idSede IN Hospital.idSede%TYPE,
    p_idGerente IN Hospital.idGerente%TYPE,
    p_idCondicion IN Hospital.idCondicion%TYPE,
    p_fechaRegistro IN Hospital.FechaRegistro%TYPE  
) IS
BEGIN
    INSERT INTO Hospital(idHospital, idDistrito, Nombre, Antiguedad, Area, idSede, idGerente, idCondicion, fechaRegistro)
    VALUES (p_idHospital, p_idDistrito, p_Nombre, p_Antiguedad, p_Area, p_idSede, p_idGerente, p_idCondicion, p_fechaRegistro);
  
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: El Hospital con ID ' || p_idHospital || ' ya existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

----------------------------------INSERTAR EN LA TABLA HOSPITAL--------------------------------------------------

BEGIN
    SP_HOSPITAL_REGISTRAR(10,1,'Hospital Central', 10,4.5,1,1,1,SYSTIMESTAMP  );
END;
/



-------------------------------------------------------------PROCEDIMIENTO DE ACTUALIZAR TABLA HOSPITAL--------------------------------------------------

CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ACTUALIZAR (
    p_idHospital IN Hospital.idHospital%TYPE,
    p_idDistrito IN Hospital.idDistrito%TYPE,
    p_Nombre IN Hospital.Nombre%TYPE,
    p_Antiguedad IN Hospital.Antiguedad%TYPE,
    p_Area IN Hospital.Area%TYPE,
    p_idSede IN Hospital.idSede%TYPE,
    p_idGerente IN Hospital.idGerente%TYPE,
    p_idCondicion IN Hospital.idCondicion%TYPE,
    p_fechaRegistro IN Hospital.FechaRegistro%TYPE  
) IS
BEGIN
    UPDATE Hospital
    SET 
         idDistrito=p_idDistrito,
         Nombre = p_Nombre,
         Antiguedad = p_Antiguedad,
         Area = p_Area,
         idSede = p_idSede,
         idGerente = p_idGerente,
         idCondicion = p_idCondicion,
         FechaRegistro = p_fechaRegistro
    WHERE idHospital = p_idHospital;
    --UTILIZANDO ESTRUCTURA DE DATOS y VARIABLE CURSOR PARA ACTUALIZAR ----
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: No se encontró el empleado con ID ' || p_idHospital);
    ELSE 
          DBMS_OUTPUT.PUT_LINE(' El registro con el id '|| p_idHospital ||' se actualizo con exito ');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
-----------------------------ACTUALIZAR LA TABLA HOSPITAL-------------------------------------

BEGIN
    SP_HOSPITAL_ACTUALIZAR(10,1,'Hospital central', 10,8.2,1,1,1,SYSTIMESTAMP  );
END;

---------------------------------------------------------ELIMINAR REGISTRO DE LA TABLA HOSPITAL------------------------------------
CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ELIMINAR (
     p_idHospital IN Hospital.idHospital%TYPE
) IS
BEGIN
    DELETE FROM Hospital
    WHERE idHospital = p_idHospital;
     IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: No se encontró el empleado con ID ' || p_idHospital);
         ELSE 
          DBMS_OUTPUT.PUT_LINE(' El registro ha sido eliminado con exito ');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

------------------------ELIMINAR UN REGISTRO DE LA TABLA HOSPITAL---------------------------


BEGIN
   SP_HOSPITAL_ELIMINAR(11);
END;

--------------------------------------------------------------------LISTA DE LA TABLA HOSPITAL -----------------------------------------------
CREATE OR REPLACE PROCEDURE SP_LISTA_HOSPITALES AS
BEGIN
    FOR rec IN (SELECT idHospital, idDistrito, Nombre, Antiguedad, Area, idSede, idGerente, idCondicion, FechaRegistro
                FROM Hospital
                ORDER BY idHospital) LOOP
        DBMS_OUTPUT.PUT_LINE('idHospital: ' || rec.idHospital || 
                             ', idDistrito: ' || rec.idDistrito || 
                             ', Nombre: ' || rec.Nombre || 
                             ', Antiguedad: ' || rec.Antiguedad || 
                             ', Area: ' || rec.Area || 
                             ', idSede: ' || rec.idSede || 
                             ', idGerente: ' || rec.idGerente || 
                             ', idCondicion: ' || rec.idCondicion || 
                             ', FechaRegistro: ' || rec.FechaRegistro);
    END LOOP;
END SP_LISTA_HOSPITALES;

------------------------------MOSTRAR LA LISTA DE LA TABLA HOSPITAL-------------------------
BEGIN
    SP_LISTA_HOSPITALES;
END;
/

