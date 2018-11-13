class UsersController < ApplicationController
  
  def index
    
    if request.query_string.present?
      users = User.all
      params.each do |key, v|
        next if key == "controller" || key == "action"
        v = v.split(',')
        users = User.where("#{key}": v)
      end
      render json: users
    else
      users = User.all
      render json: users
    end
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end
  
  def destroy
    user = User.find(params[:id])
    user.delete
    render json: user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username)
  end
end