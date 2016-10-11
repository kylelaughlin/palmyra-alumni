class PostsController < ApplicationController

  before_action :authenticate_classmate!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Your post was not saved"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice: "Post Updated Successfully"
    else
      flash.now[:alert] = "Post changes not saved"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :classmate_id)
  end

end
