CREATE TABLE Gerente (
    idGerente NUMBER PRIMARY KEY,
    descGerente VARCHAR2(100),
    FechaRegistro TIMESTAMP
);

CREATE TABLE Condicion (
    idCondicion NUMBER PRIMARY KEY,
    descCondicion VARCHAR2(100),
    FechaRegistro TIMESTAMP
);

CREATE TABLE Sede (
    idSede NUMBER PRIMARY KEY,
    descSede VARCHAR2(100),
    FechaRegistro TIMESTAMP
);
CREATE TABLE Provincia (
    idProvincia NUMBER PRIMARY KEY,
    descProvincia VARCHAR2(100),
    FechaRegistro TIMESTAMP
)

CREATE TABLE Distrito (
    idDistrito NUMBER PRIMARY KEY,
    idProvincia number,
    CONSTRAINT idProvincia  FOREIGN KEY (idProvincia)  REFERENCES Provincia(idProvincia)  ON DELETE CASCADE,
    descSede VARCHAR2(100),
    FechaRegistro TIMESTAMP
);
CREATE TABLE Hospital (
    idHospital NUMBER PRIMARY KEY,
    idDistrito number,
    Nombre VARCHAR2(100),
    Antiguedad NUMBER,
    Area NUMBER(5,2),
    idSede number,
    idGerente number,
    idCondicion number,
    FechaRegistro TIMESTAMP,
    
    CONSTRAINT idDistrito  FOREIGN KEY (idDistrito)  REFERENCES Distrito(idDistrito)  ON DELETE CASCADE,
    CONSTRAINT idSede  FOREIGN KEY (idSede)  REFERENCES Sede(idSede)  ON DELETE CASCADE,
      CONSTRAINT idGerente  FOREIGN KEY (idGerente)  REFERENCES Gerente(idGerente)  ON DELETE CASCADE,
       CONSTRAINT idCondicion  FOREIGN KEY (idCondicion )  REFERENCES Condicion(idCondicion )  ON DELETE CASCADE
);
