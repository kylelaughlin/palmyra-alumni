class PagesController < ApplicationController

  before_action :authenticate_classmate!

  def home
    @posts = Post.all
  end

end
