class AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def create
    user = User.find_by_username(authenticate_params[:username])

    if user&.authenticate(authenticate_params[:password])
      token = AuthenticationTokenService.encode(user.id)

      render json: { token: token }, status: :created
    else
      render(
        json: {
            messeges: ['incorrect username or password']
          },
          response: :forbiden
        )
    end
  end

  private

  def authenticate_params
    params.require(:authenticate).permit(:username, :password)
  end

  def parameter_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
