class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      @signupConf = true
      sign_in @user
      redirect_to @user
      # render 'pages/home'
    else
      @title="Sign up"
      @errorSignup = true
      render 'pages/home'
      @hm = user_params
    end
  end

  def show
    @user = User.find(user_params)
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :emailID, :password, :latitude, :longitude, :dateOfBirth, :realName)
  end

end
