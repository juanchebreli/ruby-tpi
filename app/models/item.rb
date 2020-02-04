class Item < ApplicationRecord
  belongs_to :product


  def reservado
    self.estado = "reservado"
    self.save
  end

  def disponible
    self.estado = "disponible"
    self.save
  end

  def vendido
    self.estado = "vendido"
    self.save
  end
  
end
