class UserCommentsController < ApplicationController

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.commenting_user_id = current_user.id
    if @user_comment.save
      redirect_to user_url(@user_comment.commented_user_id)
    else
      flash[:errors] = @user_comment.errors.full_messages
      redirect_to user_url(@user_comment.commented_user_id)
    end
  end

  def user_comment_params
    params.require(:user_comment).permit(:commented_user_id, :body)
  end
end
