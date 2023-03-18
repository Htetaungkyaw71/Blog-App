class Api::PostsController < ApplicationController
    def index
        @user = User.includes(posts: [:comments]).find(params[:user_id])
        render :json => @user.posts, status: :ok
    end

end