class SessionsController < ApplicationController
  def new
    # creates the login form
  end

  def create
    # assigning the username that user inpuits to username var
    username = params[:username]
    password = params[:password]
    
    
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
    #  handles logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_path, notice: "Successfully logged out!"
  end
end
