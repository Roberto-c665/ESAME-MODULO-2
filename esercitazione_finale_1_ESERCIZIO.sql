USE CambiaNome;
/*1. Verificare che i campi definiti come PK siano univoci.*/
SELECT COUNT(*) FROM Product;									/*Conta del numero dei record (106)*/
SELECT COUNT(DISTINCT(ProductID)) FROM Product;					/*Conta del numero dei record senza duplicati: se l'istruzione di questa riga senza duplicati restituisce lo 
																stesso numero della precedente. Per definizione, la PRIMARY KEY non ammette valori NULL e/o dupliicati*/

/*2. Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.*/ 
SELECT s.ProductID AS Prod, YEAR(s.SaleDate) AS Anno, ROUND(SUM(s.Quantity * s.Price), 2) AS Fatturato		/*ROUND = arrotonda; SUM = somma*/
FROM sales s
GROUP BY Anno , Prod
ORDER BY ProductID, Anno
;

/*3. Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.*/
SELECT 
CountryID AS Stato,
YEAR(SaleDate) AS Anno,								/*YEAR = Anno*/
ROUND(SUM(Price*Quantity),2) AS Total
FROM sales
WHERE SaleDate BETWEEN '2019-01-01' AND '2023-12-31'
GROUP BY Stato, Anno
ORDER BY Stato, Anno;

/*4. Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?*/
-- Se desidero l'elenco ordinato allora :
	SELECT p.Category  AS Cat,
	SUM(s.Quantity) AS Qta
	FROM sales AS s
	INNER JOIN product AS p ON s.ProductID = p.ProductID
	GROUP BY Cat
	ORDER BY Qta DESC;										/*DESC = discendente*/
    
-- Se invece desidero un solo risultato
	SELECT p.Category  AS Cat,
	SUM(s.Quantity) AS Qta
	FROM sales AS s
	INNER JOIN product AS p ON s.ProductID = p.ProductID
	GROUP BY Cat
	ORDER BY Qta DESC
    LIMIT 1;

/*5. Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti.*/ 
SELECT ProductID							/*Approccio 1: verifico che Product ID sia nella tabella Product ma NON nella tabella Sales*/
FROM Product
WHERE ProductID NOT IN(
SELECT ProductID
FROM Sales
);

USE cambianome;								/*Approccio 2: Sfrutto una JOIN*/
SELECT p.ProductID 				
FROM Product p
LEFT JOIN sales s ON s.ProductID = p.ProductID
WHERE s.SaleDate IS NULL
; 
    
/*6. Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente).*/

SELECT s.productID, MAX(SaleDate) as highest, p.ProdName	/*MAX = Valore Massimo*/
FROM sales s
JOIN product p  ON p.ProductID = s.ProductID
GROUP BY s.productID, p.ProdName
ORDER BY s.productID
;

