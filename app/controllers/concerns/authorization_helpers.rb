module AuthorizationHelpers
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end
  end
end
