describe SponsorsController do
  let!(:base_params) { {} }

  describe '#new' do
    it 'assigns a new Sponsor' do
      get :new
      expect(assigns(:sponsor)).to be_a_new(Sponsor)
    end
  end

  describe '#create' do
    let!(:params) { Fabricate.to_params :sponsor }
    it 'creates the sponsor according to the params' do
      post :create, base_params.merge(sponsor: params)
      expect(assigns(:sponsor).name).to eq params[:name]
    end
  end
end
