class PagesController < ApplicationController
  def contact
  end

  def home
      @user = User.new
      @title = "Sign up"
  end
end
