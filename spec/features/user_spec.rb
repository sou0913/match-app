require 'rails_helper'

feature 'user', type: :feature do
  let(:user) {create(:user)}
  scenario 'show toppage' do
    visit root_path
    expect(page).to have_no_content('トップページ')
  end 
end

