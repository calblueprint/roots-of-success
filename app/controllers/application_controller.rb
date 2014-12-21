class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by returning a null session
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }

  acts_as_token_authentication_handler_for Teacher

  include DeviseSettings
  include AuthorizationHelpers
end
