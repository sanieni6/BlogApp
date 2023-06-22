class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])

    return unless @post.comments.create(text: params[:comment][:text], author: @current_user)

    render json: { success: 'Comment created successfully' }
  end
end
