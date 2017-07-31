class VotesController < ApplicationController
  authenticated!

  def create
    @project = Project.find params[:project_id]
    counter = 0
    if current_user.is_permanent?
      create_vote(@project, counter)
    elsif current_user.subscriptions.first.renewal_status? && current_user.subscriptions.first.active?
      create_vote(@project, counter)
    else
      flash[:alert] = "Please renew your subscription Plan. You can't vote now."
      respond_with @vote, location: project_path(@project)      
    end
  end

  private

    def destroy_previous_vote_in_contest(contest)
      vote = current_user.votes_in_contest(contest).take
      vote.destroy if vote
      @_previous_vote = vote
    end

    def restore_previous_vote
      @_previous_vote.dup.save if @_previous_vote
    end

    def create_vote(project, counter)

      if !current_user.votes.blank?
        current_user.votes.each do |proj|
          if (proj.contest.ends_at.to_date - Time.zone.now.to_date).to_i > 0
            counter = counter + 1   
          end
        end
        if counter == 0
          flash[:alert] = "You can't vote for the project. Your vote already registered"
          redirect_to project_path(project) and return
        end
      end
      destroy_previous_vote_in_contest project.contest
      @vote = project.votes.create user: current_user
      if @vote.persisted?
        flash[:alert] = "Your vote has been submitted successfully."
        respond_with @vote, location: project_path(project)
      else
        restore_previous_vote
        flash[:alert] = @vote.errors.full_messages.to_sentence
        redirect_to project_path(project)
      end      
      
    end

end
