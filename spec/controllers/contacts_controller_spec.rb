describe ContactsController do
  let!(:base_params) { {} }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it 'redirects to the root path if contact is valid' do
      post :create, base_params.merge({ contact: { name: 'abc', phone: '123', email: 'abc@d.com', content: 'Hello' } })
      expect(response).to redirect_to(root_path)
    end

    it 'redirects to the contact path if contact is invalid' do
      post :create, base_params.merge({ contact: { name: 'abc', phone: '123', email: 'abc', content: 'Hello' } })
      expect(response).to render_template :new
    end
  end
end
