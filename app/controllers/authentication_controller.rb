class AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def create
    params.require(:username)
    params.require(:password)

  end

  private

  def authenticate_params
    params.require(:username)
    params.require(:password)
  end

  def parameter_missing(e)
    p 'I rans'
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
