class ItemsController < ApplicationController
   before_action :authorize_request

   def create
      @arr = Array.new()
      @product = Product.find_by(codigo: params[:codigo])
      if(@product.nil?)
         render :status => 404
      else
         if((params[:cant].to_i) > 0)
            params[:cant].to_i.times {
            @item = Item.new(product_id: @product.id, estado: 'disponible')
            @item.save
            @arr.push(@item)
            }
         else
            render :status => 404
         end
      end
      render json: @arr
   end


end
