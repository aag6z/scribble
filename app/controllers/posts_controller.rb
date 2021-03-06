class PostsController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    @posts = Post.all.order('created_at DESC')
    @tags = Tag.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    #@user = User.find(session[:user]["id"])
    @post = current_user.posts.create!(post_params)
    if params[:tagtext] != ""
      @tag_arr = (params[:tagtext]).split
      @tag_arr.each do |tag|
        @tag = Tag.find_by(tagtext: tag)
        if @tag == nil
          @post.tags.create!(tagtext: tag)
        else
          #this literally took me an hour to find...
          @post.tags << @tag
        end
      end
    end

    redirect_to posts_path
  end

  def edit
    #@user = User.find(session[:user]["id"])
    @post = current_user.posts.find(params[:id])
    #if @user.id == @post.id

  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

  def current_user
    return User.find(session[:user]["id"])
  end

end
