CREATE TABLE `soporte`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `correoelectronico` VARCHAR(45) NULL,
  `ingresos` INT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`));

CREATE TABLE `soporte`.`operario` (
  `idoperario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `correoelectronico` VARCHAR(45) NULL,
  `operariocol` VARCHAR(45) NULL,
  `cantidadsoportes` INT NULL DEFAULT 1,
  PRIMARY KEY (`idoperario`));

CREATE TABLE `soporte`.`registro` (
  `Operario_idOperario` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Fecha` DATE NULL,
  `Evaluacion` INT NULL,
  PRIMARY KEY (`Operario_idOperario`, `Usuario_idUsuario`));
  
  
/*Agregue 5 usuarios, 5 operadores y 10 operaciones de soporte. Los datos debe crearlos según su imaginación*/

insert into usuario (idusuario, Nombre, Apellido, Edad, correoelectronico, ingresos)
values ( 1, 'Jose', 'Fuenzalida', 32, 'jose@gmail.com', 3), 
(2, 'Emma', 'Ortega', 18, 'emma@outlook.com', 1), 
(3, 'Juan', 'Morales', 65, 'jmorales@yahoo.es', 23), 
(4, 'Vilma', 'Marmol', 35, 'vilma@gmail.com', 8), 
(5, 'Pablo', 'Vial', 22, 'pvial@gmail.com', 12);

select * from usuario; 

insert into operario (idoperario, Nombre, Apellido, Edad, correoelectronico, cantidadsoportes)
values ( 1, 'John', 'Cobin', 45, 'jcobin@gmail.com', 7), 
(2, 'Trinidad', 'Venegas', 28, 'tvenegas@outlook.com', 22), 
(3, 'Ronald', 'Madariaga', 32, 'rmadariaga@yahoo.com', 13), 
(4, 'Daniela', 'Herrera', 56, 'daniherrera@outlook.com', 43), 
(5, 'Jaime', 'Pizarro', 22, 'jpizarro28@gmail.cl', 9);

select * from operario; 

insert into registro (Operario_idOperario, Usuario_idUsuario, Fecha, Evaluacion)
values (2, 4,'2021-10-05', 7), 
(4, 3, '2021-10-05', 1), 
(1, 2, '2021-08-12', 4), 
(5, 5, '2021-02-22', 5), 
(5, 1, '2021-07-30', 6), 
(3, 1, '2021-01-01', 5), 
(3, 3, '2021-06-07', 6), 
(2, 3, '2021-02-25', 2), 
(1, 5, '2021-05-18', 7), 
(5, 4, '2021-05-19', 5);

select * from registro; 

/*Seleccione las 3 operaciones con mejor evaluación.*/

SELECT * FROM registro ORDER BY evaluacion DESC LIMIT 3; 

/*Seleccione las 3 operaciones con menos evaluación.*/

SELECT * FROM registro ORDER BY evaluacion ASC LIMIT 3;  

/*Seleccione al operario que más soportes ha realizado*/

select nombre, apellido,cantidadsoportes from operario
where cantidadsoportes = (select max(cantidadsoportes) from operario); 

/*Seleccione al cliente que menos veces ha utilizado la aplicación*/

select nombre, apellido,ingresos from usuario
where ingresos = (select min(ingresos) from usuario); 

/*Agregue 10 años a los tres primeros usuarios registrados*/
UPDATE usuario SET Edad=(Edad +10) WHERE idusuario = 1;
UPDATE usuario SET Edad=(Edad +10) WHERE idusuario = 2;
UPDATE usuario SET Edad=(Edad +10) WHERE idusuario = 3;

/*Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.*/

ALTER TABLE usuario RENAME COLUMN correoelectronico TO email;
ALTER TABLE operario RENAME COLUMN correoelectronico TO email;

/*Seleccione solo los operarios mayores de 20 años.*/

select * from operario
where edad > 22; 