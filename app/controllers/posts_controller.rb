class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.order("created_at DESC") #@postにpostsテーブルのデータを全て代入
  end

  def new
  end

  def create
    Post.create(post_params)
    redirect_to action: :index
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
    redirect_to action: :index
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
    end
    redirect_to action: :index
  end

  def edit
    if post.user_id != current_user.id
      redirect_to action: :index
    else
      @post = Post.find(params[:id])
    end
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(name: current_user.nickname, user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
