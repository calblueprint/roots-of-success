module Teachers
  class SessionsController < Devise::SessionsController
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb
    respond_to :json

    # POST /teachers/sign_in
    def create
      respond_to do |format|
        format.html { super }
        format.json do
          resource = resource_from_credentials
          return invalid_login_attempt unless resource
        end
      end
    end

    # DELETE /teachers/sign_out
    def destroy
      super
    end
  end
end
