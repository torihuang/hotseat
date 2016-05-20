class UsersController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render partial: 'signup'
    end
  end

  def create

  end
end