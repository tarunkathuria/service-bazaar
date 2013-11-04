class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(:username => params[:session][:username].downcase)
    if user && User.authenticate(user, params[:session][:password])
      # sign the user in and redirect to their page
      sign_in user
      redirect_to user
    else
      # puts "#{params[:session][:password]} !!!!!!!!!!!!!!!!!!!!!!!!!!!!! #{params[:session][:username]}"
      # create an error message and redirect to the home page
      @errorSignup = true
      render 'pages/home'
    end
  end

  def destroy
    
  end
end
