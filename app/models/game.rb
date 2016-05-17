class Game < ActiveRecord::Base
  validates :creator_id, :title, :victim, :answerer_name, :answerer_email, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :questions
end
