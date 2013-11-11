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
    uri=request.original_url.split("/").last
    @user = User.find_by_username(uri)
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
  
  def edit
    uri=request.original_url.split("/")[-2]
    if uri!=current_user.username
      redirect_to "/"
    end

  end
  
  def update
    oldpass=edit_user_params[:oldpassword]
    
    
    @passmatch=false
    if oldpass == current_user.password
      @passmatch=true
      if current_user.update_attributes(edit_user_params_new)
        flash[:success] = "Profile updated"
        redirect_to "/users/#{current_user.username}/edit"
      else
        puts current_user.errors.full_messages
        puts "$$$$$$$$$$$$$$$$$"
        render 'edit'
        #redirect_to "/users/#{current_user.username}/edit"
      end
    elsif oldpass==""
        if current_user.update_attributes(edit_user_params_new_nopass)
        flash[:success] = "Profile updated"
        redirect_to "/users/#{current_user.username}/edit"
        else
        render 'edit'
        #redirect_to "/users/#{current_user.username}/edit"
        end
    else
    flash[:danger]="Old password incorrect!"
      redirect_to "/users/#{current_user.username}/edit"
    end
    
  end  
  private

  def user_params
    params.require(:user).permit(:username, :emailID, :password, :latitude, :longitude, :dateOfBirth, :realName)
    # params.permit(:session).permit(:username, :password)
  end
  
  def fp_param
      params.require(:user).permit(:username)
  end
  def edit_user_params
    params.require(:user).permit(:username, :emailID, :oldpassword, :latitude, :longitude, :dateOfBirth, :realName)
    # params.permit(:session).permit(:username, :password)
  end
  def edit_user_params_new
    params.require(:user).permit(:username, :emailID, :password, :latitude, :longitude, :dateOfBirth, :realName)
    # params.permit(:session).permit(:username, :password)
  end
  def edit_user_params_new_nopass
      params.require(:user).permit(:username, :emailID, :latitude, :longitude, :dateOfBirth, :realName)
      # params.permit(:session).permit(:username, :password)
  end

end
