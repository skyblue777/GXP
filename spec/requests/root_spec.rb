describe 'Root page' do
  let(:user) { users(:logan) }
  login { user }

  context 'user with a redemption code' do
    it 'are directed to start a project' do
      expect(user.redemption_code).to be_present
      visit root_path
      expect(page).to have_link I18n.t('root.links.start_project')
    end
  end

  context 'user with a subscription' do
    it 'are directed to buy the book' do
      user.update redemption_code: nil
      payola_subscription = double('Payola Subscription')
      allow(payola_subscription).to receive_messages(active?: true)
      allow_any_instance_of(User).to receive(:payola_subscription) { payola_subscription }
      visit root_path

      expect(page).to have_link I18n.t('root.links.buy_book')
    end
  end

  context 'user without a redemption code or subscription' do
    it 'are directed to buy subscription or buy the book' do
      user.update redemption_code: nil
      visit root_path

      expect(page).to have_link I18n.t('root.links.buy_book_or_subscription')
    end
  end
end
