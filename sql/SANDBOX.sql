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
--GO
--SELECT 
--       [Transação] transacao
--      ,[Nome do Produto] nome_produto
--      ,[Nome do Produtor] nome_produtor
--      ,[MoedaProduto] moeda_produto
--      ,[MoedaOferta] moeda_oferta
--      ,CAST([Taxa de Câmbio] AS FLOAT) taxa_cambio
--      ,[MoedaOriginal] moeda_original
--      ,CAST([Número da Parcela] AS INT) numero_parcela
--      ,CAST([Recorrência] AS INT) recorrencia
--      ,CONVERT(datetime, [Data de Venda], 103) data_hora_venda
--      ,CONVERT(datetime, [Data de Confirmação], 103) data_hora_confirmacao
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
--      ,[Nome] NomeCliente
--      ,[Documento] DocumentoCliente
--      ,[Email] EmailCliente
--      ,[DDD] DddCliente
--      ,[Telefone] TelefoneCliente 
--      ,[CEP] CepCliente
--      ,[Cidade] CidadeCliente
--      ,[Estado] EstadoCliente
--      ,[Bairro] BairroCliente
--      ,[País] PaisCliente
--      ,[Endereço] EnderecoCliente
--      ,[Número] NumeroEnderecoCliente
--      ,[Complemento] ComplementoCliente
--	  ,DATEFROMPARTS(YEAR(CONVERT(datetime, [Data de Venda], 103)) , MONTH(CONVERT(datetime, [Data de Venda], 103)) , DAY(CONVERT(datetime, [Data de Venda], 103))) data_venda
--	  ,IIF([MoedaProduto] = 'BRL',
--	  CAST([Preço do Produto] AS FLOAT),
--	  CAST([Preço Original] AS FLOAT)) preco_produto
--	  ,IIF([MoedaProduto] = 'BRL',
--	  CAST([Preço da Oferta] AS FLOAT),
--	  (IIF([MoedaProduto] = 'BRL',
--	  CAST([Preço do Produto] AS FLOAT),
--	  CAST([Preço Original] AS FLOAT))*(1-0.0599)-1)) preco_original
--INTO sales_history
--FROM [dbo].[sales_history_raw]
--GO

--ALTER TABLE sales_history 
--ADD data_nf date NULL;  
--GO

--UPDATE sales_history 
--SET data_nf = DATEFROMPARTS(YEAR(data_venda) ,MONTH(data_venda), DAY(data_venda))
--WHERE MONTH(data_venda) < 12

--UPDATE sales_history 
--SET data_nf = DATEFROMPARTS(YEAR(data_venda) + 1 , 1 , DAY(data_venda))
--WHERE MONTH(data_venda) = 12


--ALTER TABLE sales_history 
--ADD comissao_hotmart float NULL;  
--GO

--UPDATE sales_history 
--SET comissao_hotmart = IIF(preco_original > preco_produto, preco_produto*(-0.0599)-1,preco_original - preco_produto)


--ALTER TABLE sales_history 
--ADD recalculo_custo float NULL;  
--GO

--UPDATE sales_history 
--SET recalculo_custo = -preco_produto * 0.0599 - 1


--ALTER TABLE sales_history 
--ADD id_curso varchar(255) null;  
--GO

 --SELECT 
 --a.nome_produto
 --,count(*) t
 --FROM [dbo].[sales_history] a
 -- GROUP BY 
 --a.nome_produto
 --order by 1 desc

 --SELECT * from sales_history where id_curso is null

 --UPDATE sales_history
 --SET id_curso = NULL

 --UPDATE sales_history
 --SET id_curso = b.id_curso
 --FROM  sales_history a
 --LEFT JOIN id_curso_lookup b ON a.nome_produto = b.nome_produto


 --UPDATE sales_history
 --SET id_curso = b.id_curso
 --FROM  sales_history a
 --INNER JOIN email_curso_lookup b ON a.email = b.email
 --WHERE (a.id_curso is null)


 --UPDATE sales_history
 --SET id_curso = 'IF1'
 --WHERE transacao = '4414736826644108'




 --SELECT transacao, nome_produto, email, id_curso 
 --from sales_history
 --where id_curso is null

--ALTER TABLE sales_history 
--ADD ano int null,
--mes_ano varchar(255) null;  
--GO

-- UPDATE sales_history
-- SET ano = YEAR(data_nf)

--UPDATE sales_history
--SET mes_ano = CAST(YEAR(data_nf) as varchar(4)) + '-' + CAST(MONTH(data_nf) as varchar(2))

--select distinct ano from sales_history
 















