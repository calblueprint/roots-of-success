module AuthorizationHelpers
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.html { redirect_to root_url, alert: exception.message }
        format.json { render json: { access_denied: true }, status: :forbidden }
      end
    end
  end
end
