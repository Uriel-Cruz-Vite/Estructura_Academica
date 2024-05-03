INSERT INTO edificio (idEdificio, Niveles, Sanitarios) VALUES ('Edificio1', '2', 4);
INSERT INTO aula (idAula, Capacidad, Proyector, Edificio_idEdificio) VALUES ('Aula101', 30, 'SI', 'Edificio1');
INSERT INTO carrera (idCarrera, Nombre_carrera, Nombre_corto_carrera, Status_carrera, Fecha_Alta, Fecha_Baja, Fecha_Liquidacion) VALUES (1, 'Ingeniería en Sistemas Computacionales', 'ISC', 'ACTIVA', '2022-01-01', NULL, NULL);
INSERT INTO especialidad (idEspecialidad, Nombre_especialidad, Nombre_Corto_especialidad, Status_Especialidad, Carrera_idCarrera) VALUES (1, 'Desarrollo de Software', 'DS', 'ACTIVO', 1);
INSERT INTO materia (Clave_Materia, Nombre_Materia, Nombre_corto_materia, HT, HP, Creditos, Tipo, ESTATUS) VALUES ('MAT1234', 'Matemáticas Avanzadas', 'Mat. Avanz.', 48, 32, 8, 'BASICAS', 'VIGENTE');
INSERT INTO periodo (idPeriodo, Ciclo, Estatus_Periodo) VALUES (1, '2023-2024', 'ACTIVO');
INSERT INTO profesor (idProfesor, Nombre, Paterno, Materno, RFC, Status, Genero, Estudios, Titulo, Email, Telefono) VALUES (1, 'Juan', 'Pérez', 'Gómez', 'PERG890123JKL', 'ACTIVO', 'M', 'LICENCIATURA', 'Licenciado en Educación', 'juan@example.com', '1234567890');
INSERT INTO grupo (idGrupo, Grupo, Limite, Inscritos, Lunes_inicio, Lunes_Fin, aula_idAula_Lunes, Martes_inicio, Martes_Fin, aula_idAula_Martes, Miercoles_inicio, Miercoles_Fin, aula_idAulaMiercoles, Jueves_inicio, Jueves_fin, aula_idAula_Jueves, Viernes_inicio, Viernes_fin, Aula_idAula_Viernes, Status_Grupo, Profesor_idProfesor, Materia_Clave_Materia, Periodo_idPeriodo) VALUES (1, 'A', 30, 0, NULL, NULL, 'Aula101', NULL, NULL, 'Aula101', NULL, NULL, 'Aula101', NULL, NULL, 'Aula101', NULL, NULL, 'Aula101', 'ABIERTO', 1, 'MAT1234', 1);
INSERT INTO plaza (idPlaza, Descripcion) VALUES ('PLZ01', 'Profesor de tiempo completo');
INSERT INTO profesor_has_plaza (Id, Profesor_idProfesor, Plaza_idPlaza, Horas_Plaza, Status_Plaza) VALUES (1, 1, 'PLZ01', 40, '10');
INSERT INTO usuario (idUsuario, Password, Estatus, Image_Direct, profesor_idProfesor) VALUES ('usuario1', 'contraseña123', 'ACTIVO', 'ruta/imagen.jpg', 1);
INSERT INTO reticula (idReticula, Plan, Estatus_Reticula, Fecha_autorizacion, Carrera_idCarrera) VALUES (1, 'Plan 2023', 'ACTIVA', '2023-01-01', 1);
INSERT INTO reticula_has_materia (Reticula_idReticula, Materia_Clave_Materia, Clave_interna_Materia) VALUES (1, 'MAT1234', 'MAT1');
INSERT INTO edificio (idEdificio, Niveles, Sanitarios) VALUES ('Edificio2', '3', 6);
INSERT INTO aula (idAula, Capacidad, Proyector, Edificio_idEdificio) VALUES ('Aula102', 25, 'NO', 'Edificio2');
INSERT INTO carrera (idCarrera, Nombre_carrera, Nombre_corto_carrera, Status_carrera, Fecha_Alta, Fecha_Baja, Fecha_Liquidacion) VALUES (2, 'Ingeniería en Electrónica', 'IE', 'ACTIVA', '2023-01-01', NULL, NULL);
INSERT INTO especialidad (idEspecialidad, Nombre_especialidad, Nombre_Corto_especialidad, Status_Especialidad, Carrera_idCarrera) VALUES (2, 'Control y Automatización', 'CyA', 'ACTIVO', 2);
INSERT INTO materia (Clave_Materia, Nombre_Materia, Nombre_corto_materia, HT, HP, Creditos, Tipo, ESTATUS) VALUES ('FIS2345', 'Física III', 'Fis. III', 48, 32, 8, 'CARRERA', 'VIGENTE');
INSERT INTO periodo (idPeriodo, Ciclo, Estatus_Periodo) VALUES (2, '2024-2025', 'ACTIVO');
INSERT INTO profesor (idProfesor, Nombre, Paterno, Materno, RFC, Status, Genero, Estudios, Titulo, Email, Telefono) VALUES (2, 'María', 'López', 'García', 'LOGM890123JKL', 'ACTIVO', 'F', 'MAESTRÍA', 'Maestra en Ingeniería', 'maria@example.com', '9876543210');
INSERT INTO plaza (idPlaza, Descripcion) VALUES ('PLZ02', 'Profesor de medio tiempo');
INSERT INTO profesor_has_plaza (Id, Profesor_idProfesor, Plaza_idPlaza, Horas_Plaza, Status_Plaza) VALUES (2, 2, 'PLZ02', 20, '10');
INSERT INTO usuario (idUsuario, Password, Estatus, Image_Direct, profesor_idProfesor) VALUES ('usuario2', '123456', 'ACTIVO', 'ruta/imagen2.jpg', 2);
INSERT INTO reticula (idReticula, Plan, Estatus_Reticula, Fecha_autorizacion, Carrera_idCarrera) VALUES (2, 'Plan 2024', 'ACTIVA', '2024-01-01', 1);
INSERT INTO reticula_has_materia (Reticula_idReticula, Materia_Clave_Materia, Clave_interna_Materia) VALUES (2, 'FIS2345', 'FIS2');


