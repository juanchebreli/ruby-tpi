class SaleSerializer < ActiveModel::Serializer
	attributes :id, :fecha, :client_id, :user_id, :reservation_id, :total, :items

	def items
		@items = {}
		object.sale_items.each{|ri|@items.merge!({"#{ri.item_id}": {"estado": "#{ri.item.estado}","product_id": "#{ri.item.product_id}","created_at": "#{ri.item.created_at}","updated_at": "#{ri.item.updated_at}"}})}
		@items
   end

   def total
		object.monto_total
	 end

end