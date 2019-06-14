class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    session[:email] = user.email

    flash[:notice] = "Successfully logged in"
     redirect_to '/'
    else

     redirect_to '/login'
    end
   end

   
    def destroy
      session[:user_id] = nil
      flash[:notice] = "Successfully logged out"
      redirect_to '/login'
    end

 
  
end
