class Api::V1::CommentsController < ApplicationController
    def index
        @post = Post.find(params[:post_id])
      end
    
      def create
        @post = Post.find(params[:post_id])
    
        return unless @post.comments.create(text: params[:comment][:text], author: @current_user)
    
        render json: { success: 'Comment created successfully' }
      end
end
