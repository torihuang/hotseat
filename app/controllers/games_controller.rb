class GamesController < ApplicationController

  def show
    @games = current_user.games
    @game = Game.new
    render 'show', locals: {errors: nil}
  end

  def new
    @game = Game.new
  end

  def create
    puts "*********************************"
    puts game_params
  end

  def play
    render 'play'
  end

private
  def game_params
    # query_names = params['game']['questions']
    # puts "================================="
    # puts params['game']
    # query_names_array = query_names.values
    # params['questions'] = query_names_array
    # puts params['game']
    # puts params['questions']
    params.require(:game).permit(:title, :victim, :answerer_name, :answerer_email, questions: {})
  end

end