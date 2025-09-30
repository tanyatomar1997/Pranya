Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    Rails.application.credentials.dig(:oauth, :google, :client_id),
    Rails.application.credentials.dig(:oauth, :google, :client_secret),
    {
      scope: 'email,profile',
      prompt: 'select_account'
    }

end
OmniAuth.config.full_host = 'http://localhost:3000'
OmniAuth.config.logger = Rails.logger
OmniAuth.config.allowed_request_methods = [:get, :post]
