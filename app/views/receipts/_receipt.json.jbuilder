json.extract! receipt, :id, :name, :type, :partner_id, :entrega_id, :amount_scheduled, :status, :date_scheduled, :date_executed, :ammount_executed, :obs, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
