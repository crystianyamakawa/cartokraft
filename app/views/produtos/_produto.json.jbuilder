json.extract! produto, :id, :name, :nr_localizador, :status, :area, :largura, :comprimento, :tp_material, :fornecedor_id, :obs, :created_by, :updated_by, :created_at, :updated_at
json.url produto_url(produto, format: :json)
