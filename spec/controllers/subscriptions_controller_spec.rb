describe SubscriptionsController do
  let(:user) { Fabricate :user }

  describe '#new' do
    context 'when a user is signed in' do
      before { sign_in user }

      it 'renders the new view' do
        expect(get :new).to render_template :new
      end
    end

    context 'when a user is not signed in' do
      it 'redirects to the root path' do
        expect(get :new).to redirect_to new_user_session_path
      end
    end
  end
end
