module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user = UserAccount.find_by(username: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
   # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def right_user(recipe_writer)
    return (session[:user_id] = recipe_writer)
    end
end