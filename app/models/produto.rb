class Produto < ApplicationRecord
  belongs_to :cliente
  belongs_to :material

  usar_como_dinheiro :vl_venda, :vl_custo

end
