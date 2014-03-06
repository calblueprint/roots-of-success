class LearningModulesController < ApplicationController
  def index
  end 

  def create
  end

  def new
  end

  def edit
  end

  def show
    @module = LearningModule.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
end
