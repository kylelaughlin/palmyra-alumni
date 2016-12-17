class PagesController < ApplicationController

  before_action :authenticate_classmate!

  def home
    @posts = Post.all.order('created_at DESC')
    @events = Event.upcoming
  end

end
