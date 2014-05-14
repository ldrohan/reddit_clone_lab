class PostsController < ApplicationController
	def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # binding.pry
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  private
  def post_params
    params.require[:post].permit(:title, :body, :comments_attributes=>[:title])
  end
end
