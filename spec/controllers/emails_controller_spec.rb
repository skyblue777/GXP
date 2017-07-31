describe EmailsController do
  let!(:order) { Fabricate :order, email: nil }

  describe '#new' do

    context 'when the order does not have an email created yet' do
      it 'assigns a new email' do
        request.session[:order_id] = order.id
        expect(get :new).to render_template :new
      end
    end

    context 'when the order already has an email created' do
      before { order.update email: 'a@b.com' }

      it 'it redirects to the new address path' do
        request.session[:order_id] = order.id
        expect(get :new).to redirect_to(checkout_path(order))
      end
    end

  end
end