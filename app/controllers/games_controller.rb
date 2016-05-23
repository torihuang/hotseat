class GamesController < ApplicationController

  def show
    @games = current_user.games
    @game = Game.new
    render 'show', locals: {errors: nil}
  end

  def new
    @game = Game.new
  end



end