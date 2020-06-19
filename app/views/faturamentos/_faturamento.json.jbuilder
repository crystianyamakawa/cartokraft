json.extract! faturamento, :id, :dt_fechamento, :vl_vendas, :vl_custo, :vl_bruto, :vl_despesa, :vl_liquido, :created_at, :updated_at
json.url faturamento_url(faturamento, format: :json)
