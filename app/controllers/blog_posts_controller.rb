class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :my_posts]
  before_action :set_blog_post, except: [:index, :new, :create, :my_posts]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
 
  def index
    @blog_posts = BlogPost.all
  end  
  def my_posts
    @blog_posts = current_user.blog_posts
    session[:from_my_posts] = true
  end

  def show
    @show_edit = session[:from_my_posts] && @blog_post.user == current_user
    session[:from_my_posts] = nil 
  end
  # def my_posts
  #   @blog_posts = current_user.blog_posts
  # end

  # def show
  #   @blog_post=BlogPost.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to root_path
  # end

  def new
    @blog_post=BlogPost.new
  end

  def create
    # @blog_post=BlogPost.new(blog_post_params)
    @blog_post = current_user.blog_posts.build(blog_post_params)
    if @blog_post.save 
      redirect_to @blog_post
      
    else 
      render :new, status: :unprocessable_entity
      
    end

  end
  def edit
    @blog_post=BlogPost.find(params[:id])
  end

  def update
    @blog_post=BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else 
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post=BlogPost.find(params[:id])
    @blog_post.destroy
   
    redirect_to root_path
  end

  def authorize_user!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless @blog_post.user == current_user
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :image_url)
  end

  def set_blog_post
    @blog_post=BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to sign in or sign up to continue."
    end
  end
end