class Question < ActiveRecord::Base
  validates :game_id, :query, presence: true
  belongs_to :game
  delegate :creator, to: :game
end