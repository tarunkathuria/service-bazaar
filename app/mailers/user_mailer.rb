class UserMailer < ActionMailer::Base
  default from: "servicebazaardb@gmail.com"
  
  def forgot_password(user)
      @user =user
      mail(:to => user.emailID, :subject=> "Forgot Password for username #{user.username}")
  end
end
