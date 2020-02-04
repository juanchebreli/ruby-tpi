class SaleItem < ApplicationRecord
  belongs_to :item
  belongs_to :sale

  def precioItem
    self.item.precio
  end
  
  def cancelar
    self.item.disponible
  end

end
