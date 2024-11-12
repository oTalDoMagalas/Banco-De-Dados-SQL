# Passo a passo : Criação de um banco de dados
Tutorial de como criar um banco de dados SQL que organiza as informações de 'livros', 'editora', 'autores e 'assuntos'.Este guia será dividido em etapas para demonstrar desde a criação de tabelas, chaves e até manipulação/consulta de dados

## Resumo de uma estrutura SQL

*_CREATE_ para criar 'Banco de dados' ou 'Tabelas'
*_ALTER_ para adicionar ou modificar colunas
*_DROP_ para remover 'Banco de dados' ou 'Tabelas'
*_INSERT_ para adicionar registros na tabela
*_UPDATE_ para atualizar os registros
*_DELETE_ para remover os registros
*_SELECT_ para consultar e visualizar dado

## Passo 1: criação do Banco de dados e das Tabelas
### 1.1 Criação o DB

```
CREATE DATABASE biblioteca;
USE biblioteca;
```
### 1.2 Criação a Tabela 'editora'
```
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);
```
### 1.3 Criação a Tabela 'autor'
```
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(200),
    data_nacimento DATA
);
```

### 1.4 Criação a Tabela 'assunto'
```
CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_assunto VARCHAR(300),
);
```
### 1.5 Criação a Tabela 'livro'
```
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
```
### 1.6 Criação a Tabela 'Extra'
a tabela EXTRA vai servir para exemplificar a exclusão
```
CREATE TABLE extra (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50) NOT NULL,
    quantidade INT(20) NOT NULL,
    preco DOUBLE NOT NULL
);
```
## Passo 2: editar tabelas usando 'ALTER'
Após a criação da tabela, podemos adicionar novos campos. Vamos adicionar uma coluna 'email' na tabela 'autor'

```
SQL
ALTER TABLE autor
ADD COLUMN email VARCHAR(100);
```
<<<<<<< HEAD
## Passo 3: Remover tabelas usando 'DROP'
Se precisa remover uma tabela usamos o comando 'DROP'
Neste exemplo vamos remover a tabela 'extra'

```SQL
DROP TABLE extra;
```
## Passo 4: Inserindo dados usando 'INSERT'
Agora que as tabelas já estão prontas, vamos inserir dados nelas

### Passo 4.1: Inserindo dados usando 'editora'
```SQL
INSERT INTO editora(nome_editora, pais)
VALUES
('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugal'),
('Editora Bertrand Brasil', 'Brasil');
```
### Passo 4.2: Inserindo dados ba tavela 'autor'
```SQL
INSERT INTO autor(nome_autor, data_nascimento, email)
VALUES
('Jorge Aado','1912-08-10','jorginho@gmail.com'),
('Machado de Assis','1839-06-21','machadinho@gmail.com'),
('Matt Haing','1975-06-03','matt@gmail.com');
```

### Passo 4.3: Inserindo dados ba tavela 'assunto'
```SQL
INSERT INTO assunto (descricao_assunto)
VALUES
('Ficcção'),
('Mistério'),
('Terror'),
('Romance');
```
### Passo 4.4: Inserindo dados na tavela 'livro'
```SQL
INSERT INTO livro(titulo, ano_publicaçao, editora, autor, assunto)
VAlUES
('Capitães de Areia',1937,1,1,4),
('Dom Casmurra',1899,2,2,4),
('A Biblioteca da Meia-Noite',2020,3,3,2),
('Memórias Póstumas de Brás Cubas',1881,1,2,4);
```

## Passo 5: Atualizando os dados usando 'UPDATE'
Podemos atualizar os dados com o comando UPDATE.
Vamos corrigir a data de publicação do livro 'Capitães da Areia'

```SQL
UPDATE livro 
SET ano_publicaçao = 1938,
WHERE titulo = 'Capitães da Areia';
```
## Passo 6: Excluindo os dados usando 'DELETE'
Para remover os registros de uma tabela usamos o comando 'DELETE'.
Vamos excluir o livro 'Memórias Póstumas de Brás Cuba'.

```SQL
DELETE FROM livro
WHERE id_livro =4;
```

## Passo 7: Consultando os dados usando 'SELECT'
É possivel selecionar os dados para visualizar da forma como quiser.
Para isso usamos o comando 'SELECT'
## Passo 7.1: selecionar todos os livros com sua editoras e autores
Vamos usar dados das tabelas 'livros','editora','autor'e'assunto' usando o comando 'JOIN'

```SQL
SELECT  livro.titulo AS nome,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao_assunto AS tema,
        livro.ano_publicaçao AS ano
FROM livro
JOIN editora ON livro.id_editora = editora.id_editora
JOIN autor ON livro.id_autor = autor.id_autor
JOIN assunto ON livro.id_assunto = assunto.id_assunto;
```

#### Passo 7.1: selecionar todos os livros com o mesmo assunto
Para selecionar todos os livros que pertencem ao mesmo assunto, podemos fazer uma consulta utilizando o comando 'SELECT' com uma condição 'WHERE' especificando o que deseja visualizar.

```SQL
-- Consulta com filtro WHERE
SELECT  livro.titulo AS titulo,
        editora.descricao_assunto AS tema
FROM livro
join assunto ON livro.assunto = assunto.id_assunto
WHERE assunto.descricao_assunto = 'Romance';
```
