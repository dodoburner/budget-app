require 'rails_helper'

RSpec.describe 'groups', type: :system do
  before(:example) do
    @user = User.create!(email: 'mail@gmail.com', name: 'pendo', password: '111111', password_confirmation: '111111')
    file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    @group = Group.create!(name: 'food', user: User.first, icon: file)
    @group1 = Group.create!(name: 'cars', user: User.first, icon: file)
    @transaction = Purchase.create!(name: 'fruit', amount: 50, groups: [@group], author: @user)
    sign_in @user
  end

  it 'shows the list of groups' do
    visit groups_path
    expect(page).to have_content('food')
    expect(page).to have_content('cars')
  end

  it 'shows the number of transactions for each group' do
    visit groups_path
    expect(page).to have_content('Total Transactions: 1')
    expect(page).to have_content('Total Transactions: 0')
  end

  it 'new category button redirects to groups#new' do
    visit groups_path
    find('a', text: 'NEW CATEGORY').click
    expect(page).to have_current_path('/groups/new')
  end
end
