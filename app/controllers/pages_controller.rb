class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]   # on est pas obligé d'être loggué pour voir la home
  skip_after_action :verify_authorized

  def home
  end
end


