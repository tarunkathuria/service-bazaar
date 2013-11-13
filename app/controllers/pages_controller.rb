class PagesController < ApplicationController
  def contact
  end

  def home
      @user = User.new
      @title = "Sign up"
      @users=User.all
      @ujson=User.all.to_json
  end
  def forgot_password
      @user = User.new
  end
end
