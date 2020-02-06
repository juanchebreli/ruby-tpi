class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :reservation_items
  validates_presence_of :fecha, :state

  def add_items(producto,cantidad)
    @product = Product.find_by(codigo:producto)
    if(@product.devolver_items(cantidad).nil?)
      {"#{@product.codigo}": "cantidad de items insuficientes"}
    else
      (@product.devolver_items(cantidad)).each{|item|
        item.reservado()
        ReservationItem.create(reservation_id: self.id , item_id: item.id, price: item.precio)}
        nil
    end
  end

  def vender()
    self.state = FALSE
    self.save
  end

  def cancelar()
    if(state)
      self.reservation_items.each{|reservation_item|reservation_item.cancelar}
      self.reservation_items.destroy_all
    end
  end

  def monto_total
    total = 0
    self.reservation_items.each do |reservation_item|
      total = total+reservation_item.price
    end
    total
  end

  def nombre_cliente
    client.nombre
  end
end
