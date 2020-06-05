class Receipt < ApplicationRecord
  belongs_to :cliente
  has_many :entregas
    enum status: ['Programado', 'Executado', 'Cancelado']
    enum type: ["Venda", "Aporte", "Credito"]

end
