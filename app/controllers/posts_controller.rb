class PostsController < ApplicationController

  def set_active_tab
    @active_tab = :posts
  end

  def index
    @posts = Post.where(:state => :published)
  end

end
