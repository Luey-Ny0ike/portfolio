class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /blogs/1/comments
  # GET /comments.json
  def index
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    render :show
  end

  def new

    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
    @comment.user_id = current_user.id
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do | format |
      if @comment.save
        format.html { redirect_to blog_comments_path, notice: 'comment successfully added' }
        format.js
      else
        format.html { render :new }
      end
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
      flash[:notice] = "Comment updated successfully"
      redirect_to blog_comments_path(@comment.blog)
    else
      flash[:alert] = "Comment was not updated!"
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    # @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_comments_path(@comment.blog)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
