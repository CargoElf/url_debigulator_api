class LinksController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: :create

  def create
    user = authenticate_user
    link = Link.find_by_url_or_make_new_link(new_link_params[:url])

    if link.persisted?
      render json: { messages: [link.return_url] }, status: :ok
    elsif link.valid?
      user.links << link
      link.set_short_url

      render json: { messages: [link.return_url] }, status: :created
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
end
