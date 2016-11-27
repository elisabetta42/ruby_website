class SessionsController < ApplicationController
  def new
  end
  def create
  	user = UserAccount.find_by(username: params[:session][:username])
  	if user && user.authenticate(params[:session][:password])
        log_in user
        current_user
        redirect_to '/user_accounts/show'
  	else
  		flash.now[:danger] = 'Invalid user/password combination'
  	 	render 'new'
  	end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
