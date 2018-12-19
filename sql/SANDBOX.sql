--SELECT  
--       [Nome do Produto]
--      ,[Nome do Produtor]
--      ,[Documento do Produtor]
--      ,[Nome do Afiliado]
--      ,[Transa��o]
--      ,[Meio de Pagamento]
--      ,[Origem]
--      ,[MoedaProduto]
--      ,[Pre�o do Produto]
--      ,[MoedaOferta]
--      ,[Pre�o da Oferta]
--      ,[Taxa de C�mbio]
--      ,[MoedaOriginal]
--      ,[Pre�o Original]
--      ,[N�mero da Parcela]
--      ,[Recorr�ncia]
--      ,[Data de Venda]
--      ,[Data de Confirma��o]
--      ,[Status]
--	    ,[chave]
--      ,[C�digo do Produto]
--      ,[C�digo da Afilia��o]
--      ,[C�digo de Oferta]
--      ,[Origem de Checkout]
--      ,[Tipo de Pagamento]
--      ,[Per�odo Gr�tis]
--      ,[Tem co-produ��o]
--      ,[Origem da Comiss�o]
--      ,[Pre�o Total]
--      ,[Tipo pagamento oferta]
--      ,[Taxa de C�mbio Real]
--      ,[Pre�o Total Convertido]
--      ,[Quantidade de itens]
--      ,[Oferta de Upgrade]
--      ,[Cupom]
--  FROM [dbo].[sales_history_raw]

-------------
--PRE�OS-----
-------------
--SELECT
--      '' 
--      [Documento do Produtor],
--      [Nome do Afiliado]
--      [Nome do Produto],
--      [C�digo do Produto],
--      [C�digo da Afilia��o],
--      [C�digo de Oferta],
--      [Tipo de Pagamento],
--      CAST([Pre�o Total] as float) preco_total,
--      CAST( [Pre�o Total Convertido] as float) preco_convertido,
--      (CAST([Pre�o Total] as float) - CAST( [Pre�o Total Convertido] as float)) as diff,
--FROM [dbo].[sales_history_raw]
 
----------------
--TRANSA��O-----
----------------
--SELECT 
--   '' #
--   ,[Nome do Produto]
--   ,LEN([Transa��o]) tran_len
--   ,COUNT(*) t
-- FROM [dbo].[sales_history_raw]
-- WHERE [Nome do Produto] = 'Curso Equilibrio Financeiro - Turma 2'
-- GROUP BY 
-- [Nome do Produto],
--     LEN([Transa��o])
-- ORDER BY 2 DESC

-- SELECT 
--   *
--   ,[Nome do Produto]
--   ,LEN([Transa��o]) tran_len
-- FROM [dbo].[sales_history_raw]
-- WHERE [Nome do Produto] = 'Curso Equilibrio Financeiro - Turma 2'
-- ORDER BY [Transa��o]


----------------
------MOEDA-----
----------------
--SELECT 
--   '' #
--   ,[MoedaProduto]
--   ,[MoedaOferta]
--   ,[MoedaOriginal]
--   ,[Taxa de C�mbio]
--   ,CAST([Taxa de C�mbio] as float)
--   ,COUNT(*) t
-- FROM [dbo].[sales_history_raw]
-- GROUP BY 
--    [MoedaProduto]
--   ,[MoedaOferta]
--   ,[MoedaOriginal]
--   ,[Taxa de C�mbio]
-- ORDER BY t DESC


--SELECT 
--   '' #
--   ,[Tipo pagamento oferta]
--   ,[Status]
--  ,[N�mero da Parcela]
--  ,[Recorr�ncia]
  
--   ,COUNT(*) t
-- FROM [dbo].[sales_history_raw]
-- GROUP BY 
-- [Tipo pagamento oferta]
--     ,[Status]
--    ,[N�mero da Parcela]
--	,[Recorr�ncia]
	
-- ORDER BY 1,2,3 DESC

--SELECT CONVERT(datetime, '31/10/2018 18:43:41', 103)
--DROP TABLE sales_history
--SELECT [Nome do Produto] nome_produto
--      ,[Nome do Produtor] nome_produtor
--      ,[MoedaProduto] moeda_produto
--      ,CAST([Pre�o do Produto] AS FLOAT) preco_produto
--      ,[MoedaOferta] moeda_oferta
--      ,CAST([Pre�o da Oferta] AS FLOAT) preco_oferta
--      ,CAST([Taxa de C�mbio] AS FLOAT) taxa_cambio
--      ,[MoedaOriginal] moeda_original
--      ,CAST([Pre�o Original] AS FLOAT) preco_original
--      ,CAST([N�mero da Parcela] AS INT) numero_parcela
--      ,CAST([Recorr�ncia] AS INT) recorrencia
--      ,CONVERT(datetime, [Data de Venda], 103) data_venda
--      ,CONVERT(datetime, [Data de Confirma��o], 103) data_confirmacao
--      ,[Email] email
--      ,[Status] status
--      ,[chave] chave
--      ,[C�digo do Produto] cod_produto
--      ,[C�digo da Afilia��o] cod_afiliacao
--      ,[C�digo de Oferta] cod_oferta
--      ,[Origem de Checkout] origem_checkout
--      ,[Tipo de Pagamento] tipo_pagamento
--      ,[Per�odo Gr�tis] periodo_gratis
--      ,[Tem co-produ��o] tem_co_producao
--      ,[Origem da Comiss�o] origem_comissao
--      ,CAST([Pre�o Total] as float) preco_total
--      ,[Tipo pagamento oferta] tipo_pagto_oferta
--      ,[Taxa de C�mbio Real] taxa_cambio_real
--      ,CAST([Pre�o Total Convertido] as float) preco_total_convertido
--      ,CAST([Quantidade de itens] as int) quant_itens
--INTO sales_history
--FROM [dbo].[sales_history_raw]
 
 SELECT 
 a.nome_produto
 ,count(*) t
 FROM [dbo].[sales_history] a
  GROUP BY 
 a.nome_produto
 order by 1 desc

SELECT * FROM
 (SELECT 
 a.nome_produto
 ,b.id_curso
 ,COUNT(*) t
 FROM [dbo].[sales_history] a
 LEFT JOIN id_curso_lookup b ON a.nome_produto = b.nome_produto
 GROUP BY 
 a.nome_produto
 ,b.id_curso)
 WHERE id_curso = NULL 


 SELECT 
 a.nome_produto
 ,b.id_curso
 --,c.email
 ,c.id_curso
 ,COUNT(*) t
 FROM [dbo].[sales_history] a
 LEFT JOIN id_curso_lookup b ON a.nome_produto = b.nome_produto
 LEFT JOIN email_curso_lookup c ON (a.email = c.email)
 GROUP BY 
 a.nome_produto
 ,b.id_curso
 ,c.id_curso
 ORDER BY 1 DESC

 SELECT 
 email,
 id_curso,
 count(*) t
 FROM email_curso_lookup
 group by email,
 id_curso
 order by 1

 
















