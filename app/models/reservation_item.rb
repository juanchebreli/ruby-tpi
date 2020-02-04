class ReservationItem < ApplicationRecord
  belongs_to :item
  belongs_to :reservation

  def vender
    self.item.vendido
  end

  def cancelar
    self.item.disponible
  end

  def precioItem
    self.item.precio
  end


end
