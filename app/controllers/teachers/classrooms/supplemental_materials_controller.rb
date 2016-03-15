module Teachers
  module Classrooms
    class SupplementalMaterialsController < BaseController
      before_action :set_classroom # @classroom

      def index
        @supplemental_materials = @classroom.supplemental_materials.decorate
      end
    end
  end
end
