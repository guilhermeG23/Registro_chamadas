create database if not exists impressoras_geral;

use impressoras_geral;

create table if not exists empresa (
  ID_Empresa int not null primary key auto_increment,
  Empresa varchar(255) not null
);

create table if not exists marca (
  ID_Marca int not null primary key auto_increment,
  Marca varchar(255) not null
);

create table if not exists local (
  ID_Local int not null primary key auto_increment,
  Local varchar(255) not null
);

create table if not exists tipo (
  ID_Tipo int not null primary key auto_increment,
  Tipo varchar(255) not null
);

create table if not exists status (
  ID_Status int not null primary key auto_increment,
  Status varchar(255) not null
);

create table if not exists impressoras (
  ID_Impressora int not null primary key auto_increment,
  Serial varchar(44) not null,
  PK_Marca int not null,
  Modelo varchar(255) not null,
  PK_Tipo int not null,
  PK_Empresa int not null
);

create table if not exists historico (
  ID_Revisao int not null primary key auto_increment,
  PK_Impressora int not null,
  PK_Local int not null,
  PK_Status int not null,
  IP_Impressora varchar(255) not null,
  Descricao varchar(255) not null,
  Data datetime not null
);

create table demonstracao (
  ID_Demonstracao int not null primary key auto_increment,
  PK_Impressora int not null,
  PK_Revisao int not null
);

alter table impressoras add constraint PK_Marca FOREIGN KEY (PK_Marca) REFERENCES marca(ID_Marca); 
alter table impressoras add constraint PK_Empresa FOREIGN KEY (PK_Empresa) REFERENCES empresa(ID_Empresa); 
alter table historico add constraint PK_Impressora FOREIGN key (PK_Impressora) REFERENCES impressoras(ID_Impressora);
alter table historico add constraint PK_Local FOREIGN key (PK_Local) REFERENCES local(ID_Local);
alter table historico add constraint PK_Status FOREIGN key (PK_Status) REFERENCES status(ID_Status);
alter table demonstracao add constraint PK_Impressora FOREIGN KEY (PK_Impressora) REFERENCES impressoras(ID_Impressora); 
alter table demonstracao add constraint PK_Revisao FOREIGN KEY (PK_Revisao) REFERENCES historico(ID_Revisao); 
