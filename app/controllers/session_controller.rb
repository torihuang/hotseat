class SessionController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: 'login'
    end
  end

  def create
    # @user = User.new
  end
end