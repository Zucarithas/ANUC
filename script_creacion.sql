drop table proyecto_vereda;
drop table proyecto_persona;
drop table proyecto;
drop table finca;
drop table persona;
drop table tierra;
drop table vereda;
drop table municipio;
drop table valoresAdicionales;

CREATE table valoresAdicionales(
    idValores int(11) NOT NULL AUTO_INCREMENT,
    campo varchar(50) NOT NULL,
    valor varchar(50) NOT NULL,
    PRIMARY KEY (idValores)
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
CREATE table municipio(
    idMunicipio int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    PRIMARY KEY (idMunicipio)
);

/*==============================================================*/
/* Table: VEREDA                                                */
/*==============================================================*/
CREATE table vereda(
    idVereda int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    id_municipio int(11) NOT NULL,
    area varchar(100) NOT NULL,
    PRIMARY KEY (idVereda),
    FOREIGN KEY (id_municipio) REFERENCES municipio(idMunicipio)
);

/*==============================================================*/
/* Table: TIERRA                                               */
/*==============================================================*/
CREATE TABLE tierra (
    Id_Tierra INT(11) NOT NULL AUTO_INCREMENT,
    Tierra VARCHAR(100) NOT NULL,
    sector VARCHAR(50) NOT NULL,
    id_vereda INT(11) NOT NULL,
    id_municipio INT(11) NOT NULL,
    PRIMARY KEY (Id_Tierra),
    FOREIGN KEY (id_vereda) REFERENCES vereda(idVereda),
    FOREIGN KEY (id_municipio) REFERENCES municipio(idMunicipio)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
CREATE table persona(
    idPersona int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    identificacion int(11) NOT NULL,
    codigoAnun int(20) NOT NULL,
    telefono varchar(20) NOT NULL,
    edad int(4) NOT NULL,
    id_genero varchar(11) NOT NULL,
    estudios varchar(20) NOT NULL,
    afiliado varchar(3) NOT NULL,
    id_desplazado int(11) NOT NULL,
    id_vereda int(11) NOT NULL,
    PRIMARY KEY (idPersona),
    FOREIGN KEY (id_vereda) REFERENCES vereda(idVereda)
);

/*==============================================================*/
/* Table: FINCA                                                 */
/*==============================================================*/
CREATE TABLE finca (
id_persona int(11) NOT NULL,
finca varchar(3) DEFAULT NULL,
nombre_finca varchar(50) DEFAULT NULL,
area varchar(50) DEFAULT NULL,
suelos_tipo varchar(50) DEFAULT NULL,
PRIMARY KEY (id_persona),
FOREIGN KEY (id_persona) REFERENCES persona (idPersona)
);

/*==============================================================*/
/* Table: PROYECTO                                               */
/*==============================================================*/
CREATE table proyecto(
    idPersona int(11) NOT NULL,
    idProyecto int(11) NOT NULL AUTO_INCREMENT,
    estado varchar(100) NOT NULL,
    fechaInicio date NOT NULL,
    rubro varchar(30) NOT NULL,
    aporte varchar(11) NOT NULL,
    observaciones varchar(500) NOT NULL,
    PRIMARY KEY (idProyecto),
    FOREIGN KEY (idPersona) REFERENCES persona(idPersona)
);

/*==============================================================*/
/* Table: PROYECTO_PERSONA                                      */
/*==============================================================*/
CREATE table proyecto_persona(
    idProyectoPersona int(11) NOT NULL AUTO_INCREMENT,
    id_persona int(11) NOT NULL,
    id_proyecto int(11) NOT NULL,
    fecha_ingreso date NOT NULL,
    motivo varchar(500) NOT NULL,
    nomConyuge varchar(50) NOT NULL,
    puntajeSisben varchar(11) NOT NULL,
    antecedentes varchar(3) NOT NULL,
    firma varchar(3) NOT NULL,
    PRIMARY KEY (idProyectoPersona),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY (id_persona) REFERENCES persona(idPersona)
);

/*==============================================================*/
/* Table: PROYECTO_VEREDA                                       */
/*==============================================================*/
create table proyecto_vereda(
    idProyectoVereda int(11) NOT NULL AUTO_INCREMENT,
    id_proyecto int(11) NOT NULL,
    id_vereda int(11) NOT NULL,
    PRIMARY KEY (idProyectoVereda),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY (id_vereda) REFERENCES vereda(idVereda)
);