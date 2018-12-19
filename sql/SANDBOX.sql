--SELECT  
--       [Nome do Produto]
--      ,[Nome do Produtor]
--      ,[Documento do Produtor]
--      ,[Nome do Afiliado]
--      ,[Transação]
--      ,[Meio de Pagamento]
--      ,[Origem]
--      ,[MoedaProduto]
--      ,[Preço do Produto]
--      ,[MoedaOferta]
--      ,[Preço da Oferta]
--      ,[Taxa de Câmbio]
--      ,[MoedaOriginal]
--      ,[Preço Original]
--      ,[Número da Parcela]
--      ,[Recorrência]
--      ,[Data de Venda]
--      ,[Data de Confirmação]
--      ,[Status]
--	    ,[chave]
--      ,[Código do Produto]
--      ,[Código da Afiliação]
--      ,[Código de Oferta]
--      ,[Origem de Checkout]
--      ,[Tipo de Pagamento]
--      ,[Período Grátis]
--      ,[Tem co-produção]
--      ,[Origem da Comissão]
--      ,[Preço Total]
--      ,[Tipo pagamento oferta]
--      ,[Taxa de Câmbio Real]
--      ,[Preço Total Convertido]
--      ,[Quantidade de itens]
--      ,[Oferta de Upgrade]
--      ,[Cupom]
--  FROM [dbo].[sales_history_raw]

-------------
--PREÇOS-----
-------------
--SELECT
--      '' 
--      [Documento do Produtor],
--      [Nome do Afiliado]
--      [Nome do Produto],
--      [Código do Produto],
--      [Código da Afiliação],
--      [Código de Oferta],
--      [Tipo de Pagamento],
--      CAST([Preço Total] as float) preco_total,
--      CAST( [Preço Total Convertido] as float) preco_convertido,
--      (CAST([Preço Total] as float) - CAST( [Preço Total Convertido] as float)) as diff,
--FROM [dbo].[sales_history_raw]
 
----------------
--TRANSAÇÃO-----
----------------
--SELECT 
--   '' #
--   ,[Nome do Produto]
--   ,LEN([Transação]) tran_len
--   ,COUNT(*) t
-- FROM [dbo].[sales_history_raw]
-- WHERE [Nome do Produto] = 'Curso Equilibrio Financeiro - Turma 2'
-- GROUP BY 
-- [Nome do Produto],
--     LEN([Transação])
-- ORDER BY 2 DESC

-- SELECT 
--   *
--   ,[Nome do Produto]
--   ,LEN([Transação]) tran_len
-- FROM [dbo].[sales_history_raw]
-- WHERE [Nome do Produto] = 'Curso Equilibrio Financeiro - Turma 2'
-- ORDER BY [Transação]


----------------
------MOEDA-----
----------------
--SELECT 
--   '' #
--   ,[MoedaProduto]
--   ,[MoedaOferta]
--   ,[MoedaOriginal]
--   ,[Taxa de Câmbio]
--   ,CAST([Taxa de Câmbio] as float)
--   ,COUNT(*) t
-- FROM [dbo].[sales_history_raw]
-- GROUP BY 
--    [MoedaProduto]
--   ,[MoedaOferta]
--   ,[MoedaOriginal]
--   ,[Taxa de Câmbio]
-- ORDER BY t DESC


--SELECT 
--   '' #
--   ,[Tipo pagamento oferta]
--   ,[Status]
--  ,[Número da Parcela]
--  ,[Recorrência]
  
--   ,COUNT(*) t
-- FROM [dbo].[sales_history_raw]
-- GROUP BY 
-- [Tipo pagamento oferta]
--     ,[Status]
--    ,[Número da Parcela]
--	,[Recorrência]
	
-- ORDER BY 1,2,3 DESC

--SELECT CONVERT(datetime, '31/10/2018 18:43:41', 103)
--DROP TABLE sales_history
--SELECT [Nome do Produto] nome_produto
--      ,[Nome do Produtor] nome_produtor
--      ,[MoedaProduto] moeda_produto
--      ,CAST([Preço do Produto] AS FLOAT) preco_produto
--      ,[MoedaOferta] moeda_oferta
--      ,CAST([Preço da Oferta] AS FLOAT) preco_oferta
--      ,CAST([Taxa de Câmbio] AS FLOAT) taxa_cambio
--      ,[MoedaOriginal] moeda_original
--      ,CAST([Preço Original] AS FLOAT) preco_original
--      ,CAST([Número da Parcela] AS INT) numero_parcela
--      ,CAST([Recorrência] AS INT) recorrencia
--      ,CONVERT(datetime, [Data de Venda], 103) data_venda
--      ,CONVERT(datetime, [Data de Confirmação], 103) data_confirmacao
--      ,[Email] email
--      ,[Status] status
--      ,[chave] chave
--      ,[Código do Produto] cod_produto
--      ,[Código da Afiliação] cod_afiliacao
--      ,[Código de Oferta] cod_oferta
--      ,[Origem de Checkout] origem_checkout
--      ,[Tipo de Pagamento] tipo_pagamento
--      ,[Período Grátis] periodo_gratis
--      ,[Tem co-produção] tem_co_producao
--      ,[Origem da Comissão] origem_comissao
--      ,CAST([Preço Total] as float) preco_total
--      ,[Tipo pagamento oferta] tipo_pagto_oferta
--      ,[Taxa de Câmbio Real] taxa_cambio_real
--      ,CAST([Preço Total Convertido] as float) preco_total_convertido
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

 
















