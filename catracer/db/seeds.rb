# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PLAYERS = ["Shaggy", "Scooby", "Fred", "Daphne", "Velma"]

PLAYERS.each do |name|
  Player.create(name: name)
end

NUM_PLAYERS = Player.count
NUM_GAMES = 3

NUM_GAMES.times do |i|
  player1_id = rand(1..NUM_PLAYERS)
  player2_id = nil
  loop do
    player2_id = rand(1..NUM_PLAYERS)
    break if player2_id && player2_id != player1_id
  end

  completed = [true, false].sample
  if completed
    winner_id = [player1_id, player2_id].sample
  end

  game = Game.create( player1_id: player1_id,
                      player2_id: player2_id,
                      completed: completed )

  if game.completed
    game.winner_id = winner_id
  end

end
