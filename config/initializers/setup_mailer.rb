# -*- encoding : utf-8 -*-
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "randomImage.com",
  :user_name => "limuz12188@gmail.com",
  :password => "alskdjfh",
  :authentication => "login",
  :enable_starttls_auto => true

#  :address => '127.0.0.1',
#  :port => 25,
#  :doamin => 'priday.com',
#  :enable_starttls_auto => false,
#  :openssl_verify_mode => 'none'

}

