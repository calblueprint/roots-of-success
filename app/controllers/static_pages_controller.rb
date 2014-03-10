class StaticPagesController < ApplicationController
  before_filter :authenticate_user! # make sure to put :excepts when we add other static pages that don't need authentication
  def home
  end
end
