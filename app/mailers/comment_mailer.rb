class CommentMailer < ApplicationMailer

  def comment_made(comment)
    @commented_user = comment.user.blank? ? "Guest" : comment.user.name 
    @project = comment.project
    @url = project_url(@project)
    recipients = @project.users.pluck(:email)
    mail to: "deshbhratarakash@gmail.com", subject: "New comment on #{@project}"
  end

end
