class CommentsController < ApplicationController
  # authenticated!
  before_action :set_project

  def index
    @comment = Comment.new
    @comments = @project.comments.order(created_at: params.fetch(:order, :asc))
  end

  def create
    if !current_user.nil?
      @comment = @project.comments.build(permitted_params.merge(user: current_user))
    else
      @comment = @project.comments.build(permitted_params)
    end
    if @comment.save
      CommentMailer.comment_made(@comment).deliver_later
      respond_with @comment, location: project_path(@project)
    else
      error_message = @comment.errors.full_messages.to_sentence
      error_message += "<br/>#{@comment.body}" if @comment.errors.messages[:body] && @comment.body.present?
      redirect_to project_path(@project), alert: error_message.html_safe
    end
  end

  private

    def permitted_params
      params.require(:comment).permit :body, :commentable_id, :commentable_type
    end

    def set_project
      @project = Project.find params[:project_id]
    end
end
