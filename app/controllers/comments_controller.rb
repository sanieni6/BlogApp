class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(author_id: current_user.id, post_id: params[:post_id], **comment_params)
    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to user_posts_path(params[:user_id])
    else
      flash[:alert] = 'Comment not created'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy
    redirect_to request.referrer
  end

  def comment_params
    params.require(:comment).permit(:text)
  end  
end
