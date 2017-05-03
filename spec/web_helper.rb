def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'alice@email.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up!'
end
