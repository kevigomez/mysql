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
Tipo_documento,nombre,rol,correo,telefono,id_cita
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

/*tercero*/
SELECT * FROM doctor where id_documento=2 or id_documento=4 or id_documento=6 or id_documento=8 or id_documento=10;
SELECT * FROM citas where id_cita=2 or id_cita=4 or id_cita=6 or id_cita=8 or id_cita=10;
SELECT * FROM agenda where id_agenda=2 or id_agenda=4 or id_agenda=6 or id_agenda=8 or id_agenda=10;
SELECT * FROM paciente where id_documento=2 or id_documento=4 or id_documento=6 or id_documento=8 or id_documento=10;
SELECT * FROM sede where id_sede=2 or id_sede=4 or id_sede=6 or id_sede=8 or id_sede=10;

/*cuarto*/
select * FROM doctor inner join citas  on doctor.id_documento = citas.id_cita;
select * FROM citas inner join agenda  on citas.id_cita = agenda.id_agenda;
select * FROM agenda inner join paciente  on agenda.id_agenda = paciente.id_documento;
select * FROM paciente inner join sede  on paciente.id_documento = sede.id_sede;
select * FROM sede inner join doctor  on sede.id_sede = doctor.id_documento;

