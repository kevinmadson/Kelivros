/* SQL Command To Create Database */
CREATE DATABASE IF NOT EXISTS jsfhibercrud;

/* SQL Command To Use The Database */
USE jsfhibercrud;

/* DROP Any Exisiting Table In The Database With Name As "personagem" */
DROP TABLE IF EXISTS personagem;

/* SQL Command To Create The Table In A Database */
CREATE TABLE personagem (
	id int NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Livro VARCHAR(100) NOT NULL,
	Autor VARCHAR(100) NOT NULL,
	Dinheiro int NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;