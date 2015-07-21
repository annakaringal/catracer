class GamesController < ActionController::Base

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
      redirect_to @game
    else
      flash[:error] = "There was an error creating your game!"
      redirect_to new_game_path
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    @player1 = game.player1
    @player2 = game.player2
  end

  def update
  end

end
