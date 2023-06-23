class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.json { render 'api/v1/posts/index' }
    end
  end
end
