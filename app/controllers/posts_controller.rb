class PostsController < ApplicationController

  def set_active_tab
    @active_tab = :posts
  end

  def index
    @posts = Post.published
  end

  def new
    @post = Post.new
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
