-- Insertar datos en Gerente
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (1, 'Juan Pérez', '01-08-2024 08:10:00');
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro) VALUES (2, 'Ana Martínez', '12-06-2023 09:50:00');

-- Insertar datos en Condicion
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (1, 'En funcionamiento','01-08-2025 09:10:00');
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) VALUES (2, 'En renovación','01-08-2024 08:10:00');

-- Insertar datos en Sede
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (1, 'Sede Central','24-08-2021 08:20:00');
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (2, 'Sede Norte', '17-06-2020 09:40:00');
INSERT INTO Sede (idSede, descSede, fechaRegistro) VALUES (3, 'Sede Sur','13-02-2019 07:30:00');

-- Insertar datos en Provincia
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (1, 'Lima', SYSTIMESTAMP);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (2, 'Piura', SYSTIMESTAMP);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) VALUES (3, 'Cañete', SYSTIMESTAMP);

-- Insertar datos en Distrito
INSERT INTO Distrito (idDistrito, idProvincia, descSede, fechaRegistro) VALUES (1, 1, 'Distrito 1', '15-03-2014 07:45:00');
INSERT INTO Distrito (idDistrito, idProvincia, descSede, fechaRegistro) VALUES (2, 2, 'Distrito 2', '08-02-2013 09:24:00');

-- Insertar datos en Hospital
INSERT INTO Hospital (idHospital, idDistrito, Nombre, Antiguedad, Area, idSede, idGerente, idCondicion, fechaRegistro)
VALUES (1, 1, 'Hospital Central', 10, 5.0, 1, 1, 1, SYSTIMESTAMP);
INSERT INTO Hospital (idHospital, idDistrito, Nombre, Antiguedad, Area, idSede, idGerente, idCondicion, fechaRegistro)
VALUES (7, 2, 'Hospital Norte', 5, 3.4, 2, 2, 2, SYSTIMESTAMP);

INSERT INTO Hospital(idHospital, idDistrito, Nombre, Antiguedad, Area, idSede, idGerente, idCondicion, fechaRegistro)
VALUES (10, 1, 'Hospital Central', 10, 4.5, 1, 1, 1, SYSTIMESTAMP);
select*from hospital;
