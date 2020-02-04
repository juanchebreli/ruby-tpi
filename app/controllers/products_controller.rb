class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authorize_request

  # GET /products
  def productos
    @param = params[:filter]
    case @param
      when 'in_stock'
        @products = Product.in_stock
      when 'scarce'
        @products = Product.scarce
      when 'all'
        @products = Product.todos
      else
        @products = Product.in_stock
      end
    render json: @products, status: :ok
  end

  # GET /products/1
  def codigo
    @product = Product.find_by(codigo: params[:codigo])
    if @product.nil?
      render :status => 404
    else
      render json: @product
    end
  end
  
  def all
    render json: Product.all
  end

  def items
    @product = Product.find_by(codigo: params[:codigo])
    if @product.nil?
      render :status => 404
    else
      render json: @product.items
    end
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:codigo, :descripcion, :montoU, :detalle)
    end
end