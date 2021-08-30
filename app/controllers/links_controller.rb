class LinksController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: :create

  def create
    user = authenticate_user
    link = Link.find_by_original_url(new_link_params[:url]) || Link.new(original_url: new_link_params[:url])

    if link.persisted?
      render jason: { messages: [return_url(link.short_url)] }, status: :ok
    elsif link.valid?
      user.links << link
      link.set_short_url

      render json: { messages: [return_url(link.short_url)] }, status: :created
    else
      render json: { message: ['incorrect params'] }, status: :unprocessable_entity
    end
  end

  private

  def authenticate_user
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    User.find(user_id)
  rescue ActiveRecord::RecordNotFound
    render status: :unauthorized
  end

  def new_link_params
    params.permit(:url)
  end

  def return_url(short_url)
    'localhost:3000/' + short_url
  end
end

#curl --header "Content-Type: application/json" --request POST --data '{ "authenticate": { "username": "bob", "password": "1234" } }' localhost:3000/authenticate
#curl --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.ylpztta5CnepOvMn0Vl7UZOqzERIGleFWuirNiH8ILs" --header "Content-Type: application/json" --request POST --data '{ "url": "https://amazon.com" }' localhost:3000/link
