
SELECT * FROM Atores;
SELECT * FROM Filmes;
SELECT * FROM ElencoFilme;
SELECT * FROM FilmesGenero;
SELECT * FROM Generos;

--1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano FROM Filmes;

--Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano 
FROM Filmes
ORDER BY Ano;

--Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Nome = 'De Volta para o futuro';


--4 - Buscar os filmes lançados em 1997
SELECT *
FROM Filmes
WHERE Ano = 1997;

--5 - Buscar os filmes lançados APÓS o ano 2000
SELECT *
FROM Filmes
WHERE Ano > 2000
ORDER BY Ano;

--Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT *
FROM Filmes
WHERE Duracao Between 100 and 150
ORDER BY Ano;

--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT Ano, COUNT(*) as 'Quantidade de Filmes', SUM(Duracao) as 'Duração'
FROM Filmes
GROUP BY Ano
ORDER BY AVG(Duracao) desc;

-- 8- Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT * FROM Atores;

SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'M';

--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome;

--10 - Buscar o nome do filme e o gênero

SELECT Filmes.Nome, Generos.Genero
FROM Filmes
INNER JOIN Generos
ON Filmes.Id = Generos.Id;

--11 - Buscar o nome do filme e o gênero do tipo "Mistério"

SELECT Filmes.Nome, Generos.Genero
FROM Filmes
INNER JOIN Generos
ON Filmes.Id = Generos.Id 
AND Generos.Genero = 'Mistério';

--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
	Atores.PrimeiroNome as 'Nome do Ator', 
	Atores.UltimoNome as 'Sobrenome',
	Filmes.Nome as 'Nome do filme',
	ElencoFilme.Papel as 'Papel no Filme'
FROM Atores
INNER JOIN ElencoFilme ON Atores.Id = ElencoFilme.IdAtor
INNER JOIN Filmes ON Filmes.Id = ElencoFilme.IdFilme;