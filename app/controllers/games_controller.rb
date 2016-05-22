class GamesController < ApplicationController

  def show
    @games = current_user.games
    render 'show'
  end

end