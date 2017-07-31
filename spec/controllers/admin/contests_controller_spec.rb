describe Admin::ContestsController do
  let!(:contest) { Fabricate :contest }
  let!(:admin) { Fabricate :admin }

  describe "GET #index" do
    it "returns http success" do
      sign_in admin
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#edit' do
    it 'finds and sets @contest' do
      sign_in admin
      get :edit, id: contest.slug
      expect(assigns(:contest)).to eq(contest)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      sign_in admin
      expect { delete :destroy, id: contest.slug}.to change(Contest, :count).by(-1)
    end
  end
end
