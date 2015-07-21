class GamesController < ApplicationController

  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.player1 = Player.find_or_create_by(name: params[:player1_name])
    @game.player2 = Player.find_or_create_by(name: params[:player2_name])
    if @game.save
      redirect_to game_path(@game)
    else
      flash[:error] = "There was an error creating your game!"
      redirect_to new_game_path
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    @player1 = @game.player1
    @player2 = @game.player2
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.winner = Player.find_by(name: params[:winner_name])
    @game.completed = true
    if @game.save && request.xhr?
      winner_message = "Congratulations, #{@game.winner.name}!"
      render json: {message: winner_message}.to_json
    end
  end

end
