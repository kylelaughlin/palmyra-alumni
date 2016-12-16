class PostsController < ApplicationController

  before_action :authenticate_classmate!

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Your post was not saved"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice: "Post Updated Successfully"
    else
      flash.now[:alert] = "Post changes not saved"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to root_path, notice: "Post successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :classmate_id)
  end

end
