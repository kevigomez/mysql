create database sistemeps;
use sistemeps;
create table citas(
id_cita bigint primary key unique auto_increment not null,
fecha_cita date not null,
hora_cita time not null,
estado_Cita enum("activo","inactivo") not null
);
create table Doctor(
id_documento bigint primary key unique auto_increment not null,
Tipo_documento int null,
nombre varchar(255)  not null, 
rol varchar(255) not null,
correo varchar(255) not null,
telefono bigint not null,
titulo_U enum("si","no") not null,
disponibilidad enum("disponible","no disponible") not null,
id_cita bigint not null,
foreign key(id_cita) references citas(id_cita)
);
create table Paciente(
id_documento bigint primary key unique auto_increment not null,
Tipo_documento varchar(255) null,
nombre varchar(255)  not null, 
rol varchar(255) not null,
correo varchar(255) not null,
telefono bigint not null,
id_cita bigint not null,
foreign key(id_cita) references citas(id_cita)
);

create table Agenda(
id_Agenda bigint primary key unique auto_increment not null ,
fecha_AG date not null,
Hora_AG time not null,
id_cita bigint not null,
id_documento bigint not null,
foreign key(id_cita) references citas(id_cita),
foreign key(id_documento) references doctor(id_documento)
);
create table Sede(
id_Sede bigint primary key auto_increment not null,
direccion varchar(255) not null,
telefono bigint not null,
id_cita bigint not null,
id_documento bigint not null,
foreign key(id_cita) references citas(id_cita),
foreign key(id_documento) references doctor(id_documento)
);
/*primero*/
select 
id_documento as seguimiento,
Tipo_documento,nombre,correo,telefono,titulo_U,disponibilidad,id_cita
from doctor;
select 
id_cita as seguimiento,
fecha_cita,hora_cita,estado_Cita
from citas;

select 
id_agenda as seguimiento,
fecha_AG,Hora_AG,id_cita,id_documento
from agenda;

select 
id_documento as seguimiento,
Tipo_documento,nombre,rol,correo,telefono,disponibilidad,id_cita
from paciente;
select 
id_sede as seguimiento,
direccion,telefono,id_cita,id_documento
from sede;
select * from doctor;
select * from citas;
select * from agenda;
select * from paciente;
select * from sede;
/*segundo*/
select * from doctor where id_documento<=5;
select * from citas where id_cita<=5;
select * from agenda where id_agenda<=5;
select * from paciente where id_documento<=5;
select * from sede where id_sede<=5;


SELECT id_documento FROM doctor where Count(*) % 2 = 0  



