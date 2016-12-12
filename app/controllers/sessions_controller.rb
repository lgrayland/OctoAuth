class SessionsController < ApplicationController
  before_action :validate_client

  def create
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id, exp: 1.minute.from_now.to_i})
      refresh_token = RefreshToken.encode(user, @client)
      render json: {auth_token: auth_token, refresh_token: refresh_token}
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def validate_client
    client = Client.find_by(id: params[:client_id])

    if client
      if client.app_type == 'native'
        if !params[:secret]
            render json: {error: 'No secret'}, status: :unauthorized
        elsif client.secret != params[:secret]
          render json: {error: 'Invalid secret'}, status: :unauthorized
        end
      end
      unless client.active
        render json: {error: 'Client inactive'}, status: :unauthorized
      end
      @client = client
    else
      render json: {error: 'Invalid client_id'}, status: :unauthorized
    end
  end
end
