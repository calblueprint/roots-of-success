class LearningModulesController < ApplicationController
  def index
  end 

  def create
  end

  def new
  end

  def edit
    @module = LearningModule.find params[:id]
  end

  def show
    @module = LearningModule.find params[:id]

    @presentation_url = nil
    if @module.presentation_embed_code
      h = Nokogiri::HTML(@module.presentation_embed_code).xpath('//iframe/@src')
      if h.length >= 1
        @presentation_url = h[0].value
      end
    end
  end

  def update
    @module = LearningModule.find params[:id]

    @module.update_attributes module_attributes
    flash[:success] = 'Module updated!'

    redirect_to @module
  end

  def destroy
  end

  private
    def module_attributes
      params.require(:learning_module).
            permit(:presentation_embed_code, :learning_module_file)
    end
  
end
