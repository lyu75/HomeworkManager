class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_task, only: [:edit, :update, :destroy, :mark_complete, :mark_incomplete]

  def new
    @course = Course.find(params[:course_id])
    @task = Task.new
  end
  def create
    @course = Course.find(params[:course_id])
    @task = Task.create(task_params)
    @task.course = @course
    @task.user = current_user
    if @task.save
      redirect_to course_path(@task.course)
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @task.update(task_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end
  def mark_complete
    @task.update_attribute(:complete, true)
    flash[:notice] = 'Marked task as complete'
    redirect_back(fallback_location: root_path)
  end
  def mark_incomplete
    @task.update_attribute(:complete, false)
    flash[:notice] = 'Marked task as incomplete'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @task.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :user_id, :course_id, :complete, :duedate)
  end
end
