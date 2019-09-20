class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end
  def show
    @office_hour = OfficeHour.new
    # find all tasks the current user created for the current course
    @my_tasks = []
    if current_user
      current_user.tasks.each do |t|
        if t.course == @course
          @my_tasks << t
        end
      end
    end
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
    redirect_back(fallback_location: root_path)
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :oh_location, :user_id, office_hours_attributes: [:time])
  end
end
