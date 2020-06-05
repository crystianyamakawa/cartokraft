json.extract! pedido, :id, :nm_cliente, :cliente_id, :vl_pedido, :status, :dt_prevista, :obs, :created_by, :updated_by, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
