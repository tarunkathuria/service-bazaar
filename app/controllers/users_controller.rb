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
    # @user = User.find(user_params)
    # puts "#{params[:username]} 4444444444444444"
    # @user = User.find_by(params[:user].username)
    # puts "3333333333333333333333 #{@user.username}"
    @user = current_user
    @successfulSignin = true
  end
  
  def forgot_password
      @user=User.find_by(fp_param)
      # puts "Forgot Pass user is!!!!!!!!!!!!!!!!!! #{@user.username} #{@user.password}"
      if @user.nil?
          @nilUser=true
          
      else
        @nilUser=false
        puts " !!!!!!!!!!!!! #{@user.username}"
        UserMailer.forgot_password(@user).deliver
      end
      render 'pages/forgot_password'
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :emailID, :password, :latitude, :longitude, :dateOfBirth, :realName)
    # params.permit(:session).permit(:username, :password)
  end
  
  def fp_param
      params.require(:user).permit(:username)
  end

end
