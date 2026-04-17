class FeedsController < ApplicationController
  def show
    @posts = Post.published.limit(20)

    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
