class UsersController < ApplicationController
   before_action :set_user, only: [:show, :update, :destroy]
   before_action :find_user, except: %i[create index]
 
   # GET /users
   def index
     @users = User.all
 
     render json: @users
   end
 
   # GET /users/1
   def show
     render json: @user
   end
 
   # POST /users
   def create
     @user = User.new(username: params[:u], password:params[:p])
 
     if @user.save
       render json: @user, status: :created, location: @user
     else
       render json: @user.errors, status: :unprocessable_entity
     end
   end
 
   # PATCH/PUT /users/1
   def update
     if @user.update(user_params)
       render json: @user
     else
       render json: @user.errors, status: :unprocessable_entity
     end
   end
 
   # DELETE /users/1
   def destroy
     @user.destroy
   end
 
   private
     # Use callbacks to share common setup or constraints between actions.
     def set_user
       @user = User.find(params[:id])
     end
     # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
    
    def find_user
      @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
  
    def user_params
      params.permit(
        :username,:password, :password_confirmation
      )
    end
end
