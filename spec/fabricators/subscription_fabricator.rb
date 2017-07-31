Fabricator(:subscription) do
  name                  "MyString"
  amount                1
  active                true
  customer_id           "MyString"
  card_id               "MyString"
  card_brand            "MyString"
  card_last_4           "MyString"
  card_exp_month        1
  card_exp_year         1
  user
  subscription_plan
end
