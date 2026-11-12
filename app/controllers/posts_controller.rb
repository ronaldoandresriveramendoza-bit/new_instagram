class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
def destroy
  @post = Post.find(params[:id])
  if @post.destroy
    redirect_to posts_path
    flash[:success] = "The post is destroy!"
  else
    redirect_to posts_path
  end
end
    @post = Post.new(permit_post)
    if @post.save
      flash[:success] = "Success!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to new_post_path
    end
  end

  private

  def permit_post
    params.require(:post).permit(:image, :description)
  end
end
