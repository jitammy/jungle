class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new

  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully created user!"
      redirect_to "/"
    else
      flash[:warning] = "Invalid user or password"
      render :new
    end
  end

  def destroy
    raise params.inspect
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
