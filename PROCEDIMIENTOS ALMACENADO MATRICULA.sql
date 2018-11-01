#PROCEDIMIENTO BUSCAR

DELIMITER $$

CREATE DEFINER=`boot`@`localhost` PROCEDURE `Buscar_Matriculas` (IN `_Cod_Persona` VARCHAR(20))  begin 
	select Cod_Persona, Fecha_Matricula,Repetir_Grado,Condicion_matricula,Situacion_matricula,Tipo_procedencia, Observaciones, Cod_Estudiante, Cod_Matricula, Estado_matriculas, Descripciones_IE, Estado_matricula,Cod_Secciones,Cod_Grados from matriculas
    where Cod_Persona= _Cod_Persona;
end$$

#PROCEDIMIENTO ELIMINAR 
DELIMITER $$
CREATE DEFINER=`boot`@`localhost` PROCEDURE `eliminar_matriculas` (IN `_Cod_Persona` INT(11))  begin
delete
from
matriculas
where
Cod_Persona=_Cod_Persona;
end$$

# PROCEDIMIENTO LISTAR 
DELIMITER $$
CREATE DEFINER=`boot`@`localhost` PROCEDURE `Listar_Matriculas` ()  begin 
	select  Cod_Persona, Fecha_Matricula,Repetir_Grado,Condicion_matricula,Situacion_matricula,Tipo_procedencia, Observaciones, Cod_Estudiante, Cod_Matricula, Estado_matriculas, Descripciones_IE, Estado_matricula,Cod_Secciones,Cod_Grados from matriculas
    where estado='1';
end$$

# PROCEDIMIENTO REGISTRAR
DELIMITER $$
CREATE DEFINER=`boot`@`localhost` PROCEDURE `registrar_matriculas` (IN `_Cod_Persona` INT(11), IN `_Fecha_Matricula` DATE, IN `_Repetir_grado` VARCHAR(10), IN `_Condicion_matricula` VARCHAR(20), IN `_Situacion_matricula` VARCHAR(30), IN `_Tipo_procedencia` VARCHAR(30), IN `_Observaciones` VARCHAR(80), IN `_Cod_Estudiante` CHAR(14), IN `_Cod_Matricula` INT(11), IN `_Estado_matricula` VARCHAR(20), IN `_Descripcion_IE` VARCHAR(50), IN `_Cod_Secciones` INT(11), IN `_Cod_Grados` INT(11))  BEGIN 
	INSERT INTO MATRICULAS
            (Cod_Persona, 
            Fecha_Matricula,
            Repetir_grado,
            Condicion_matricula,
            Situacion_matricula,
            Tipo_procedencia, 
            Observaciones, 
            Cod_Estudiante,
            Cod_Matricula,
            Estado_matricula,
            Descripcion_IE, 
            Cod_Secciones,
            Cod_Grados) 
VALUES (
	_Cod_Persona,
    _Fecha_Matricula,
    _Repetir_grado,
    _Condicion_matricula,
    _Situacion_matricula,
    _Tipo_procedencia,
    _Observaciones,
    _Cod_Estudiante,
    _Cod_Matricula,
    _Estado_matricula,
    _Descripcion_IE,
    _Cod_Secciones,
    _Cod_Grados
    
    );
END$$