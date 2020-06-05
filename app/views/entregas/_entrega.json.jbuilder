json.extract! entrega, :id, :venda_id, :cliente_id, :vl_total, :status, :dt_entrega, :obs, :nr_notafiscal, :created_by, :updated_by, :created_at, :updated_at
json.url entrega_url(entrega, format: :json)
