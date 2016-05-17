require 'securerandom'

class Game < ActiveRecord::Base
  validates :creator_id, :title, :victim, :answerer_name, :answerer_email, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :questions

  before_create :assign_url_key

  private
    def assign_url_key
      begin
        self.answerer_url_key = SecureRandom.hex
      end while Game.key_exists?(self.answerer_url_key)
    end

    def self.key_exists?(new_key)
      return Game.where('answerer_url_key = ?', new_key).length > 0
    end
end
