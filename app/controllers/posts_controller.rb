class PostsController < ApplicationController


  def index
    @posts = User.find(session[:user]["id"]).posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user]["id"])
    @post = @user.posts.create!(post_params)
    @post.tags.create!(tag_params)

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

  def tag_params
    params.require(:tag).permit(:tagtext)
  end


end
