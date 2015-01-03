class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by returning a null session
  protect_from_forgery with: :exception, unless: proc { |c| c.request.format == "application/json" }

  include DeviseSettings
  include AuthorizationHelpers

  before_filter :set_header

  def set_header
    @header = "no_header"
  end
end
