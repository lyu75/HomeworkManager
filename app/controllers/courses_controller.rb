class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

end
