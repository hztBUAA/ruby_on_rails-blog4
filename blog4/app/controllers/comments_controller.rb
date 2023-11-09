class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    # @comments = Comment.find_by(params[:blog_id])

    # @blog_comments = Comment.find_by()
     @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments

  end

  # GET /comments/1 or /comments/1.json
  def show
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments.find_by(params[:id])
    @user = @comment.user
    @current_user = current_user
  end

  # GET /comments/new
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new(comment_params)
    @comment.blog = @blog
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
        format.js {}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  #TODO:可以增加删除功能
  # DELETE /comments/1 or /comments/1.json
  def destroy
    @blog = @comment.blog
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to blog_path(@blog) ,notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:blog_id, :content,:user_id)
    end
end
