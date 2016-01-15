require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"), subject_prefix: "[STAGING]")
)

Rails.application.configure do
  config.action_mailer.default_url_options = { host: "ros-staging.herokuapp.com" }

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.action_controller.asset_host = ENV.fetch("CDN_URL")
end
