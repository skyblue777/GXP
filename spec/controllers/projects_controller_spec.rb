describe ProjectsController do
  let(:user) { Fabricate :user }
  login { user }

  describe '#show' do
    let!(:project) { Fabricate :project, finalized: true }
    let(:base_params) { { id: project.id } }

    it 'assigns the project' do
      get :show, base_params
      expect(assigns(:project)).to eq project
    end

    it 'assigns the child comments' do
      comment = Fabricate :comment, project: project, commentable: project
      comments_comment = Fabricate :comment, project: project, commentable: comment
      get :show, base_params
      expect(assigns(:comments)).to match_array [comment]
    end

    it 'assigns the new comment' do
      get :show, base_params
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

end
