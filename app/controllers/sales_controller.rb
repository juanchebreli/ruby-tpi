class SalesController < ApplicationController
   before_action :set_sale, only: [:show, :update, :destroy]
   before_action :authorize_request
 
   # GET /sales
   def sales
      @sales=Sale.all
      @sales= @sales.select{|sale|sale.user_id == @current_user.id}
      render json: (@sales.collect{|sale|{venta:{fecha:sale.fecha,nombre: sale.nombre_cliente, monto_total: sale.monto_total }}})
   end
   
   # GET /sales/1
   def show
     @sale = Sale.find(params[:id])
     if (@sale.user_id == @current_user.id)
       render json: @sale , serializer: SaleSerializer
     else
       render :status => 404
     end
   end
 
   # POST /sales
  def create
    @productos = params[:productos]
    @cliente_id = params[:cliente_id]
    @user_id = @current_user.id
    @sale = Sale.create(client_id:@cliente_id,user_id:@user_id, fecha: Time.now) 
    @detalle = {}
    @productos.each do |producto, cantidad|
      @var=(@sale.add_items(producto,cantidad))
      if !@var.nil?
        @detalle.merge!(@var)
      end
    end
    if @detalle.empty?
      render json: @sale
    else
      @sale.cancelar
      @sale.destroy
      render json: @detalle
    end
  end

 

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_sale
       @sale = Sale.find(params[:id])
     end
 
     # Only allow a trusted parameter "white list" through.
     def sale_params
       params.require(:sale).permit(:fecha, :client_id, :user_id, :reservation_id)
     end
end
