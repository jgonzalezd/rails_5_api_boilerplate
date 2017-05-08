class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      #TODO: Send confirmation email using que
      render json: { status: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end

  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      if user.confirmed_at? || user.created_at > 8.days.ago # 8 days to confirm
       auth_token = JsonWebToken.encode({user_id: user.id})
       render json: {auth_token: auth_token}, status: :ok
     else
       render json: {error: 'Email not verified' }, status: :unauthorized
     end
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private ########################### PRIVATE #################################

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
