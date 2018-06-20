class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: {
        username: @user.username,
        token: generate_token(@user),
        user_id: @user.id,
        avatar: @user.avatar,
        cute_pic: @user.cute_pic,
        wins: @user.wins
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if authorized?(@user)
      render json: @user
    else
      render json: @user.errors
    end
  end

  def destroy
    User.destroy(params[:id])
  end

  private

  def user_params
    params.permit(:name, :username, :password, :avatar, :wins, :cute_pic)
  end

end
