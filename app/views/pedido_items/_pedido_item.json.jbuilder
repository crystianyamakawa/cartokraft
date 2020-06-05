json.extract! pedido_item, :id, :pedido_id, :ds_produto, :produto_id, :vl_largura, :vl_comprimento, :vl_altura, :tp_papel, :tp_produto, :qt_pedido, :qt_produzido, :vl_custo, :vl_venda, :vl_total, :status, :obs, :dt_prevista, :dt_entrega, :dt_produzido, :created_by, :updated_by, :created_at, :updated_at
json.url pedido_item_url(pedido_item, format: :json)
