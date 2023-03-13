class UsersController < ApplicationController
  # SIGNUP/ REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id})
      render json: { user: @user, token: token }, status: 200 
    else
      render json: @user.errors, status: 422
    end
  end
   # LOGIN
   def login
    if User.find_by(nickname: user_params[:nickname]) != nil
      @user = User.find_by(nickname: user_params[:nickname])
    else
      @user = User.find_by(email: user_params[:email])
    end

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: 200
    else
      render json: { error: 'Invalid!!' }, status: 422 #:unprocessable_entity
    end
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :password, :email)
  end
end
