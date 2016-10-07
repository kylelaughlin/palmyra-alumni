class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_parms)
    if @post.save
      redirect_to root_path
    else
      flash.now[:alert] = "Your post was not saved"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
