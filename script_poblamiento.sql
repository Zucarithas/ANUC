/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
INSERT INTO municipio (nombre) VALUES ('Bogotá');
INSERT INTO municipio (nombre) VALUES ('Medellín');
INSERT INTO municipio (nombre) VALUES ('Cali');
INSERT INTO municipio (nombre) VALUES ('Barranquilla');
INSERT INTO municipio (nombre) VALUES ('Cartagena');
INSERT INTO municipio (nombre) VALUES ('Cúcuta');
INSERT INTO municipio (nombre) VALUES ('Soledad');
INSERT INTO municipio (nombre) VALUES ('Ibagué');
INSERT INTO municipio (nombre) VALUES ('Bucaramanga');
INSERT INTO municipio (nombre) VALUES ('Pereira');
INSERT INTO municipio (nombre) VALUES ('San Juan');
INSERT INTO municipio (nombre) VALUES ('San Carlos');
INSERT INTO municipio (nombre) VALUES ('San Rafael');
INSERT INTO municipio (nombre) VALUES ('San Luis');
INSERT INTO municipio (nombre) VALUES ('San Vicente');

/*==============================================================*/
/* Table: VEREDA                                                */
/*==============================================================*/
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('Miravalle dapa', 1, '180 y 225 m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('Torres de puelenje', 2, '199 y 215 m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('Los cerrillos', 3, '190 y 280 m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('Las mercedes', 4, '200 y 210 m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('San rafael', 5, '190 y 220 m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('Santa rosa', 6, '185 y 210 m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('San bernardino', 7, '198 y 227m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('Calibio', 8, '210y 240m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('La yunga', 9, '200 y 230m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('El tablon', 10, '208 y 217m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('El Porvenir', 11, '202 y 220m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('San Antonio', 11, '152 y 224m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('La Victoria', 12, '185 y 202m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('El Progreso', 12, '180 y 215m²');
INSERT INTO vereda (nombre, id_municipio, area) VALUES ('El Edén', 13, '205 y 240m²');

/*==============================================================*/
/* Table: TIERRA                                               */
/*==============================================================*/
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('180 y 225 m²', 'Zona baja', 1, 1);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('199 y 215 m²', 'zona media', 2, 2);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('190 y 280 m²', 'zona media', 3, 3);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('200 y 210 m²', 'zona alta', 4, 4);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('190 y 220 m²', 'zona alta', 5, 5);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('185 y 210 m²', 'zona media', 6, 6);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('198 y 227m²', 'zona baja', 7, 7);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('210y 240m²', 'zona baja', 8, 8);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('200 y 230m²', 'zona media', 9, 9);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('208 y 217m²', 'zona alta', 10, 10);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('Bosque', 'Primario', 11, 11);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('Agricultura', 'Cultivo', 11, 11);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('Ganadería', 'Pastoreo', 12, 11);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('Agricultura', 'Cultivo', 13, 12);
INSERT INTO tierra (Tierra, sector, id_vereda, id_municipio) VALUES ('Bosque', 'Secundario', 14, 12);

/*==============================================================*/
/* Table: FINCA                                               */
/*==============================================================*/
INSERT INTO finca (id_persona, finca, nombre_finca, area, suelos_tipo)
VALUES
(1, 'si', 'Finca el Encanto', '1110 y 1225 m²', 'Arenoso'),
(2, 'no', NULL, NULL, 'Acido'),
(3, 'si', 'Finca Achira', '992 y 1225 m²', 'Arcilla'),
(4, 'si', 'Finca Montesca', '1201y 1425 m²', 'Arcilla'),
(5, 'si', 'Finca Valle de Oro', '1204 y 1600m²', 'Acido'),
(6, 'si', 'Finca Dulceflor', '1192 y 1500 m²', 'Arenoso'),
(7, 'no', NULL, NULL, NULL),
(8, 'si', 'Finca Botón de Oro', '1230 y 1211 m²', 'Arenoso'),
(9, 'si', 'Finca La Chuspa', '1211 y 1911 m²', 'Arenoso'),
(10, 'si', 'Finca El Porvenir', '1412 y 1811 m²', 'Arenoso');
INSERT INTO finca (id_persona, finca, nombre_finca, area, suelos_tipo) VALUES
(11, 'Si', 'La Esperanza', '5 hectáreas', 'Franco arenoso'),
(12, 'No', NULL, NULL, NULL),
(13, 'Si', 'El Recuerdo', '3 hectáreas', 'Franco arcilloso'),
(14, 'No', NULL, NULL, NULL),
(15, 'No', NULL, NULL, NULL);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
INSERT INTO persona (nombre, apellido, identificacion, codigoAnun, telefono, edad, id_genero, estudios, afiliado, id_desplazado, id_vereda)
VALUES ('Alberto', 'Morales', 1009200923, 202, '3122223902', 39, 1, 'Bachillerato', 'si', 93023, 1),
('Antonio', 'Cardenas', 928990291, 902, '3172887293', 42, 1, '', 'si', 90202, 2),
('Maria', 'Torres', 784892009, 201, '3142289203', 49, 2, 'Bachillerato', 'no', 902903, 3),
('Felipe', 'Perez', 728600981, 578, '3212299823', 45, 1, 'Bachillerato', 'si', 100293, 4),
('Ana', 'Lopez', 766560091, 891, '3179288932', 50, 2, '', 'si', 12002, 5),
('Kevin', 'Garcia', 1002988239, 1002, '3112892207', 29, 1, 'Universidad', 'si', 100298, 6),
('Sandra', 'Arboleda', 100290903, 992, '3178899028', 32, 2, 'Bachillerato', 'no', 100293, 7),
('Arturo', 'Vidal', 100293098, 920, '3102299028', 38, 1, 'Bachillerato', 'no', 0, 8),
('Isabel', 'Gutierrez', 100298732, 890, '3112920092', 34, 2, 'Universidad', 'si', 100299, 9),
('Laura', 'Mendez', 102899382, 772, '3211200902', 26, 2, 'Universidad', 'si', 120993, 10);
INSERT INTO persona (idPersona, nombre, apellido, identificacion, codigoAnun, telefono, edad, id_genero, estudios, afiliado, id_desplazado, id_vereda) VALUES
(11, 'Juan', 'Perez', 123456789, 987654321, '555-1234', 35, 1, 'Pregrado', 'Si', 11, 11),
(12, 'Maria', 'Gonzalez', 234567890, 876543219, '555-2345', 28, 2, 'Pregrado', 'No', 12, 12),
(13, 'Luis', 'Rodriguez', 345678901, 765432198, '555-3456', 45, 1, 'Maestria', 'Si', 13, 13),
(14, 'Ana', 'Martinez', 456789012, 654321987, '555-4567', 50, 2, 'Doctorado', 'No', 14, 14),
(15, 'Pedro', 'Lopez', 567890123, 543219876, '555-5678', 22, 1, 'Pregrado', 'No', 15, 15);

/*==============================================================*/
/* Table: PROYECTO                                               */
/*==============================================================*/
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (1, 'Activo', '2025-06-06', 'Vivienda', '$60.0000', 'No tiene vivienda');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (2, 'Activo', '2025-06-07', 'P. Productivo', '$60.0000', 'Daño por ola invernal');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (3, 'Activo', '2025-06-08', 'P. Productivo', '$60.0000', 'Daño por ola invernal');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (4, 'Activo', '2025-06-09', 'P. TIierra', '$60.0000', 'No tiene donde realizar sus trabajos');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (5, 'Activo', '2025-06-10', 'P. TIierra', '$60.0000', 'No tiene donde realizar sus trabajos');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (6, 'Activo', '2025-06-11', 'P. TIierra', '$60.0000', 'No tiene donde realizar sus trabajos');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (7, 'Activo', '2025-06-12', 'P. TIierra', '$60.0000', 'No tiene donde realizar sus trabajos');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (8, 'Activo', '2025-06-13', 'Vivienda', '$60.0000', 'No tiene vivienda');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (9, 'Activo', '2025-06-14', 'P. Productivo', '$60.0000', 'Daño por ola invernal');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES (10, 'Activo', '2025-06-15', 'Vivienda', '$60.0000', 'No tiene vivienda');
INSERT INTO proyecto (idPersona, estado, fechaInicio, rubro, aporte, observaciones) VALUES
(11, 'En ejecución', '2022-01-01', 'Agricultura', '5000000', 'Proyecto financiado por el gobierno'),
(12, 'En espera', '2023-02-01', 'Pesca', '0', 'Aun no se ha definido el financiamiento'),
(13, 'Terminado', '2021-06-01', 'Ganaderia', '20000000', 'El proyecto fue un éxito'),
(14, 'En ejecución', '2022-03-01', 'Turismo', '10000000', 'Se espera atraer turistas nacionales e internacionales'),
(15, 'En espera', '2023-01-01', 'Artesanias', '0', 'Aun no se ha definido el rubro del proyecto');

/*==============================================================*/
/* Table: PROYECTO_PERSONA                                               */
/*==============================================================*/
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (1, 1, '2019-05-07', 'Recursos economicos', 'Sandra Morales', 'A1', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (2, 2, '2019-05-18', 'Persona sin hogar', 'Isabel Garcia', 'A2', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (3, 3, '2019-05-09', 'Madre soltera', 'Felipe Gomez', 'A3', 'si', 'no');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (4, 4, '2019-05-10', 'Persona sin hogar', 'Sofia Torres', 'A4', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (5, 5, '2019-05-11', 'Persona sin hogar', 'Juan Perez', 'A5', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (6, 6, '2019-05-12', 'Recursos economicos', 'Juliana Lopez', 'A6', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (7, 7, '2020-07-03', 'Desplazado por la violencia', 'Luis Mondragon', 'A7', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (8, 8, '2020-07-04', 'Recursos economicos', 'Danna Ortiz', 'A8', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (9, 9, '2020-07-05', 'Recursos economicos', 'Esteban Bolañoz', 'A9', 'no', 'si');
INSERT INTO proyecto_persona (id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (10, 10, '2020-07-06', 'Desplazado por la violencia', 'Sebastian Paz', 'A10', 'no', 'no');
INSERT INTO proyecto_persona (idProyectoPersona, id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (11, 11, 11, '2022-01-01', 'Interesado en el proyecto', 'Maria', '45', 'No', 'Si');
INSERT INTO proyecto_persona (idProyectoPersona, id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (12, 12, 11, '2022-01-02', 'Necesita ayuda financiera', 'Juan', '50', 'No', 'No');
INSERT INTO proyecto_persona (idProyectoPersona, id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (13, 13, 12, '2022-02-01', 'Mejora de vivienda', 'Pedro', '30', 'Si', 'Si');
INSERT INTO proyecto_persona (idProyectoPersona, id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (14, 14, 12, '2022-02-02', 'Acceso a servicios públicos', 'Ana', '20', 'No', 'No');
INSERT INTO proyecto_persona (idProyectoPersona, id_persona, id_proyecto, fecha_ingreso, motivo, nomConyuge, puntajeSisben, antecedentes, firma)
VALUES (15, 15, 12, '2022-02-03', 'Creación de empresa', 'Luis', '40', 'Si', 'No');

/*==============================================================*/
/* Table: PROYECTO_VEREDA                                               */
/*==============================================================*/
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (1, 1);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (2, 2);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (3, 3);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (4, 4);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (5, 5);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (6, 6);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (7, 7);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (8, 8);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (9, 9);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (10, 10);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (11, 1);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (12, 2);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (11, 3);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (12, 4);
INSERT INTO proyecto_vereda (id_proyecto, id_vereda) VALUES (11, 5);

