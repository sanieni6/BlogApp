class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    if @like.save
      flash[:notice] = 'Like created successfully'
    else
      flash[:alert] = 'Like not created'
    end
    redirect_to user_posts_path(params[:user_id])
  end
end
