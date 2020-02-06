class SaleItem < ApplicationRecord
  belongs_to :item
  belongs_to :sale

  
  def cancelar
    self.item.disponible
  end

end
