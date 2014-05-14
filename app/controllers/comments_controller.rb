class CommentsController < ApplicationController
	before_filter :load_posts
  def index
    @comments = @posts.commments.all.order(:title)
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to auction_bids_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to auction_bids_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :post_id)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
