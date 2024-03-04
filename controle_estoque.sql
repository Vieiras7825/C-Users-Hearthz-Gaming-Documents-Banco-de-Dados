create DATABASE controle_estoque;

use controle_estoque;

CREATE TABLE Produtos (
  codigo_produto INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT,
  preco_compra DECIMAL(10, 2) NOT NULL,
  preco_venda DECIMAL(10, 2) NOT NULL,
  quantidade_estoque INT(11) NOT NULL,
  PRIMARY KEY (codigo_produto)
);

CREATE TABLE Fornecedores (
  codigo_fornecedor INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  contato VARCHAR(50) NOT NULL,
  endereco TEXT NOT NULL,
  PRIMARY KEY (codigo_fornecedor)
);

CREATE TABLE Entradas_Estoque (
  codigo_entrada INT(11) NOT NULL AUTO_INCREMENT,
  codigo_produto INT(11) NOT NULL,
  quantidade INT(11) NOT NULL,
  data DATETIME NOT NULL,
  PRIMARY KEY (codigo_entrada),
  FOREIGN KEY (codigo_produto) REFERENCES Produtos(codigo_produto)
);

CREATE TABLE Saidas_Estoque (
  codigo_saida INT(11) NOT NULL AUTO_INCREMENT,
  codigo_produto INT(11) NOT NULL,
  quantidade INT(11) NOT NULL,
  data DATETIME NOT NULL,
  PRIMARY KEY (codigo_saida),
  FOREIGN KEY (codigo_produto) REFERENCES Produtos(codigo_produto)
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
	'Vinicius', 'Dias', '1997-10-15'
), (
	'Patricia', 'Freitas', '1986-10-25'
), (
	'Diogo', 'Oliveira', '1984-08-27'
), (
	'Maria', 'Rosa', '1985-01-01'
);

INSERT INTO categoria (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');

INSERT INTO curso (nome, categoria_id) VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);
	
INSERT INTO aluno_curso VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);




