class CommentsController < ApplicationController
  def create
    @area = Area.find(params[:area_id])
    comment = @area.comments.new(comment_params)
    comment.user = current_user || User.find(5)

    if comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to @area
    else
      flash[:alert] = "Comment failed to save."
      redirect_to @area
    end
  end

  def destroy
    @area = Area.find(params[:area_id])
    comment = @area.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to @area
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to @area
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete this comment."
      redirect_to comment.area
    end
  end
end
