class LearningModulesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @presentation_url = nil
    if @learning_module.presentation_embed_code
      h = Nokogiri::HTML(@learning_module.presentation_embed_code).xpath('//iframe/@src')
      if h.length >= 1
        @presentation_url = h[0].value
      end
    end
  end

  def update
    @learning_module.update_attributes module_attributes
    flash[:success] = 'Module updated!'

    redirect_to @learning_module
  end

  def destroy
  end

  private

  def module_attributes
    params.require(:learning_module).
          permit(:presentation_embed_code, :learning_module_file)
  end
end
