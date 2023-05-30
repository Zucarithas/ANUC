/*==============================================================*/
/* Table: VALORES ADICIONALES                                   */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_valoresAdicionales_insert;
CREATE TRIGGER trg_valoresAdicionales_insert
AFTER INSERT ON valoresAdicionales
FOR EACH ROW
BEGIN
    -- Acciones a realizar después de la inserción
END;

DROP TRIGGER IF EXISTS trg_valoresAdicionales_update;
CREATE TRIGGER trg_valoresAdicionales_update
AFTER UPDATE ON valoresAdicionales
FOR EACH ROW
BEGIN
    -- Acciones a realizar después de la inserción
END;

DROP TRIGGER IF EXISTS trg_valoresAdicionales_delete;
CREATE TRIGGER trg_valoresAdicionales_delete
BEFORE DELETE ON valoresAdicionales
FOR EACH ROW
BEGIN
    -- Acciones a realizar después de la inserción
END;

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_municipio;
DELIMITER //
CREATE TRIGGER trg_insert_municipio
BEFORE INSERT ON municipio
FOR EACH ROW
BEGIN
    DECLARE count_names INT;
    
    SET count_names = (SELECT COUNT(*) FROM municipio WHERE LOWER(nombre) = LOWER(NEW.nombre));
    
    IF count_names > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El nombre del municipio ya existe.';
    END IF;
    
    SET NEW.nombre = UPPER(NEW.nombre);
END;
//

DROP TRIGGER IF EXISTS trg_update_municipio;
DELIMITER //
CREATE TRIGGER trg_update_municipio
AFTER UPDATE ON municipio
FOR EACH ROW
BEGIN
    -- Actualizar registros relacionados en la tabla "vereda"
    UPDATE vereda SET id_municipio = NEW.idMunicipio WHERE id_municipio = OLD.idMunicipio;
    
    -- Actualizar registros relacionados en la tabla "tierra"
    UPDATE tierra SET id_municipio = NEW.idMunicipio WHERE id_municipio = OLD.idMunicipio;
    
    -- Actualizar registros relacionados en la tabla "persona"
    UPDATE persona SET id_vereda = (SELECT idVereda FROM vereda WHERE id_municipio = NEW.idMunicipio) WHERE id_vereda IN (SELECT idVereda FROM vereda WHERE id_municipio = OLD.idMunicipio);
    
    -- Actualizar registros relacionados en la tabla "proyecto_vereda"
    UPDATE proyecto_vereda SET id_vereda = (SELECT idVereda FROM vereda WHERE id_municipio = NEW.idMunicipio) WHERE id_vereda IN (SELECT idVereda FROM vereda WHERE id_municipio = OLD.idMunicipio);
END;
//

DROP TRIGGER IF EXISTS trg_delete_municipio;
DELIMITER //
CREATE TRIGGER trg_delete_municipio
BEFORE DELETE ON municipio
FOR EACH ROW
BEGIN
    -- Eliminar registros relacionados en la tabla "vereda"
    DELETE FROM vereda WHERE id_municipio = OLD.idMunicipio;    
END;
//

/*==============================================================*/
/* Table: VEREDA                                                */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_vereda;
DELIMITER //
CREATE TRIGGER trg_insert_vereda
BEFORE INSERT ON vereda
FOR EACH ROW
BEGIN
    DECLARE last_two_chars VARCHAR(2);
    
    SET last_two_chars = RIGHT(NEW.area, 2);
    
    IF last_two_chars != 'm²' THEN
        SET NEW.area = CONCAT(NEW.area, 'm²');
    END IF;
END;
//

DROP TRIGGER IF EXISTS trg_update_vereda;
DELIMITER //
CREATE TRIGGER trg_update_vereda
AFTER UPDATE ON vereda
FOR EACH ROW
BEGIN
    -- Actualizar registros relacionados en la tabla "tierra"
    UPDATE tierra SET id_vereda = NEW.idVereda WHERE id_vereda = OLD.idVereda;
    
    -- Actualizar registros relacionados en la tabla "persona"
    UPDATE persona SET id_vereda = NEW.idVereda WHERE id_vereda = OLD.idVereda;
    
    -- Actualizar registros relacionados en la tabla "proyecto_vereda"
    UPDATE proyecto_vereda SET id_vereda = NEW.idVereda WHERE id_vereda = OLD.idVereda;
END;
//

