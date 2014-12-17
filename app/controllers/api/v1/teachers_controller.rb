module Api::V1
  class TeachersController < ApplicationController
    respond_to :json

    def update
      render json: { hello: :world }
    end
  end
end
