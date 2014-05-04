class LearningModuleTopicsController < ApplicationController
  def index
  end 

  def create
  end

  def new
  end

  def edit
  end

  def show
    @module = LearningModuleTopic.find params[:id]
    @module_versions = @module.learning_modules
  end

  def update
  end

  def destroy
  end
end