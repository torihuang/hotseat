class SessionController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: 'login', locals: {errors: nil}
    end
  end

  def create
    email = params['session']['email']
    password = params['session']['password']
    puts "============================="
    puts params
    puts params['session']
    puts email
    puts password

    user = User.authenticate!({email: email, password: password})
    if !user.nil?
      session[:user_id] = user.id
      redirect_to '/dashboard'
    elsif request.xhr?
      render partial: 'login', status: 400, locals: {errors: ['invalid email and username combination']}
    else
      render partial: 'login', locals: {errors: ['invalid email and username combination']}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end