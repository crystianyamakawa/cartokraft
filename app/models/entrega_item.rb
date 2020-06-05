class EntregaItem < ApplicationRecord
  belongs_to :entrega
  belongs_to :produto
  usar_como_dinheiro :vl_total, :vl_unitario
  before_save :set_vl_produtos, on: [ :create, :update ]

  private

   def set_vl_produtos
     puts "callback set_vlcusto"

      if self.vl_custo.blank? || self.vl_custo ==""
        self.vl_custo = self.produto.vl_custo
      end
      if self.vl_unitario.blank? || self.vl_unitario ==""
        puts "self.produto.vl_venda"
        puts self.produto.vl_venda
        self.vl_unitario = self.produto.vl_venda
        self.vl_total = self.produto.vl_venda * self.quantidade
      end
   end
end
