/* SQL Command To Create Database */
CREATE DATABASE IF NOT EXISTS jsfhibercrud;

/* SQL Command To Use The Database */
USE jsfhibercrud;

/* DROP Any Exisiting Table In The Database With Name As "autor" */
DROP TABLE IF EXISTS autor;

/* SQL Command To Create The Table In A Database */
CREATE TABLE autor (
	id int NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Livro VARCHAR(100) NOT NULL,
    Ano int NOT NULL,
    VendasM float NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;