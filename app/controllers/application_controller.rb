class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by returning a null session
  protect_from_forgery with: :exception, unless: proc { |c| c.request.format == "application/json" }

  include DeviseSettings
  include AuthorizationHelpers

  before_action :set_header
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  def set_header
    @header = "no_header"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
end
