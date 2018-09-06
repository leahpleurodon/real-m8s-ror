# OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['G_OAUTH_CLIENT_ID'], ENV['G_OAUTH_CLIENT_SECRET'], {
        :provider_ignores_state => true
      }
  end