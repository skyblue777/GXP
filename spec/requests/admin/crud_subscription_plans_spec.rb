describe 'Manage subscription_plans' do
  login { admins(:admin) }
  before { payola_subscriptions(:first).update plan: subscription_plans(:test) }

  it 'updates the subscription_plan' do
    visit admin_subscription_plans_path
    within("#subscription-plan-#{subscription_plans(:test).id}") do
      click_link 'Edit'
    end
    fill_in 'subscription_plan_name', with: 'Test 123'
    click_button 'Save'
    expect(page).to have_content 'Test 123'
    expect(subscription_plans(:test).reload.name).to eq 'Test 123'
  end

  it 'shows an error when subscription_plan name is blank' do
    visit edit_admin_subscription_plan_path(subscription_plans(:test))
    fill_in 'subscription_plan_name', with: ''
    click_button 'Save'
    expect(page).to have_content "can't be blank"
  end

  it 'displays the number of subscriptions on show' do
    visit admin_subscription_plan_path(subscription_plans(:test))
    expect(page).to have_content(1)
    expect(page).to have_content(0)
  end

end
