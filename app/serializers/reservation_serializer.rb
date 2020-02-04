class ReservationSerializer < ActiveModel::Serializer
	attributes :id, :fecha, :client_id, :user_id,:total, :items, :sale

	def items
		@items = {}
		object.reservation_items.each{|ri|@items.merge!({"#{ri.item_id}": {"estado": "#{ri.item.estado}","product_id": "#{ri.item.product_id}","created_at": "#{ri.item.created_at}","updated_at": "#{ri.item.updated_at}"}})}
		@items
	end

	def total
		object.monto_total
	 end

	 def sale
		@sale=Sale.find_by(reservation_id: object.id)
	 end
  
end