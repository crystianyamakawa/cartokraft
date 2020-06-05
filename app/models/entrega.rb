class Entrega < ApplicationRecord
  belongs_to :cliente
  belongs_to :receipt

  has_many :entrega_items, :dependent => :destroy
  accepts_nested_attributes_for :entrega_items, :reject_if => lambda { |a| a[:quantidade].blank? },  :allow_destroy => true
  usar_como_dinheiro :vl_total

  enum status: ['Orçamento', 'Pedido', 'Em Produção', 'A Entregar', 'Entregue', 'CARTOPAR']
end
