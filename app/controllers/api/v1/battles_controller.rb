class Api::V1::BattlesController < ApplicationController

  def index
    @battles = Battle.all
    newBattles = []
    @battles.each { |battle| newBattles.push({ battle: battle, users: battle.users, likes: battle.likes }) }
    render json: newBattles
  end

  def create
    @battle = Battle.create(battle_params)
    @user1 = User.find_by(id: params[:users][0][:id])
    @user2 = User.find_by(id: params[:users][1][:id])

    @battle.users = [@user1, @user2]
    if @battle.save
      render json: @battle
    else
      render json: @battle.errors
    end
  end

  private

  def battle_params
    params.permit(:category)
  end

end
