describe CommentsController do
  let!(:project) { Fabricate :project }
  let!(:user) { Fabricate :user }

  describe '#index' do
    it 'should render the index template' do
      sign_in user
      get :index, project_id: project.id
      expect(response).to render_template(:index)
    end

    it 'should instantiate a new comment' do
      sign_in user
      get :index, project_id: project.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'assigns @comments' do
      allow_any_instance_of(Project).to receive_message_chain('comments.order') { :test }
      sign_in user
      get :index, project_id: project.id
      expect(assigns(:comments)).to eq(:test)
    end
  end
end
