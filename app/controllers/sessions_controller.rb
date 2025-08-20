class SessionsController < ApplicationController
  def new
    # This action renders the login form
  end

  def create
    # This action handles the login form submission
    username = params[:username]
    password = params[:password]
    
    # Simple authentication (in real apps, you'd use proper authentication)
    if username == "admin" && password == "password"
      session[:user_id] = 1
      session[:username] = username
      redirect_to root_path, notice: "Successfully logged in!"
    else
      flash.now[:alert] = "Invalid username or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # This action handles logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_path, notice: "Successfully logged out!"
  end
end
