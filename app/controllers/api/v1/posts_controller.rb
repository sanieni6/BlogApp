class Api::V1::PostsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    @posts = Post.all
    render json: @posts
  end
end
