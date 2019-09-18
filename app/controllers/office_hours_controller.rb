class OfficeHoursController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_office_hour, only: [:edit, :update, :destroy]

  def new
    @course = Course.find(params["office_hour"]["course_id"])
    p 'found course id'
    @office_hour = OfficeHour.new
  end
  def create
    @course = Course.find(params["office_hour"]["course_id"])
    @office_hour = OfficeHour.create(office_hour_params)
    @office_hour.course = @course
    redirect_to(course_path(@course))
  end

  def edit
  end
  def update
  end

  def destroy
    @office_hour.destroy
    redirect_to(course_path(@office_hour.course))
  end

  private
  def set_office_hour
    @office_hour = OfficeHour.find(params[:id])
  end

  def office_hour_params
    params.require(:office_hour).permit(:time, :day, :course_id)
  end
end
