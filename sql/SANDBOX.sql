--SELECT [chave]
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

  SELECT 
      --,[Código do Produto]
      --,[Código da Afiliação]
      --,[Código de Oferta]
      --,[Origem de Checkout]
      --,[Tipo de Pagamento]
      --,[Período Grátis]
      --,[Tem co-produção]
      --,[Origem da Comissão]
     cast([Preço Total] as float) preco_total,
	 cast( [Preço Total Convertido] as float) preco_convertido,
	 (cast([Preço Total] as float) - cast( [Preço Total Convertido] as float)) as diff,
     

	  count(*) t
  FROM [dbo].[sales_history_raw]
  WHERE (cast([Preço Total] as float) - cast( [Preço Total Convertido] as float)) <> 0
  group by    [Preço Total],[Preço Total Convertido]
 
  order by t desc




















