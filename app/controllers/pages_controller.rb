class PagesController < ApplicationController
  before_action :set_user, only: [:profile_page]
  # skip_before_action :authenticate_user!, only: [:index, :home]

  def home
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
