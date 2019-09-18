class OfficeHoursController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_office_hour, only: [:edit, :update, :destroy]

  def new
  end
  def create
  end

  def edit
  end
  def update
  end

  def destroy
  end
end
