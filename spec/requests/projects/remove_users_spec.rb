describe 'Remove users from group' do
  let(:project) { projects(:carpooling) }
  let(:user) { users(:logan) }
  login { user }

  let(:group) do
    Group.create! project: project, name: 'Metova', bio: 'Bio'
  end

  it 'removes an invitation if it isnt accepted yet', js: true do
    invitation = group.invitations.create! email: 'danny.sperry@metova.com'
    visit step2_project_path(project)
    expect(page).to have_content 'Danny Sperry'
    find('.delete-invite').trigger 'click'
    expect(page).to have_no_content 'Danny Sperry'
    expect { invitation.reload }.to raise_error ActiveRecord::RecordNotFound
  end

  it 'removes an invitation and the user if it is accepted', js: true do
    invitation = group.invitations.create! email: 'danny.sperry@metova.com'
    AcceptGroupInvitation.new(invitation).call
    expect(project.reload.users).to include users(:danny)

    visit step2_project_path(project)
    expect(page).to have_content 'Danny Sperry'
    find('.delete-invite').trigger 'click'

    expect(page).to have_no_content 'Danny Sperry'
    expect { invitation.reload }.to raise_error ActiveRecord::RecordNotFound
    expect(project.reload.users).to_not include users(:danny)
  end

end
