CREATE TABLE painelnicolas (
  idpainelnicolas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  datainicio DATETIME NULL,
  datafim DATETIME NULL,
  PRIMARY KEY(idpainelnicolas)
);

CREATE TABLE macnicolas (
  idmacnicolas VARCHAR(17) NOT NULL,
  nome VARCHAR(50) NULL,
  ativo BOOL NULL,
  PRIMARY KEY(idmacnicolas)
);

CREATE TABLE lednicolas (
  idlednicolas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  portar INTEGER UNSIGNED NULL,
  portag INTEGER UNSIGNED NULL,
  portab INTEGER UNSIGNED NULL,
  PRIMARY KEY(idlednicolas)
);

CREATE TABLE painelnicolas_has_lednicolas (
  lednicolas_idlednicolas INTEGER UNSIGNED NOT NULL,
  painelnicolas_idpainelnicolas INTEGER UNSIGNED NOT NULL,
  macnicolas_idmacnicolas VARCHAR(17) NOT NULL,
  leda INTEGER UNSIGNED NULL,
  ledg INTEGER UNSIGNED NULL,
  ledb INTEGER UNSIGNED NULL,
  INDEX painelnicolas_has_lednicolas_FKIndex1(macnicolas_idmacnicolas),
  INDEX painelnicolas_has_lednicolas_FKIndex2(painelnicolas_idpainelnicolas),
  INDEX painelnicolas_has_lednicolas_FKIndex3(lednicolas_idlednicolas),
  FOREIGN KEY(macnicolas_idmacnicolas)
    REFERENCES macnicolas(idmacnicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(painelnicolas_idpainelnicolas)
    REFERENCES painelnicolas(idpainelnicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(lednicolas_idlednicolas)
    REFERENCES lednicolas(idlednicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


