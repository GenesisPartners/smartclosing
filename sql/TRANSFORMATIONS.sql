/****** Script for SelectTopNRows command from SSMS  ******/
--DELETE FROM   [dbo].[sales_history_raw]

SELECT
       [Nome do Produto]
      ,[Nome do Produtor]
      ,[Documento do Produtor]
      ,[Nome do Afiliado]
      ,[Transação]
      ,[Meio de Pagamento]
      ,[Origem]
      ,[MoedaProduto]
      ,[Preço do Produto]
      ,[MoedaOferta]
      ,[Preço da Oferta]
      ,[Taxa de Câmbio]
      ,[MoedaOriginal]
      ,[Preço Original]
      ,[Número da Parcela]
      ,[Recorrência]
      ,[Data de Venda]
      ,[Data de Confirmação]
      ,[Status]
      ,[chave]
      ,[Código do Produto]
      ,[Código da Afiliação]
      ,[Código de Oferta]
      ,[Origem de Checkout]
      ,[Tipo de Pagamento]
      ,[Período Grátis]
      ,[Tem co-produção]
      ,[Origem da Comissão]
      ,[Preço Total]
      ,[Tipo pagamento oferta]
      ,[Taxa de Câmbio Real]
      ,[Preço Total Convertido]
      ,[Quantidade de itens]
  FROM [dbo].[sales_history_raw]