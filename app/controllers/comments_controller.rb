class CommentsController < ApplicationController
	before_filter :load_post
  def index
    @comments = @post.comments.all
		@user = current_user
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comments_path(@post)
    end
  end

  # def show
  #   @comment = @post.comments.find(params[:id])
  # end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path(@post)
  end

  private
  def comment_params
    params[:comment].permit(:title)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
