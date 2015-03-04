class SessionsController < ApplicationController

  layout "external"
  skip_before_filter :authenticate 

  def new
  end

  def create
    email = params[:session][:email]
    pass = params[:session][:password]

    @user = User.find_by_email(email)

    if @user.present?
      if @user.authenticate(pass)
        session[:user_id] = @user.id
        redirect_to clients_path 
        return
      end
    end

    redirect_to login_path, flash: {notice: "User Email or Password is Incorrect"}
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
