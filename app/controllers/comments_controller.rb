class CommentsController < ApplicationController

  def show
  end

  def new
  end

  def create
    @user = User.find(session[:user]["id"])
    @post = Post.find(params[:post_id])
    #@comment.save(comment_params.merge(post: @post))
    @comment = Comment.create!(comment_params.merge(post_id: @post.id, user_id: @user.id))

    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

end
