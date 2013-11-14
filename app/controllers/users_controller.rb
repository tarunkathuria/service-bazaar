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
    end
  end
 
  def show
    uri=request.original_url.split("/").last
    @user = User.find(uri)
    @successfulSignin = true
  end

  def services
    uri=request.original_url.split("/")[-2]
    @user = User.find(uri)
  end
  
  def forgot_password
      @user=User.find_by(fp_param)
      if @user.nil?
          @nilUser=true
          
      else
        @nilUser=false
        UserMailer.forgot_password(@user).deliver
      end
      render 'pages/forgot_password'
  end
  
  def edit
    uri=request.original_url.split("/")[-2]
    if uri != current_user.id.to_s
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
        redirect_to "/users/#{current_user.id}/edit"
      else
        puts current_user.errors.full_messages
        render 'edit'
      end
    elsif oldpass==""
        if current_user.update_attributes(edit_user_params_new_nopass)
        flash[:success] = "Profile updated"
        redirect_to "/users/#{current_user.id}/edit"
        else
        render 'edit'
        #redirect_to "/users/#{current_user.username}/edit"
        end
    else
    flash[:danger]="Old password incorrect!"
      redirect_to "/users/#{current_user.id}/edit"
    end
    
  end  

  def messages_show
    @ur=User.all
    @user=current_user
  end
  def new_message
   @rec=params[:xyz]
  end  
  def transit
    rec=User.find_by_username(new_msg_params[:recipient])
    bod=new_msg_params[:body]
    sub=new_msg_params[:subject]
    puts rec.nil?
    puts bod.nil?
    puts sub.nil?
    if rec.nil? || bod.nil? || sub.nil?
      @errs=[]
      if rec.nil?
        @errs << "Recipient can't be empty or is incorrect"
      end
      if bod.nil?
        @errs << "Body can't be empty"
      end
      if sub.nil?
        @errs << "Subject can't be empty"
      end
      flash[:danger]="Message couldn't be sent <ul>"+@errs.map{|e| "<li>"+e+"</li>"}.inject{|u,v| u+=v}+"</ul>"
      redirect_to '/new_message'
    else
      flash[:success]="Message sent successfully"
      current_user.send_message(rec,bod,sub)
      redirect_to '/new_message'
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

  def new_msg_params
    params.require(:msg).permit(:body,:subject,:recipient)
  end

  
end
