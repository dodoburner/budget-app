require 'rails_helper'

RSpec.describe 'purchases', type: :system do
  before(:example) do
    @user = User.create!(email: 'mail@gmail.com', name: 'pendo', password: '111111', password_confirmation:'111111')
    file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    @group= Group.create!(name: 'food', user: User.first, icon: file)
    @group1= Group.create!(name: 'cars', user: User.first, icon: file)
    @transaction = Purchase.create!(name: 'fruit', amount: 50, groups: [@group], author: @user)
    @transaction1 = Purchase.create!(name: 'milk', amount: 111, groups: [@group], author: @user)
    sign_in @user
  end

  it 'shows the list of groups' do
    visit group_purchases_path(@group)
    expect(page).to have_content('fruit')
    expect(page).to have_content('milk')
  end

  it 'shows the amount for a purchase' do
    visit group_purchases_path(@group)
    expect(page).to have_content('Amount: 50')
    expect(page).to have_content('Amount: 111')
  end

  it 'shows the total amount' do
    visit group_purchases_path(@group)
    expect(page).to have_content('$161')
  end

  it 'new category button redirects to groups#new' do
    visit group_purchases_path(@group)
    find('a', text: "NEW PURCHASE").click
    expect(page).to have_current_path(new_group_purchase_path(@group))
  end
end