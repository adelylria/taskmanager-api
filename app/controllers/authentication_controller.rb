class AuthenticationController < ApplicationController
  protect_from_forgery with: :exception, except: [:signup, :login]

  def signup
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully', user: user }
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, '8F7382D23C640ED48CBE5B1959F5041E212A15C8D3A4A80DC86E278CE01E8233')
      render json: { message: 'Login successful', token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def encode_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, '8F7382D23C640ED48CBE5B1959F5041E212A15C8D3A4A80DC86E278CE01E8233')
  end
end
