class SessionController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: 'login', locals: {errors: nil}
    end
  end

  def create
    email = params['email']
    password = params['password']

    user = User.authenticate!({email: email, password: password})
    if user
      session[:user_id] = user.id
      puts "============================="
      puts session[:user_id]
      redirect_to '/dashboard'
    elsif request.xhr?
      render partial: 'login', success: false, locals: {errors: ['invalid email and username combination']}
    else
      render partial: 'login', locals: {errors: ['invalid email and username combination']}
    end
  end


  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end