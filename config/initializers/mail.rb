WednesdayWorlds::Application.config.action_mailer.delivery_method = :smtp 
WednesdayWorlds::Application.config.action_mailer.smtp_settings = { 
  :address => "smtp.gmail.com",  
  :port => 587,  
  :domain => 'wednesdayworlds.org',  
  :user_name => ENV['ACTION_MAILER_USER_NAME'],  
  :password => ENV['ACTION_MAILER_PASSWORD'],  
  :authentication => 'plain',  
  :enable_starttls_auto => true }