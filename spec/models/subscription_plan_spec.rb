describe SubscriptionPlan do
  let!(:user) { Fabricate :user }

  describe '#redirect_path' do
    context 'when the subscription is active' do
      before { subscriptions(:first).update user: user }

      it 'assigns the owners subscription' do
        SubscriptionPlan.last.redirect_path(subscriptions(:first))
        expect(user.subscription).to eq subscriptions(:first)
      end
    end

    context 'when the subscription is not active' do
      before { payola_subscriptions(:first).update state: 'canceled' }

      it 'deletes the subscription' do
        id = payola_subscriptions(:first).id
        SubscriptionPlan.last.redirect_path(subscriptions(:first))
        expect(Subscription.where(id: id)).to be_empty
      end
    end
  end
end
