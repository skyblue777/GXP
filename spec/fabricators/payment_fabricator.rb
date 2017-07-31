Fabricator(:payment) do
  transaction_id "MyString"
  location_id    "MyString"
  amount         1
  card_brand     "MyString"
  card_last_4    "MyString"
  order          nil
  subscription   nil
  user           nil
  tender_id      "MyString"
end
