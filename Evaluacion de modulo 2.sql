/*Ejercicio n°1*/

/*a*/

	select count(idPrestacionServicio) 
	from prestacion_servicio 
	where fecha between '2018-10-01' and '2018-11-26';

/*b*/
	select idVehiculo,  count(idVehiculo)
	from prestacion_servicio
	group by  idVehiculo

/*c*/
	select idVehiculo,  count(idVehiculo) con
	group by  idVehiculo
	having min(con) = con

/*Ejercicio °n2*/

	create table empleado (
	idEmpleado int,
	nombre varchar(20),
	apellido varchar(20),
	direccion varchar(50),
	telefono int,
	idDepartamento int
	)


/*Ejercicio n° 3*/
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/3/2020 10:56:49                            */
/*==============================================================*/


drop table if exists FUNCION;

drop table if exists OPINION;

drop table if exists PARTICIPANTE;

drop table if exists PARTICIPAR;

drop table if exists PELICULA;

drop table if exists SALA;

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION
(
   N_SALA               int not null,
   ID_PELICULA          int not null,
   DIA                  varchar(10) not null,
   INICIO               time,
   DESCUENTO            int,
   DEC_PROMOCION        varchar(100),
   primary key (N_SALA, ID_PELICULA)
);

/*==============================================================*/
/* Table: OPINION                                               */
/*==============================================================*/
create table OPINION
(
   ID_OPINION           int not null,
   ID_PELICULA          int not null,
   NOMBRE_OPINANTE      varchar(20) not null,
   EDAD                 int not null,
   FECHA_               date not null,
   CLASIFICACION_       varchar(10) not null,
   OPINION              varchar(200) not null,
   primary key (ID_OPINION)
);

/*==============================================================*/
/* Table: PARTICIPANTE                                          */
/*==============================================================*/
create table PARTICIPANTE
(
   NOMBRE               varchar(20) not null,
   NACIONALIDAD         varchar(10) not null,
   ACTOR                bool not null,
   DIECTOR              bool not null,
   N_PELICULAS          int not null,
   primary key (NOMBRE)
);

/*==============================================================*/
/* Table: PARTICIPAR                                            */
/*==============================================================*/
create table PARTICIPAR
(
   NOMBRE               varchar(20) not null,
   ID_PELICULA          int not null,
   primary key (NOMBRE, ID_PELICULA)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA
(
   ID_PELICULA          int not null,
   TITULO_DISTRIBUCION  varchar(50) not null,
   TITULO_ORIGINAL      varchar(50) not null,
   GENERO               text not null,
   IDEOMA_O             varchar(20) not null,
   SUBTITULOS_ES        bool not null,
   PAIS_O               varchar(20) not null,
   ANO                  int not null,
   URL                  varchar(100) not null,
   DURACION             time not null,
   CLASIFICACION        varchar(20) not null,
   ESTRENO_SAN          date not null,
   SINOPSIS             varchar(200) not null,
   primary key (ID_PELICULA)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA
(
   N_SALA               int not null,
   NOMBRE_              varchar(20) not null,
   BUTACAS              int not null,
   primary key (N_SALA)
);

alter table FUNCION add constraint FK_EXHIBE foreign key (N_SALA)
      references SALA (N_SALA) on delete restrict on update restrict;

alter table FUNCION add constraint FK_EXHIBE2 foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA) on delete restrict on update restrict;

alter table OPINION add constraint FK_TIENE foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA) on delete restrict on update restrict;

alter table PARTICIPAR add constraint FK_PARTICIPAR foreign key (NOMBRE)
      references PARTICIPANTE (NOMBRE) on delete restrict on update restrict;

alter table PARTICIPAR add constraint FK_PARTICIPAR2 foreign key (ID_PELICULA)
      references PELICULA (ID_PELICULA) on delete restrict on update restrict;

