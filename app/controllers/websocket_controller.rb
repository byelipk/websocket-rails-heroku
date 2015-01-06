class WebsocketController < ApplicationController
  def index
    @url   = request.original_url
    @posts = Post.all.order("created_at DESC")
  end
end
