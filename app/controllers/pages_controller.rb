class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :home]

  def home
  end
end
