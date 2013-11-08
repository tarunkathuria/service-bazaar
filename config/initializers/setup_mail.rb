ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 25,
    :domain => "gmail.com",
	:user_name => "servicebazaardb@gmail.com",
	:password => "tarun321",
	:authentication => "plain",
	:enable_starttls_auto => true
}