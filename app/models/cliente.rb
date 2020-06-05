class Cliente < ApplicationRecord
  has_many :cliente_produtos, :dependent => :destroy
  has_many :produtos  

  # accepts_nested_attributes_for :entrega_items, :reject_if => lambda { |a| a[:quantidade].blank? },  :allow_destroy => true
  # usar_como_dinheiro :vl_total
end
