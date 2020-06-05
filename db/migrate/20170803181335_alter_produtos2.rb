class AlterProdutos2 < ActiveRecord::Migration[5.0]
  def change
    add_column("produtos","altura",:float, :after => "comprimento")
    add_column("produtos","perda",:float, :after => "altura")
    add_column("produtos","qt_chapa",:integer, :after => "perda")
    add_column("materials","gramatura",:float, :after => "comprimento")
    add_column("materials","espessura",:float, :after => "gramatura")

  end
end
