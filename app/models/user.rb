class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :games, foreign_key: :creator_id

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
