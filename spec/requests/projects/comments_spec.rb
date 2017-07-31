describe 'Project Comments', js: true do
  include ActionView::Helpers::DateHelper

  let!(:project) { Fabricate :project, finalized: true }
  let!(:comments) { Fabricate.times 2, :comment, project: project, commentable: project }
  let!(:comment_comments) { Fabricate.times 2, :comment, project: project, commentable: comments.first }

  describe 'when not logged in' do

    it 'displays number of comments on a project' do
      visit project_path(project)
      within('#comment-container #comments') do
        expect(page).to have_content 4
      end
    end

    it 'displays comments' do
      visit project_path(project)
      within('#comment-container #comments-area') do
        comments.each do |comment|
          expect(page).to have_content time_ago_in_words(comment.created_at)
          expect(page).to have_content comment.user.name
          expect(page).to have_content comment.body
        end
      end
    end

    it 'displays nested comments' do
      visit project_path(project)
      within("#comment-container #comments-area #comment-#{comments.first.id}") do
        comment_comments.each do |comment|
          expect(page).to have_content comment.body
        end
      end
    end

    it 'disables comment forms' do
      visit project_path(project)
      expect(find('#comments form input[type=submit]')).to be_disabled
    end

  end

  describe 'when logged in' do
    let!(:user) { users(:logan) }
    login { user }
    let!(:string_about_being_a_house) { 'i am a house' }


    it 'can comment on project' do
      visit project_path(project)
      within('#comments form:first-child') do
        fill_in 'comment_body', with: string_about_being_a_house
        click_button 'Save'
      end
      expect(page).to have_content string_about_being_a_house
    end

    it 'can comment on another comment' do
      visit project_path(project)
      within("#comment-#{comment_comments.last.id}") do
        find('.add-comment-btn').click
        fill_in 'comment_body', with: string_about_being_a_house
        click_button 'Save'
        expect(page).to have_content string_about_being_a_house
      end
    end

  end
end
