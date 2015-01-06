class WebsocketController < ApplicationController
  def index
    @on_production = Rails.env == "production" 
    @posts = Post.all.order("created_at DESC")
  end
end
