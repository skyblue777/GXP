describe 'Manage projects' do
  login { admins(:admin) }

  describe 'show page' do
    let(:project) { projects(:carpooling) }

    it 'displays info' do
      users(:danny).votes.create! project: project
      visit admin_project_path(project)
      expect(page).to have_content 'Carpooling to Work'
      expect(all('.panel-body')[1].native.text).to eq '1'
      expect(all('.panel-body')[2].native.text).to eq 'logan.serman@metova.com'
    end

    it 'displays all users on a project' do
      project.users << users(:danny)
      visit admin_project_path(project)
      expect(page).to have_content 'logan.serman@metova.com and danny.sperry@metova.com'
    end
  end

end
