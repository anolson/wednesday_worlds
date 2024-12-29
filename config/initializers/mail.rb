WednesdayWorlds::Application.config.action_mailer.delivery_method = :smtp
WednesdayWorlds::Application.config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: Rails.application.credentials.action_mailer.domain,
  user_name: Rails.application.credentials.action_mailer.user_name,
  password: Rails.application.credentials.action_mailer.password,
  authentication: "plain",
  enable_starttls_auto: true }
