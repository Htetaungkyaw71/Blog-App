class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author_id = current_user.id
    if post.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_post_url(current_user, post)
    else
      redirect_to new_user_post_url, notice: 'Post creation failed'
    end
  end
end
