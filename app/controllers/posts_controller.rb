class PostsController < ApplicationController
  def index
    @posts = Post.published.page(params[:page])
  end

  def show
    @post = if logged_in?
      Post.find_by!(slug: params[:slug])
    else
      Post.published.find_by!(slug: params[:slug])
    end
  end
end
