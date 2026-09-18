CREATE TABLE macnicolas (
  idmacnicolas VARCHAR(17)  NOT NULL  ,
  nome VARCHAR(35)  NULL  ,
  ativo BOOL  NULL    ,
PRIMARY KEY(idmacnicolas));



CREATE TABLE painelnicolas (
  idpainelnicolas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(50)  NULL  ,
  datainicio DATETIME  NULL  ,
  datafim DATETIME  NULL    ,
PRIMARY KEY(idpainelnicolas));



CREATE TABLE lednicolas (
  idlednicolas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(35)  NULL  ,
  pinor INTEGER UNSIGNED  NULL  ,
  pinog INTEGER UNSIGNED  NULL  ,
  pinob INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idlednicolas));



CREATE TABLE combinanicolas (
  idcombinanicolas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  lednicolas_idlednicolas INTEGER UNSIGNED  NOT NULL  ,
  painelnicolas_idpainelnicolas INTEGER UNSIGNED  NOT NULL  ,
  macnicolas_idmacnicolas VARCHAR(17)  NOT NULL  ,
  ledr INTEGER UNSIGNED  NULL  ,
  ledg INTEGER UNSIGNED  NULL  ,
  ledb INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idcombinanicolas)  ,
INDEX combinanicolas_FKIndex1(lednicolas_idlednicolas)  ,
INDEX combinanicolas_FKIndex2(painelnicolas_idpainelnicolas)  ,
INDEX combinanicolas_FKIndex3(macnicolas_idmacnicolas),
  FOREIGN KEY(lednicolas_idlednicolas)
    REFERENCES lednicolas(idlednicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(painelnicolas_idpainelnicolas)
    REFERENCES painelnicolas(idpainelnicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(macnicolas_idmacnicolas)
    REFERENCES macnicolas(idmacnicolas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




