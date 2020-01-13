require 'rails_helper'

feature 'user', type: :feature do
  let(:user) {create(:user)}
  scenario 'show toppage' do
    visit root_path
    expect(page).to have_no_content("トップページ")

    visit new_user_session_path
    fill_in "my_login_email", with: user.email
    fill_in "my_login_password", with: user.password
    click_button "ログイン"
    expect(current_path).to eq root_path
    expect(page).to have_content("トップページ")
  end 
end