DROP TRIGGER IF EXISTS trg_delete_vereda;
DELIMITER //
CREATE TRIGGER trg_delete_vereda
BEFORE DELETE ON vereda
FOR EACH ROW
BEGIN
    -- Eliminar registros relacionados en la tabla "tierra"
    DELETE FROM tierra WHERE id_vereda = OLD.idVereda;
    
    -- Eliminar registros relacionados en la tabla "persona"
    DELETE FROM persona WHERE id_vereda = OLD.idVereda;
    
    -- Eliminar registros relacionados en la tabla "proyecto_vereda"
    DELETE FROM proyecto_vereda WHERE id_vereda = OLD.idVereda;
END;
//

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_verificar_identificacion;
DELIMITER //
CREATE TRIGGER trg_verificar_identificacion
BEFORE INSERT ON persona
FOR EACH ROW
BEGIN
    DECLARE count_identificacion INT;
    
    SET count_identificacion = (SELECT COUNT(*) FROM persona WHERE identificacion = NEW.identificacion);
    
    IF count_identificacion > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La identificación ya existe.';
    END IF;
END;
//

DROP TRIGGER IF EXISTS trg_update_persona;
DELIMITER //
CREATE TRIGGER trg_update_persona
AFTER UPDATE ON persona
FOR EACH ROW
BEGIN
    -- Actualizar registros relacionados en la tabla "finca"
    UPDATE finca SET id_persona = NEW.idPersona WHERE id_persona = OLD.idPersona;
    
    -- Actualizar registros relacionados en la tabla "proyecto_persona"
    UPDATE proyecto_persona SET id_persona = NEW.idPersona WHERE id_persona = OLD.idPersona;
END;
//

DROP TRIGGER IF EXISTS trg_delete_persona;
DELIMITER //
CREATE TRIGGER trg_delete_persona
BEFORE DELETE ON persona
FOR EACH ROW
BEGIN
    -- Eliminar registros relacionados en la tabla "finca"
    DELETE FROM finca WHERE id_persona = OLD.idPersona;
    
    -- Eliminar registros relacionados en la tabla "proyecto_persona"
    DELETE FROM proyecto_persona WHERE id_persona = OLD.idPersona;
END;
//

/*==============================================================*/
/* Table: TIERRA                                                */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_tierra;
DELIMITER //
CREATE TRIGGER trg_insert_tierra
BEFORE INSERT ON tierra
FOR EACH ROW
BEGIN
    DECLARE last_two_chars VARCHAR(2);
    
    SET last_two_chars = RIGHT(NEW.Tierra, 2);
    
    IF last_two_chars != 'm²' THEN
        SET NEW.Tierra = CONCAT(NEW.Tierra, 'm²');
    END IF;
END;
//

DROP TRIGGER IF EXISTS trg_validar_tierra;
DELIMITER //
CREATE TRIGGER trg_validar_tierra
BEFORE UPDATE ON tierra
FOR EACH ROW
BEGIN
    DECLARE count_tierra INT;
    
    SET count_tierra = (SELECT COUNT(*) FROM tierra WHERE id_vereda = NEW.id_vereda AND id_municipio = NEW.id_municipio);
    
    IF count_tierra > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La combinación de id_vereda e id_municipio ya existe en otro registro.';
    END IF;
END;
//

/*==============================================================*/
/* Table: FINCA                                                 */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_finca;
DELIMITER //
CREATE TRIGGER trg_insert_finca
BEFORE INSERT ON finca
FOR EACH ROW
BEGIN
    DECLARE last_two_chars VARCHAR(2);
    
    SET last_two_chars = RIGHT(NEW.area, 2);
    
    IF last_two_chars != 'm²' THEN
        SET NEW.area = CONCAT(NEW.area, 'm²');
    END IF;
END;
//

DROP TRIGGER IF EXISTS trg_verificar_finca_existente;
DELIMITER //
CREATE TRIGGER trg_verificar_finca_existente
BEFORE UPDATE ON finca
FOR EACH ROW
BEGIN
    IF NEW.finca = 'Si' AND EXISTS (SELECT 1 FROM finca WHERE id_persona = NEW.id_persona AND finca = 'Si' AND id_persona <> NEW.id_persona) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Ya existe una finca para esta persona.';
    END IF;
END;
//

DROP TRIGGER IF EXISTS trg_mostrar_fincas_si;
DELIMITER //

