class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @user, post: @post)
    if @like.save
      format.html { redirect_to user_post_path(@user, @post) }
    else
      format.html { redirect_to @post }
    end
  end
end
