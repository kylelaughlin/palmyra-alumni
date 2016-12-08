class PagesController < ApplicationController

  before_action :authenticate_classmate!

  def home
    @events = Event.upcoming
  end

end