CREATE TRIGGER trg_mostrar_fincas_si
AFTER DELETE ON finca
FOR EACH ROW
BEGIN
    DECLARE count_fincas_si INT;
    
    SET count_fincas_si = (SELECT COUNT(*) FROM finca WHERE finca = 'Si');
    
    INSERT INTO resultados_fincas_si (mensaje) VALUES (CONCAT('Quedan ', count_fincas_si, ' fincas en estado "Si".')); 
END;
//

DELIMITER ;

/*==============================================================*/
/* Table: PROYECTO                                             */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_proyecto
DELIMITER //
CREATE TRIGGER trg_insert_proyecto
BEFORE INSERT ON proyecto
FOR EACH ROW
BEGIN
    SET NEW.fechaInicio = CURDATE();
END;
//

DROP TRIGGER IF EXISTS trg_delete_proyecto;
DELIMITER //
CREATE TRIGGER trg_delete_proyecto
BEFORE DELETE ON proyecto
FOR EACH ROW
BEGIN
    -- Eliminar registros relacionados en la tabla "proyecto_persona"
    DELETE FROM proyecto_persona WHERE id_proyecto = OLD.idProyecto;
    
    -- Eliminar registros relacionados en la tabla "proyecto_vereda"
    DELETE FROM proyecto_vereda WHERE id_proyecto = OLD.idProyecto;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS trg_update_proyecto
DELIMITER //
CREATE TRIGGER trg_update_proyecto
AFTER UPDATE ON proyecto
FOR EACH ROW
BEGIN
    DECLARE rubro_count INT;

    -- Crear una tabla temporal para almacenar el resultado
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_rubro_count (count INT);

    -- Obtener la cantidad de rubros diferentes y almacenarla en la tabla temporal
    SET rubro_count = (SELECT COUNT(DISTINCT rubro) FROM proyecto);
    INSERT INTO temp_rubro_count (count) VALUES (rubro_count);
END //
DELIMITER ;
/*Para ver la tabla temporal debemos ejecutar:*/
SELECT count FROM temp_rubro_count;


/*==============================================================*/
/* Table: PROYECTO_PERSONA                                      */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_proyecto_persona
DELIMITER //
CREATE TRIGGER trg_insert_proyecto_persona
BEFORE INSERT ON proyecto_persona
FOR EACH ROW
BEGIN
    DECLARE count_records INT;
    
    -- Verificar si ya existe un registro con el mismo id_persona e id_proyecto
    SET count_records = (
        SELECT COUNT(*)
        FROM proyecto_persona
        WHERE id_persona = NEW.id_persona AND id_proyecto = NEW.id_proyecto
    );
    
    -- Si ya existe un registro, lanzar un error
    IF count_records > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ya existe un registro en proyecto_persona con el mismo id_persona e id_proyecto.';
    END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS trg_update_proyecto_persona
DELIMITER //
CREATE TRIGGER trg_update_proyecto_persona
AFTER UPDATE ON proyecto_persona
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite la modificación en la tabla proyecto_persona.';
END //
DELIMITER ;

DROP TRIGGER IF EXISTS trg_delete_proyecto_persona
DELIMITER //
CREATE TRIGGER trg_delete_proyecto_persona
BEFORE DELETE ON proyecto_persona
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite la eliminación en la tabla proyecto_persona.';
END //
DELIMITER ;

/*==============================================================*/
/* Table: PROYECTO_VEREDA                                       */
/*==============================================================*/
DROP TRIGGER IF EXISTS trg_insert_proyecto_vereda
DELIMITER //
CREATE TRIGGER trg_insert_proyecto_vereda
AFTER INSERT ON proyecto_vereda
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Se ha insertado un nuevo registro en proyecto_vereda.';
END //
DELIMITER ;

DROP TRIGGER IF EXISTS trg_update_proyecto_vereda
DELIMITER //
CREATE TRIGGER trg_update_proyecto_vereda
AFTER UPDATE ON proyecto_vereda
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Se ha actualizado un registro en proyecto_vereda.';
END //
DELIMITER ;

DROP TRIGGER IF EXISTS trg_delete_proyecto_vereda
DELIMITER //
CREATE TRIGGER trg_delete_proyecto_vereda
BEFORE DELETE ON proyecto_vereda
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Se va a eliminar un registro en proyecto_vereda.';
END //
DELIMITER ;
