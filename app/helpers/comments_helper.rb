module CommentsHelper
  def liked_comment(comment)
    comment.likes.pluck("user_id").include?(@current_user.id)
  end
end
