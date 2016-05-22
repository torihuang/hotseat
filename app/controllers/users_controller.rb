class UsersController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: 'signup', locals: {errors: nil}
    end
  end

  def create
    puts "===================================="
    puts params
    user_inputs = params['users']
    first_name = user_inputs['first_name']
    last_name = user_inputs['last_name']
    email = user_inputs['email']
    password = user_inputs['password']

    user = User.new(first_name: first_name, last_name: last_name, email: email, password: password)
    if user.valid? && password != ""
      user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    elsif request.xhr?
      errors = user.errors.full_messages
      errors << 'Password cannot be blank' if password == ""
      render partial: 'signup', status: 400, locals: {errors: errors}
    else
      errors = user.errors.full_messages
      errors << 'Password cannot be blank' if password == ""
      render partial: 'signup', status: 400, locals: {errors: errors}
    end
  end

  # def show
  #   user = current_user
  #   games = user.games
  #   render 'dashboard', locals: {user: user, games: games}
  # end
end