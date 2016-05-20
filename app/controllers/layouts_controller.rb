class LayoutsController < ApplicationController

  def index
    if logged_in?
      render "index"
    else
      render "splashpage"
    end
  end

end