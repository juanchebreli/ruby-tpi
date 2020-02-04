class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :reservation , optional:true
  has_many :sale_items

  def nombre_cliente
    client.nombre
  end

  def monto_total
    total = 0
    sale_items.each do |sale_item|
      total = total+sale_item.precioItem
    end
    total
  end

  def add_items(producto,cantidad)
    @product = Product.find_by(codigo:producto)
    if(@product.devolver_items(cantidad).nil?)
      {"#{@product.codigo}": "cantidad de items insuficientes"}
    else
      (@product.devolver_items(cantidad)).each{|item|
        item.vendido()
        SaleItem.create(sale_id: self.id,item_id:item.id)}
        nil
    end
  end

  def add_items_reservation(reservation_items)
    reservation_items.each{ |reservation_item|
      reservation_item.vender
      @saleItem= SaleItem.create(sale_id:self.id,item_id:(reservation_item.item_id))}
  end

  def cancelar()
    self.sale_items.each{|sale_item|sale_item.cancelar}
    self.sale_items.destroy_all
  end


end
