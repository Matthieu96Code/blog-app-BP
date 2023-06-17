class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user_id = params[:user_id]
    @user = User.find(params[:user_id])
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find(params[:id])
  end
end
