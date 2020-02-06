class Product < ApplicationRecord
   has_many :items

   validates :codigo, presence: true, uniqueness: true, format: { with: /\A(?=(?:.*\d){6})(?=(?:.*[a-zA-Z]){3})^[a-zA-Z\d]*$\z/ , message: "must be contain 3 letters and 6 digits"}, length: { is: 9 }
   validates :descripcion, presence: true, length: { maximum: 200 }
   validates_presence_of :detalle, :montoU

   def self.in_stock
      self.order(:id).limit(25).select{|product| product.items_disponibles > 0 }
   end


   def self.scarce
      self.order(:id).limit(25).select{|product| (product.items_disponibles > 0) and (product.items_disponibles < 6 )}
   end


   def self.todos
      self.order(:id).limit(25)
   end


   def items_disponibles
    (self.items.select{|item|item.estado == "disponible"}).count()
   end

   def devolver_items(cantidad)
      if (self.items_disponibles >= cantidad.to_i)
          self.items.select{|item|item.estado == "disponible"}.first(cantidad.to_i)
      end
  end
end
