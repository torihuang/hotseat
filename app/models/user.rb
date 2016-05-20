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

  def self.authenticate!(user_params)
    puts "IN AUTHENTICATE*********************"
    email_input = user_params[:email]
    password_input = user_params[:password]

    user = User.find_by(email: email_input)
    if email_input != nil && user && user.password == password_input
      return user
    else
      return nil
    end
  end
end
