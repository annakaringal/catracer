class Player < ActiveRecord::Base
  has_many :won_games, class_name: 'Game', foreign_key: "winner_id"
  validates :name, presence: true
  validates :name, uniqueness: true
end
