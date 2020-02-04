class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /reservations
  def index
    @reservations = Reservation.where(state: TRUE)

    render json: (@reservations.collect{|reservation|{fecha:reservation.fecha,nombre: reservation.nombre_cliente, monto_total: reservation.monto_total }})
  end

  # GET /reservations/1
  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation, serializer: ReservationSerializer
  end

  # POST /reservations
  def create
    @productos = params[:productos]
    @cliente_id = params[:cliente_id]
    @user_id = @current_user.id
    @reservation = Reservation.create(client_id:@cliente_id,user_id:@user_id, fecha: Time.now, state:TRUE) 
    @detalle = {}
    @productos.each do |producto, cantidad|
      @var=(@reservation.add_items(producto,cantidad))
      if !@var.nil?
        @detalle.merge!(@var)
      end
    end
    if @detalle.empty?
      render json: @reservation
    else
      @reservation.cancelar
      @reservation.destroy
      render json: @detalle
    end
  end


  def sale
    @reservation= Reservation.find(params[:id])
    if (@reservation.state == TRUE)
      @reservation.vender()
      @sale= Sale.create(client_id:@reservation.client_id,user_id: @reservation.user_id, fecha: Time.now, reservation_id:@reservation.id)
      @sale.add_items_reservation(@reservation.reservation_items)
      render json: @sale
    end
  end

  # DELETE /reservations/1
  def cancelar
    @reservation = Reservation.find(params[:id])
    if @reservation.state
      @reservation.cancelar()
      @reservation.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:fecha, :client_id, :user_id)
    end
end
