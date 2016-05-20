module SessionHelper

  def logged_in?
    return !!session[:user_id]
  end

  def current_user
    if logged_in?
      return User.find_by(id: session[:user_id])
    else
      return nil
    end
  end

  def test
    puts "=================================="
    puts session[:user_id]
    return true
  end

end