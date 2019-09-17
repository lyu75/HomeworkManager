class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end
  def show
  end

  def new
    @course = Course.new
    # @course.office_hours.build
  end
  def create
    @course = Course.create(course_params)
    @course.user = current_user if current_user
    if @course.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to profile_path(current_user)
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :oh_location, :user_id, office_hours_attributes: [:time])
  end
end
