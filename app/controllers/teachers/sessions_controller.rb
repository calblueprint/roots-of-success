module Teachers
  class SessionsController < Devise::SessionsController
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb
    respond_to :json

    # POST /teachers/sign_in.json
    def create
      respond_to do |format|
        format.html { super }
        format.json do
          resource = resource_from_credentials
          return invalid_login_attempt unless resource

          if resource.valid_password?(params[:password])
            render json: {
              user: { email: resource.email, auth_token: resource.authentication_token }
            }, success: true, status: :created
          else
            invalid_login_attempt
          end
        end
      end
    end

    # DELETE /teachers/sign_out.json
    def destroy
      respond_to do |format|
        format.html { super }
        format.json do
          teacher = Teacher.find_by_authentication_token(request.headers["X-API-TOKEN"])
          if teacher
            teacher.reset_authentication_token!
            render json: { message: "Session deleted." }, success: true, status: 204
          else
            render json: { message: "Invalid token." }, status: 404
          end
        end
      end
    end

    private

    def invalid_login_attempt
      warden.custom_failure!
      render json: { success: false, message: "Error with your email or password" }, status: 401
    end

    def resource_from_credentials
      data = { email: params[:email] }
      res = resource_class.find_for_database_authentication(data)
      res if res && res.valid_password?(params[:password])
    end
  end
end
