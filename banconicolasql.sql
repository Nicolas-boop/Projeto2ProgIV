CREATE TABLE macnicolas (
  idmacnicolas VARCHAR(17) NOT NULL,
  nome VARCHAR(50) NULL,
  ativo BOOL NULL,
  pinoR INTEGER UNSIGNED NULL,
  pinoG INTEGER UNSIGNED NULL,
  pinoB INTEGER UNSIGNED NULL,
  PRIMARY KEY(idmacnicolas)
);

CREATE TABLE painelnicolas (
  idpainelnicolas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  macnicolas_idmacnicolas VARCHAR(17) NOT NULL,
  nome VARCHAR(50) NULL,
  datainicio DATETIME NULL,
  datafim DATETIME NULL,
  linhaum VARCHAR(255) NULL,
  linhadois VARCHAR(255) NULL,
  PRIMARY KEY(idpainelnicolas),
  INDEX painelnicolas_FKIndex1(macnicolas_idmacnicolas),
  FOREIGN KEY(macnicolas_idmacnicolas)
    REFERENCES macnicolas(idmacnicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE painelnicolas_has_lednicolas (
  painelnicolas_idpainelnicolas INTEGER UNSIGNED NOT NULL,
  ledA INTEGER UNSIGNED NULL,
  ledG INTEGER UNSIGNED NULL,
  ledB INTEGER UNSIGNED NULL,
  PRIMARY KEY(painelnicolas_idpainelnicolas),
  INDEX painelnicolas_has_lednicolas_FKIndex1(painelnicolas_idpainelnicolas),
  FOREIGN KEY(painelnicolas_idpainelnicolas)
    REFERENCES painelnicolas(idpainelnicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


