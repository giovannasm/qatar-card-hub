class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home offers]

  def home
  end
end
