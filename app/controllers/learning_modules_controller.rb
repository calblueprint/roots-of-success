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
    if not @module.presentation_embed_code.nil?
      h = Nokogiri::HTML(@module.presentation_embed_code).xpath('//iframe/@src')
      if h.length >= 1
        @presentation_url = h[0].value
      end
    end
  end

  def update
    @module = LearningModule.find params[:id]

    @module.presentation_embed_code = params[:learning_module][:presentation_embed_code]
    @module.save

    redirect_to @module
  end

  def destroy
  end
  
end
