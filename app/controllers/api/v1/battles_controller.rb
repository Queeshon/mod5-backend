class Api::V1::BattlesController < ApplicationController

  def index
    @battles = Battle.all
    render json: @battles
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
