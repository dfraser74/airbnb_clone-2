config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
     :address => "smtp.gmail.com",
     :port => 25,
     :user_name => ENV['GMAIL_USERNAME'],
     :password => ENV['GMAIL_PASS'],
     :authentication => :plain,
     :enable_starttls_auto => true
}