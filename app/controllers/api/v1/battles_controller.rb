class Api::V1::BattlesController < ApplicationController

  def index
    if valid_token?
      @battles = Battle.all
      newBattles = []
      @battles.each { |battle| newBattles.push({ battle: battle, users: battle.users, likes: battle.likes }) }
      render json: newBattles
    else
      render json: { go_away: true }, status: :unauthorized
    end
  end

  def create
    @battle = Battle.create(battle_params)
    if @battle.save
      render json: @battle
    else
      render json: @battle.errors
    end
  end

  private

  def battle_params
    params.require(:battle).permit(:category)
  end

end
