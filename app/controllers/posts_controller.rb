# Controller for blog posts
class PostsController < ApplicationController
  before_filter :ensure_admin!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_attachments = @post.post_attachments.all
  end

  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1

    if @post.save
      params[:post_attachments]['photo'].each do |p|
        @post_attachment = @post.post_attachments.create!(:photo => p)
      end
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, post_attachments_attributes: [:id, :post_id, :photo])
    end

    def ensure_admin!
      return true if current_user.try(:admin?)
      redirect_to root_path
    end
end
