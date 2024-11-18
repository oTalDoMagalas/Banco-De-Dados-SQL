CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(200),
	data_nacimento DATE
);
CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_assunto VARCHAR(300)
);
CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicaçao YEAR,
    editora INT,
    autor INT,
    assunto INT,
    FOREIGN KEY(editora) REFERENCES editora(id_editora),
    FOREIGN KEY (autor) REFERENCES autor(id_autor),
    FOREIGN KEY (assunto) REFERENCES assunto(id_assunto)
);
CREATE TABLE extra (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50) NOT NULL,
    quantidade INT(20) NOT NULL,
    preco DOUBLE NOT NULL
);
INSERT INTO editora(nome_editora, pais)
VALUES
('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugal'),
('Editora Bertrand Brasil', 'Brasil');

INSERT INTO autor(nome_autor, data_nascimento, email)
VALUES
('Jorge Aado','1912-08-10','jorginho@gmail.com'),
('Machado de Assis','1839-06-21','machadinho@gmail.com'),
('Matt Haing','1975-06-03','matt@gmail.com');

ALTER TABLE autor
ADD COLUMN email VARCHAR(100);

INSERT INTO assunto (descricao_assunto)
VALUES
('Ficcção'),
('Mistério'),
('Terror'),
('Romance');

SELECT * FROM editora;
SELECT * FROM autor;
SELECT * FROM assunto;
SELECT * FROM livro;

INSERT INTO livro(titulo, ano_publicaçao, editora, autor, assunto)
VAlUES
('Capitães de Areia',1937,1,1,4),
('Dom Casmurra',1899,2,2,4),
('A Biblioteca da Meia-Noite',2020,3,3,2),
('Memórias Póstumas de Brás Cubas',1881,1,2,4);

SELECT  livro.titulo AS nome,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao_assunto AS tema,
        livro.ano_publicaçao AS ano
FROM livro
JOIN editora ON livro.editora = editora.id_editora
JOIN autor ON livro.autor = autor.id_autor
JOIN assunto ON livro.assunto = assunto.id_assunto;

SELECT  livro.titulo AS nome,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao_assunto AS tema,
        livro.ano_publicaçao AS ano
FROM livro
JOIN editora ON livro.editora = editora.id_editora
JOIN autor ON livro.autor = autor.id_autor
JOIN assunto ON livro.assunto = assunto.id_assunto;

SELECT  livro.titulo AS titulo,
        assunto.descricao_assunto AS tema
FROM livro
join assunto ON livro.assunto = assunto.id_assunto
WHERE assunto.descricao_assunto = 'Romance';
