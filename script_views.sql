/*Vista 1:
  Obtener el promedio de edad de las personas por género:*/
CREATE  VIEW vista_promedio_edad_por_genero AS
SELECT id_genero, AVG(edad) AS promedio_edad
FROM persona
GROUP BY id_genero;

/*Vista 2:
  Mostrar la lista de todas las veredas que tienen proyectos en estado 'Activo' y su respectiva información del proyecto:*/
CREATE OR REPLACE VIEW vista_veredas_proyectos_activos AS
SELECT v.nombre AS vereda, pr.estado, pr.fechaInicio, pr.rubro, pr.aporte, pr.observaciones
FROM vereda v, proyecto pr, proyecto_vereda pv
WHERE v.idVereda = pv.id_vereda AND pv.id_proyecto = pr.idProyecto AND pr.estado = 'Activo';

/*Vista 3:
  Mostrar la lista de todas las veredas que tienen tierra cultivable con un área mayor a 100 hectáreas:*/
CREATE OR REPLACE VIEW vista_veredas_tierra_cultivable AS
SELECT v.nombre AS vereda, t.Tierra AS tierra_cultivable, t.Tierra
FROM vereda v, tierra t
WHERE v.idVereda = t.id_vereda AND t.sector = 'Cultivo' AND t.Tierra > 100;

/*Vista 4:
  Mostrar la lista de todas las personas que tienen finca y la información de su finca:*/
CREATE OR REPLACE VIEW vista_personas_con_finca AS
SELECT p.nombre, p.apellido, f.finca, f.nombre_finca, f.area, f.suelos_tipo
FROM persona p, finca f
WHERE p.idPersona = f.id_persona;

/*Vista 5:
  Mostrar la lista de todas las personas que tienen un proyecto en estado 'en proceso' y su respectiva información del proyecto:*/
CREATE OR REPLACE VIEW vista_personas_proyectos_en_proceso AS
SELECT p.nombre, p.apellido, pr.estado, pr.fechaInicio, pr.rubro, pr.aporte, pr.observaciones
FROM persona p, proyecto pr
WHERE p.idPersona = pr.idPersona AND pr.estado = 'en proceso';

/*Vista 6:
  Obtener la cantidad de personas por vereda:*/
CREATE OR REPLACE VIEW vista_cantidad_personas_por_vereda AS
SELECT v.nombre AS vereda, COUNT(*) AS cantidad_personas
FROM persona p
INNER JOIN vereda v ON p.id_vereda = v.idVereda
GROUP BY v.nombre;

/*Vista 7:
  Obtener el total de tierras por vereda y municipio:*/
CREATE OR REPLACE VIEW vista_total_tierras_por_vereda_municipio AS
SELECT v.nombre AS vereda, m.nombre AS municipio, COUNT(*) AS cantidad_tierras
FROM tierra t
INNER JOIN vereda v ON t.id_vereda = v.idVereda
INNER JOIN municipio m ON t.id_municipio = m.idMunicipio
GROUP BY v.nombre, m.nombre;

/*Vista 8:
  Obtener el nombre y la identificación de las personas que han participado en proyectos en una vereda que tenga más de una finca registrada:*/
CREATE OR REPLACE VIEW vista_personas_proyectos_con_mas_de_una_finca AS
SELECT DISTINCT persona.nombre, persona.identificacion
FROM persona
JOIN proyecto_persona ON persona.idPersona = proyecto_persona.id_persona
JOIN proyecto_vereda ON proyecto_persona.id_proyecto = proyecto_vereda.id_proyecto
JOIN vereda ON proyecto_vereda.id_vereda = vereda.idVereda
WHERE vereda.idVereda IN
(SELECT proyecto_vereda.id_vereda FROM finca GROUP BY proyecto_vereda.id_vereda HAVING COUNT(*) > 1);

/*Vista 9:
  Obtener el nombre completo de las personas y el nombre de la vereda donde residen,
  de aquellas personas que tengan una finca registrada en la tabla finca y cuya área sea mayor a 150:*/
CREATE OR REPLACE VIEW vista_personas_con_finca_area_mayor_a_150 AS
SELECT CONCAT(p.nombre, ' ', p.apellido) AS nombre_completo, v.nombre AS nombre_vereda
FROM persona p
JOIN finca f ON f.id_persona = p.idPersona
JOIN vereda v ON v.idVereda = p.id_vereda
WHERE f.area > 150;

/*Vista 10:
 Obtener el nombre de las veredas y el nombre del municipio al que pertenecen, de aquellas veredas
 que tengan tierras registradas en la tabla tierra:*/
CREATE OR REPLACE VIEW vista_veredas_con_tierras AS
SELECT v.nombre AS nombre_vereda, m.nombre AS nombre_municipio
FROM vereda v
JOIN municipio m ON m.idMunicipio = v.id_municipio
WHERE v.idVereda IN (SELECT id_vereda FROM tierra);