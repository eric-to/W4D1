class CommentsController < ApplicationController

  def index    
    if params[:user_id]
      comments = Comment.where(user_id: params[:user_id])
      render json: comments
    elsif params[:artwork_id]
      comments = Comment.where(artwork_id: params[:artwork_id])
      render json: comments
    end
  end
  
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: commment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    render json: comment
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end