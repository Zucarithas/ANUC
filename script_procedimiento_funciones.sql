/*==============================================================*/
/* PROCEDIMIENTOS                                       */
/*==============================================================*/
/*Procedimiento 1:
 Obtener el total de personas registradas en una vereda dada:*/
DROP PROCEDURE IF EXISTS ObtenerTotalPersonasEnVereda;
DELIMITER //
CREATE PROCEDURE ObtenerTotalPersonasEnVereda(IN veredaId INT, OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total
    FROM persona
    WHERE id_vereda = veredaId;
END //
DELIMITER ;

/*Procedimiento 2:
  Actualizar el estado de un proyecto dado:*/
DROP PROCEDURE IF EXISTS ActualizarEstadoProyecto;
DELIMITER //
CREATE PROCEDURE ActualizarEstadoProyecto(IN proyectoId INT, IN nuevoEstado VARCHAR(100))
BEGIN
    UPDATE proyecto
    SET estado = nuevoEstado
    WHERE idProyecto = proyectoId;
END //
DELIMITER ;

/*Procedimiento 3:
  Insertar una nueva finca para una persona dada:*/
DROP PROCEDURE IF EXISTS InsertarFincaPersona;
DELIMITER //
CREATE PROCEDURE InsertarFincaPersona(IN personaId INT, IN fincaTipo VARCHAR(3), IN nombreFinca VARCHAR(50), IN area VARCHAR(50), IN suelosTipo VARCHAR(50))
BEGIN
    INSERT INTO finca (id_persona, finca, nombre_finca, area, suelos_tipo)
    VALUES (personaId, fincaTipo, nombreFinca, area, suelosTipo);
END //
DELIMITER ;

/*Procedimiento 4:
  Eliminar un proyecto y sus registros asociados dado:*/
DROP PROCEDURE IF EXISTS EliminarProyecto;
DELIMITER //
CREATE PROCEDURE EliminarProyecto(IN proyectoId INT)
BEGIN
    DELETE FROM proyecto_persona
    WHERE id_proyecto = proyectoId;

    DELETE FROM proyecto_vereda
    WHERE id_proyecto = proyectoId;

    DELETE FROM proyecto
    WHERE idProyecto = proyectoId;
END //
DELIMITER ;

/*Procedimiento 5:
  Obtener la lista de proyectos activos en una vereda dada:*/
DROP PROCEDURE IF EXISTS ObtenerProyectosActivosEnVereda;
DELIMITER //
CREATE PROCEDURE ObtenerProyectosActivosEnVereda(IN veredaId INT)
BEGIN
    SELECT p.idProyecto, p.estado, p.fechaInicio, p.rubro, p.aporte, p.observaciones
    FROM proyecto p
    INNER JOIN proyecto_vereda pv ON p.idProyecto = pv.id_proyecto
    WHERE pv.id_vereda = veredaId
    AND p.estado = 'Activo';
END //
DELIMITER ;

/*==============================================================*/
/* FUNCIONES				                                    */
/*==============================================================*/
/*Funcion 1:
  Obtener la cantidad de proyectos en los que participa una persona dada:*/
DROP FUNCTION IF EXISTS ContarProyectosPersona;
DELIMITER //
CREATE FUNCTION ContarProyectosPersona(personaId INT) RETURNS INT
deterministic
BEGIN
    DECLARE contador INT;
    SELECT COUNT(*) INTO contador
    FROM proyecto_persona
    WHERE id_persona = personaId;
    RETURN contador;
END //
DELIMITER ;

/*Funcion 2:
  Calcular el promedio de edad de las personas en una vereda dada:*/
DROP FUNCTION IF EXISTS PromedioEdadVereda;
DELIMITER //
CREATE FUNCTION PromedioEdadVereda(veredaId INT) RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(edad) INTO promedio
    FROM persona
    WHERE id_vereda = veredaId;
    RETURN promedio;
END //
DELIMITER ;

/*Funcion 3:
  Obtener el nombre completo de una persona a partir de su identificación dada:*/
DROP FUNCTION IF EXISTS ObtenerNombrePersona;
DELIMITER //
CREATE FUNCTION ObtenerNombrePersona(identificacion INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nombreCompleto VARCHAR(100);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombreCompleto
    FROM persona
    WHERE identificacion = identificacion;
    RETURN nombreCompleto;
END //
DELIMITER ;

/*Funcion 4:
  Verificar si una finca existe para una persona determinada:*/
DROP FUNCTION IF EXISTS ExisteFincaPersona;
DELIMITER //
CREATE FUNCTION ExisteFincaPersona(personaId INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE existe BOOLEAN;
    SELECT COUNT(*) INTO existe
    FROM finca
    WHERE id_persona = personaId;
    RETURN existe;
END //
DELIMITER ;

/*Funcion 5:
  Obtener el nombre de la vereda a partir de su ID:*/
DROP FUNCTION IF EXISTS ObtenerNombreVereda;
DELIMITER //
CREATE FUNCTION ObtenerNombreVereda(veredaId INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE nombreVereda VARCHAR(50);
    SELECT nombre INTO nombreVereda
    FROM vereda
    WHERE idVereda = veredaId;
    RETURN nombreVereda;
END //
DELIMITER ;