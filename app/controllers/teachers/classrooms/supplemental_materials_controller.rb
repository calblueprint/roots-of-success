module Teachers
  module Classrooms
    class SupplementalMaterialsController < BaseController
      load_and_authorize_resource # loads @supplemental_material{s}

      before_action :set_classroom

      def index
      end
    end
  end
end
