/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
id_curso
--,YEAR(data_nf) ANO
,CAST(SUM(preco_produto) as money)
FROM [dbo].[sales_history]
--WHERE id_curso = 'EF1'
GROUP BY 
id_curso
--,YEAR(data_nf)
ORDER BY 1

SELECT transacao, id_curso, email, data_nf, preco_produto, comissao_hotmart
FROM [dbo].[sales_history]
ORDER BY 1

SELECT id_curso
,MONTH(data_nf) MES
,CAST(SUM(preco_produto) as money)
FROM [dbo].[sales_history]
WHERE id_curso = 'EF1'
AND YEAR(data_nf) = 2018
GROUP BY id_curso , MONTH(data_nf)
ORDER BY 2