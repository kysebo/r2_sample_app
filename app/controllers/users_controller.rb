class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new 
  # works with the form at new.html.erb users view
    @user = User.new
  end
  def create 
  # works when things are posted to /users (related to the adding of resources :users to the config.rb file, which allows that post to happen and be processed)
    # @user = User.new(params[:user]) # Not the final implementation! --> INSECURE, RUBY 4.X no longer allows this (older versions did, but required added security measures)
    @user = User.new(user_params)
    # Handle a successful save. A good idea would be to do this by redirecting to the newly created users page.
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
