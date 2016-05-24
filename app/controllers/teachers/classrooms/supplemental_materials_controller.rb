module Teachers
  module Classrooms
    class SupplementalMaterialsController < BaseController
      before_action :set_classroom, only: [:index, :new, :create, :manage] # @classroom

      UPDATABLE_ATTRS = [:name, :content].freeze

      def index
        @supplemental_materials = @classroom.supplemental_materials.decorate
      end

      def new
        @supplemental_material = @classroom.supplemental_materials.build
      end

      def create
        @supplemental_material = @classroom.supplemental_materials.build supplemental_material_params
        if @supplemental_material.save
          redirect_to classroom_supplemental_materials_path,
                      flash: { success: "Successfully created supplemental material" }
        else
          render "new"
        end
      end

      def edit
        @supplemental_material = SupplementalMaterial.find params[:id]
        @classroom = @supplemental_material.classroom
      end

      def update
        @supplemental_material = SupplementalMaterial.find params[:id]
        @classroom = @supplemental_material.classroom
        if @supplemental_material.update supplemental_material_params
          redirect_to classroom_supplemental_materials_path(@classroom),
                      flash: { success: "Supplemental material successfully updated" }
        else
          render "edit"
        end
      end

      def manage
        @supplemental_materials = @classroom.supplemental_materials.decorate
      end

      # An API method that is used to change a position of a material. It's
      # called from sortable-table.coffee.
      #
      # @param id - The id of the material
      # @param newPos - The new position of the material
      def change_position
        supplemental_material = SupplementalMaterial.find params[:id]
        supplemental_material.insert_at params[:newPos].to_i
        render json: { status: :ok }
      end

      private

      def supplemental_material_params
        params.require(:supplemental_material).permit(UPDATABLE_ATTRS)
      end
    end
  end
end
