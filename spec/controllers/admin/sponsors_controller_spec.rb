describe Admin::SponsorsController do
  let!(:sponsor) { Fabricate :sponsor }
  let!(:admin) { Fabricate :admin }

  describe '#edit' do
    it 'finds and sets @sponsor' do
      expect(Sponsor).to receive(:find).and_call_original
      sign_in admin
      get :edit, id: sponsor.id
      expect(assigns(:sponsor)).to eq(sponsor)
    end
  end
  describe '#new' do
    it 'instantiates a new sponsor' do
      sign_in admin
      get :new
      expect(assigns(:sponsor)).to be_a_new(Sponsor)
    end
  end

  describe '#destroy' do
    it 'finds the record' do
      sign_in admin
      expect(Sponsor).to receive(:find).with(sponsor.id.to_s).and_call_original
      delete :destroy, id: sponsor.id
    end

    it 'destroys the record' do
      sign_in admin
      expect { delete :destroy, id: sponsor.id}.to change(Sponsor, :count).by(-1)
    end
  end

  describe '#show' do
    it 'assigns the sponsor' do
      sign_in admin
      get :show, id: sponsor.id
      expect(assigns(:sponsor)).to eq(sponsor)
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
