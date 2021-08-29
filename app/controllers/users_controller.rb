class UsersController < ApplicationController
  def index
    messages = []
    messages << "Hello"
    render json: { messages: messages }.to_json, status: :ok
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      message = "#{new_user.username} created"
      render json: { messages: [message] }.to_json, status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
