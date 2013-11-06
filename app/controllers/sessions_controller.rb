class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:username => params[:session][:username].downcase)
    if user && User.authenticate(params[:session][:username], params[:session][:password])
      # sign the user in and redirect to their page
      sign_in(user)
      redirect_to(user)
      # render "pages/contact"
    else
      # create an error message and redirect to the home page
      @errorSignin = true
      render 'pages/home'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
