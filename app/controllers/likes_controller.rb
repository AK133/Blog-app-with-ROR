class LikesController < ApplicationController
  before_action :find_blog_post
  before_action :authenticate_user!

  def create
  unless current_user==@blog_post.user
    @like = @blog_post.likes.new(user: current_user)
    if @like.save
      respond_to do |format|
        format.html { redirect_to @blog_post, notice: 'You liked this post.' }
        format.js  
      end
    else
      redirect_to @blog_post, alert: 'Unable to like this post.'
    end
  else
    redirect_to @blog_post, alert: 'Unable to like this post.'
  end
  end

  def destroy
    @like = @blog_post.likes.find_by(user: current_user)
    if @like&.destroy
      respond_to do |format|
        format.html { redirect_to @blog_post, notice: 'You unliked this post.' }
        format.js 
      end
    else
      redirect_to @blog_post, alert: 'Unable to unlike this post.'
    end
  end

  private

  def find_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end
