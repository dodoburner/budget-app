require 'rails_helper'

RSpec.describe '/groups', type: :request do
  before(:example) do
    @user = User.create!(email: 'mail@gmail.com', name: 'pendo', password: '111111', password_confirmation:'111111')
    sign_in @user
  end

  let(:valid_attributes) do
    file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    {name: 'apple', user: User.first, icon: file}
  end

  let(:invalid_attributes) do
    {name: 'book'}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Group.create! valid_attributes
      get groups_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Group' do
        expect do
          post groups_url, params: { group: valid_attributes }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the created group' do
        post groups_url, params: { group: valid_attributes }
        expect(response).to redirect_to(groups_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Group' do
        expect do
          post groups_url, params: { group: invalid_attributes }
        end.to change(Group, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post groups_url, params: { group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested group' do
      group = Group.create! valid_attributes
      expect do
        delete group_url(group)
      end.to change(Group, :count).by(-1)
    end

    it 'redirects to the groups list' do
      group = Group.create! valid_attributes
      delete group_url(group)
      expect(response).to redirect_to(groups_url)
    end
  end
end
