describe 'Addresses' do
  let!(:order) { Fabricate :order }
  let!(:product) { Fabricate :product }

  describe 'new' do
    it 'displays the new address form' do
      visit new_address_path
      expect(page).to have_content 'Address for Order'
    end

    context 'when the user has already entered a valid address' do
      let!(:address) { Fabricate.build :address }

      it 'keeps the current address' do
        visit products_path
        within("#product#{product.id}") do
          click_button('Add to cart')
        end
        expect(page).to have_content 'Check out Now'
        expect(page).to have_content product.name
        click_link 'Check out Now'
        expect(page).to have_content 'Address'
        fill_in 'address_name', with: address.name
        fill_in 'address_street', with: address.street
        fill_in 'address_city', with: address.city
        fill_in 'address_state', with: address.state
        fill_in 'address_zip', with: address.zip
        click_button 'Create Address'
        expect(page).to have_content 'Your Order'
        visit products_path
        within("#product#{product.id}") do
          click_button('Add to cart')
        end
        expect(page).to have_content 'Check out Now'
        expect(page).to have_content product.name
        click_link 'Check out Now'
        expect(page).to have_content 'Address'
        expect(page).to have_content address.name
      end
    end

    context 'when the user enters an invalid address' do
      let!(:address) { Fabricate :address }

      it 'displays the proper errors' do
        visit products_path
        within("#product#{product.id}") do
          click_button('Add to cart')
        end
        expect(page).to have_content 'Check out Now'
        expect(page).to have_content product.name
        click_link 'Check out Now'
        expect(page).to have_content 'Address'
        click_button 'Create Address'
        expect(page).to have_no_content 'Your Order'
        expect(page).to have_content 'Address'
        expect(page).to have_selector 'span.error-message'
      end
    end
  end
end
