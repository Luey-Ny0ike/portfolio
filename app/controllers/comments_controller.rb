class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :edit, :delete]
  #
  # # GET /blogs/1/comments
  # # GET /comments.json
  # def index
  #   @blog = Blog.find(params[:blog_id])
  #   @comments = Comment.all
  # end
  #
  # # GET /comments/1
  # # GET /comments/1.json
  # def show
  #   @blog = Blog.find(params[:blog_id])
  #   @comment = @blog.comments.find(params[:id])
  #   render :show
  # end

  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      redirect_to blog_comment_path(@comment.blog)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    # @comment = @blog.comments.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    # @comment = @blog.comments.find(params[:id])
    if @blog.comments.update(comment_params)
      redirect_to blog_comments_path(@comment.blog)
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    # @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_comments_path(@comment.blog)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
