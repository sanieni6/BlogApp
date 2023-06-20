class PostsController < ApplicationController
  def index
    # @user = User.includes(posts: [:comments]).find(params[:user_id])
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by_id params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, **post_params)
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_posts_path(params[:user_id])
    else
      flash[:alert] = 'Post not created'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
