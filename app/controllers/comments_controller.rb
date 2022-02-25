class CommentsController < ApplicationController
  
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(parent_id: params[:parent_id])

  end  

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
