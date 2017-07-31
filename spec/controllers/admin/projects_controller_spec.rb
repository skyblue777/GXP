describe Admin::ProjectsController do
  let!(:project) { Fabricate :project }
  let!(:admin) { Fabricate :admin }

  describe '#edit' do
    it 'finds and sets @project' do
      expect(Project).to receive(:find).and_call_original
      sign_in admin
      get :edit, id: project.id
      expect(assigns(:project)).to eq(project)
    end
  end
  describe '#new' do
    it 'instantiates a new project' do
      sign_in admin
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe '#destroy' do
    it 'finds the record' do
      sign_in admin
      expect(Project).to receive(:find).with(project.id.to_s).and_call_original
      delete :destroy, id: project.id
    end

    it 'destroys the record' do
      sign_in admin
      expect { delete :destroy, id: project.id}.to change(Project, :count).by(-1)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      sign_in admin
      get :index
      expect(response).to have_http_status(:success)
    end
  end  
end
