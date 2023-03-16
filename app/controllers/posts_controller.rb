class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_post_url(current_user, @post)
    else
      redirect_to new_user_post_url, notice: 'Post creation failed'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    flash[:success] = if @post.destroy
                        'Successfully deleted'
                      else
                        'Post deletion failed'
                      end
    redirect_to user_posts_url(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
