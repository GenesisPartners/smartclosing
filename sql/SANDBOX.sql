--SELECT [chave]
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

  SELECT 
      --,[C�digo do Produto]
      --,[C�digo da Afilia��o]
      --,[C�digo de Oferta]
      --,[Origem de Checkout]
      --,[Tipo de Pagamento]
      --,[Per�odo Gr�tis]
      --,[Tem co-produ��o]
      --,[Origem da Comiss�o]
     cast([Pre�o Total] as float) preco_total,
	 cast( [Pre�o Total Convertido] as float) preco_convertido,
	 (cast([Pre�o Total] as float) - cast( [Pre�o Total Convertido] as float)) as diff,
     

	  count(*) t
  FROM [dbo].[sales_history_raw]
  WHERE (cast([Pre�o Total] as float) - cast( [Pre�o Total Convertido] as float)) <> 0
  group by    [Pre�o Total],[Pre�o Total Convertido]
 
  order by t desc




















