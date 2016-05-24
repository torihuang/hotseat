class UsersController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: 'signup', locals: {errors: nil}
    end
  end

  def create
    first_name = user_params['first_name']
    last_name = user_params['last_name']
    email = user_params['email']
    password = user_params['password']

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

  private
    def user_params
      params.require(:users).permit(:first_name, :last_name, :email, :password)
    end
end