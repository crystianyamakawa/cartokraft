class AlterClientes < ActiveRecord::Migration[5.0]
  def change
    add_column("clientes","nm_contato",:string, :after => "name")
    add_column("clientes","nr_telefone",:string, :after => "nm_contato")
    add_column("clientes","nr_celular",:string, :after => "nr_telefone")


  end
end
