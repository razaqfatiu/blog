class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id ])
    @comment = @post.comments.create(comment_param )
    redirect_to post_path(@post)
  end

  # def edit
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  # end

  # def update
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   if @comment.update(comment_param)
  #     redirect_to post_path(@post)
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_param
  params.require(:comment).permit(:name, :comment)  
  end
  
end
