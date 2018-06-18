class Api::V1::LikesController < ApplicationController

  def create
    @like = Like.create(like_params)
    if @like.save
      render json: @like
    else
      render json: @like.errors
    end
  end

  private

  def like_params
    params.require(:like).permit(:count, :user_id, :battle_id)
  end

end
