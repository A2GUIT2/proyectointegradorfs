create database mundo_verde
use mundo_verde

-- tabla capacitacion

create table capacitacion (
id_capa int,
nom_capa varchar(150),
durac_capa float,
constraint pk_cca primary key (id_capa)
)
insert into capacitacion values ( 1, 'Primer paso en Jardineria', 2)
insert into capacitacion values ( 2, 'Segundo paso en Jardineria', 3)
insert into capacitacion values ( 3, 'Primer paso en Huerta' , 2)
insert into capacitacion values ( 4, 'Hidroponia Sistentable', 4)

select * from capacitacion

-- tabla usuario

create table usuario (
id_alum int,
nom_alu varchar (150),
ape_alu varchar (150),
edad_alu int,
dire_alu varchar (200),
tele_alu int,
constraint pk_cus primary key (id_alum)
)

insert into usuario values ( 11, 'Pedro', 'Oliveti', 18, 'Balcarce 454', 123456789)
insert into usuario values ( 12, 'Martin', 'Pedraza', 20, 'Pasteur 490', 235689741)
insert into usuario values ( 13, 'Eugenia', 'Moyano', 27, 'Monte Maiz 185', 368745896)

update usuario
set nom_alu='Mario'
where id_alum=11

select * from usuario

-- tabla producto

create table producto (
id_produ int,
cate_produ varchar (100),
precio_produ decimal,
constraint pk_cpr primary key (id_produ)
)

insert into producto values (22, 'Semillas', 1200)
insert into producto values (23, 'Abono', 1500)
insert into producto values (24, 'Carpunus Betulus', 7600)
insert into producto values (25, 'Semillas Cesped', 2300)
insert into producto values (26, 'Cicatrizante', 1600)
insert into producto values (27, 'Fertilizante', 1050)
insert into producto values (28, 'Ginkgo Biloba', 9000)
insert into producto values (29, 'Hidratante', 900)
insert into producto values (30, 'Magnolia', 6800)
insert into producto values (31, 'Manzano', 4500)
insert into producto values (32, 'Orquidea', 9000)
insert into producto values (33, 'Rodillo Cesped', 10000)

select * from producto

-- tabla experto

create table experto (
id_exp int,
nomb_exp varchar (150),
ape_exp varchar (150),
dire_exp varchar (150),
tele_exp int,
id_capa1 int,
constraint pk_cex primary key (id_exp),
constraint fk_cc1 foreign key (id_capa1) references capacitacion (id_capa)
)

insert into experto values ( 101, 'Federico', 'Simone', 'Laprida 566', 1254789652, 1)
insert into experto values ( 102, 'Maria', 'Ledesma', '9 de julio 405', 12345678, 2)
insert into experto values ( 103, 'Martin' ,'Portillo', 'Ocampo 302', 456789123, 3)
insert into experto values ( 104, 'Matias', 'Mendoza', 'Tejeda 504', 159357456, 4)

select * from experto


-- tabla usuario-producto

create table usu_pro1(
id_alum1 int,
id_produ1 int,
cantidad int,
total int,
constraint fk_falu11 foreign key (id_alum1) references usuario (id_alum),
constraint fk_fpro11 foreign key (id_produ1) references producto (id_produ)
)

insert into usu_pro1 values ( 11, 22)
insert into usu_pro1 values ( 12,28)
insert into usu_pro1 values ( 11, 31)
insert into usu_pro1 values ( 13, 27)

alter table usu_pro1
add cantidad int

update usu_pro1
set cantidad=4
where id_alum1=11

alter table usu_pro1
add total int

update usu_pro1
set total=cantidad*precio_produ
from usu_pro1 inner join producto on
producto.id_produ=usu_pro1.id_produ1

select * from usu_pro1


-- tabla usuario-capacitacion

create table usu_capa(
id_alum2 int,
id_capa2 int,
constraint fk_falu2 foreign key (id_alum2) references usuario (id_alum),
constraint fk_fcap2 foreign key (id_capa2) references capacitacion (id_capa)
)

insert into usu_capa values ( 11, 1)
insert into usu_capa values ( 12, 2)
insert into usu_capa values ( 13, 3)


select * from usu_capa