/*==============================================================*/
/* CONSULTAS A LA BASE DE DATOS                                 */
/*==============================================================*/
/*Consulta 1:
  Seleccionar todas las veredas con un área mayor a 209:*/
SELECT * FROM vereda WHERE CAST(area AS DECIMAL(10,2)) > 209;

/*Consulta 2:
  Seleccionar todas las personas que no o si están afiliadas:*/
SELECT * FROM persona WHERE afiliado = 'no';

/*Consulta 3:
  Obtener la cantidad de proyectos por rubro:*/
SELECT rubro, COUNT(*) AS cantidad_proyectos
FROM proyecto
GROUP BY rubro;

/*Consulta 4:
  Obtener la cantidad de personas por vereda:*/


/*Consulta 5:
  Obtener la cantidad de fincas por persona:*/
SELECT id_persona, COUNT(*) AS cantidad_fincas
FROM finca
GROUP BY id_persona;

/*Consulta 6:
  Obtener el promedio de edad de las personas por género:*/
SELECT id_genero, AVG(edad) AS promedio_edad
FROM persona
GROUP BY id_genero;

/*Consulta 7:
  Mostrar la lista de todas las veredas que tienen proyectos en estado 'Activo' y su respectiva información del proyecto:*/
SELECT v.nombre AS vereda, pr.estado, pr.fechaInicio, pr.rubro, pr.aporte, pr.observaciones
FROM vereda v, proyecto pr, proyecto_vereda pv
WHERE v.idVereda = pv.id_vereda AND pv.id_proyecto = pr.idProyecto AND pr.estado = 'Activo';

/*Consulta 8:
  */
SELECT v.nombre AS vereda, t.Tierra AS tierra_cultivable, t.Tierra
FROM vereda v, tierra t
WHERE v.idVereda = t.id_vereda AND t.sector = 'Cultivo' AND t.Tierra > '100';

/*Consulta 9:
  Mostrar la lista de todas las personas que tienen finca y la información de su finca:*/
SELECT p.nombre, p.apellido, f.finca, f.nombre_finca, f.area, f.suelos_tipo
FROM persona p, finca f
WHERE p.idPersona = f.id_persona;

/*Consulta 10:
  */
SELECT p.nombre, p.apellido, pr.estado, pr.fechaInicio, pr.rubro, pr.aporte, pr.observaciones
FROM persona p, proyecto pr
WHERE p.idPersona = pr.idPersona AND pr.estado = 'en proceso';

/**/
/*==============================================================*/
/* CONSULTAS A LA DB CON JOINS                                  */
/*==============================================================*/
/*Consulta 1:
  Obtener el nombre y la identificación de las personas que tienen proyectos en estado "Aprobado" y es afiliado*/
SELECT p.nombre, p.identificacion
FROM persona p
INNER JOIN proyecto pr ON p.idPersona = pr.idPersona
WHERE pr.estado = 'Activo' and p.afiliado = 'si';

/*Consulta 2:
  Obtener el nombre y el área de las fincas de las personas que tienen proyectos en estado "Activo" y cuyo rubro es "Vivienda":*/
SELECT f.nombre_finca, f.area
FROM finca f
INNER JOIN persona p ON f.id_persona = p.idPersona
INNER JOIN proyecto pr ON p.idPersona = pr.idPersona
WHERE pr.estado = 'Activo' AND pr.rubro = 'Vivienda';

/*Consulta 3:
  Obtener el nombre de las veredas que tienen proyectos registrados y el número de proyectos asociados a cada una:*/
SELECT v.nombre, COUNT(pv.id_proyecto) AS num_proyectos
FROM vereda v
LEFT JOIN proyecto_vereda pv ON v.idVereda = pv.id_vereda
GROUP BY v.nombre;

/*Consulta 4:
  Obtener el nombre de las personas que tienen proyectos registrados y el total de aportes recibidos:*/
SELECT p.nombre, SUM(pr.aporte) AS total_aportes
FROM persona p
LEFT JOIN proyecto pr ON p.idPersona = pr.idPersona
GROUP BY p.nombre;

/*Consulta 5:
  Obtener el nombre de las personas que tienen proyectos en estado "Activo" y que tienen una finca con un area mayor a 100:*/
SELECT DISTINCT p.nombre
FROM persona p
INNER JOIN proyecto pr ON p.idPersona = pr.idPersona
INNER JOIN finca f ON p.idPersona = f.id_persona
WHERE pr.estado = 'Activo' AND f.area > 100;

/*Consulta 6:
  Obtener la cantidad de personas por vereda:*/
SELECT v.nombre AS vereda, COUNT(*) AS cantidad_personas
FROM persona p
INNER JOIN vereda v ON p.id_vereda = v.idVereda
GROUP BY v.nombre;

/*Consulta 7:
  Obtener el total de tierras por vereda y municipio:*/
SELECT v.nombre AS vereda, m.nombre AS municipio, COUNT(*) AS cantidad_tierras
FROM tierra t
INNER JOIN vereda v ON t.id_vereda = v.idVereda
INNER JOIN municipio m ON t.id_municipio = m.idMunicipio
GROUP BY v.nombre, m.nombre;

/*Consulta 8:
  Obtener el nombre y la identificación de las personas que han participado en proyectos en una vereda que tenga más de una finca registrada:*/
SELECT DISTINCT persona.nombre, persona.identificacion
FROM persona
JOIN proyecto_persona ON persona.idPersona = proyecto_persona.id_persona
JOIN proyecto_vereda ON proyecto_persona.id_proyecto = proyecto_vereda.id_proyecto
JOIN vereda ON proyecto_vereda.id_vereda = vereda.idVereda
WHERE vereda.idVereda IN
(SELECT proyecto_vereda.id_vereda FROM finca GROUP BY proyecto_vereda.id_vereda HAVING COUNT(*) > 1);

/*Obtener el nombre completo de las personas y el nombre de la vereda donde residen, de aquellas personas que tengan una finca registrada en la tabla finca y cuya área sea mayor a 150:*/
SELECT CONCAT(p.nombre, ' ', p.apellido) AS nombre_completo, v.nombre AS nombre_vereda
FROM persona p
JOIN finca f ON f.id_persona = p.idPersona
JOIN vereda v ON v.idVereda = p.id_vereda
WHERE f.area > 150;

/*Consulta 10:
  Obtener el nombre de las veredas y el nombre del municipio al que pertenecen, de aquellas veredas que tengan tierras registradas en la tabla tierra:*/
SELECT v.nombre AS nombre_vereda, m.nombre AS nombre_municipio
FROM vereda v
JOIN municipio m ON m.idMunicipio = v.id_municipio
WHERE v.idVereda IN (SELECT id_vereda FROM tierra);