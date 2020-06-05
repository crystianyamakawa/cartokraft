json.extract! entrega_item, :id, :entrega_id, :produto_id, :quantidade, :vl_unitario, :vl_total, :status, :obs, :created_by, :updated_by, :created_at, :updated_at
json.url entrega_item_url(entrega_item, format: :json)
