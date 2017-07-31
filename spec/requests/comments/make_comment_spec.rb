# describe 'Making a comment on a project', js: true do
#   let(:user) { users(:logan) }
#   login { user }

#   it 'creates a comment on a project' do
#     visit project_path(projects(:carpooling))
#     click_link 'Create'
#     expect(page).to have_selector '#comment_body'
#     fill_in 'comment_body', with: 'Test comment'
#     expect {
#       click_button 'Save'
#       expect(page).to have_content 'Comments (1)'
#       expect(page).to have_content 'Test comment'
#       expect(page).to have_content 'by Logan Serman'
#     }.to change { projects(:carpooling).reload.comments.count }.by 1
#   end

#   it 'sends an e-mail to the project creator' do
#     visit project_path(projects(:carpooling))
#     click_link 'Create'
#     expect(page).to have_selector '#comment_body'
#     fill_in 'comment_body', with: 'Test comment'
#     perform_enqueued_jobs do
#       click_button 'Save'
#       expect(page).to have_content 'Comments (1)'
#       mail = ActionMailer::Base.deliveries[0]
#       expect(mail).to be_present
#       expect(mail.to).to eq [user.email]
#       expect(mail.subject).to eq 'New comment on Carpooling to Work'
#       expect(mail.body.encoded).to match project_path(projects(:carpooling))
#     end
#   end

# end
