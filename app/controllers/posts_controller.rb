class PostsController < ApplicationController

  before_action :authenticate_admin!, :except => [:index, :show]

  def index
    @posts = Post.published
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.state = :published
    @post.published_at = Time.now
    @post.save

    redirect_to(posts_url)
  end

  def post_params
    params.required(:post).permit(:title, :body)
  end

end
