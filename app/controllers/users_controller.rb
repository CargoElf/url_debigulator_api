class UsersController < ApplicationController
  
  def create
    new_user = User.new(user_params)

    if new_user.save
      message = "#{new_user.username} created"
      render json: { messages: [message] }, status: :created
    else
      render json: { messages: [new_user.errors] }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
