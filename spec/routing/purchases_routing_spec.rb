require 'rails_helper'

RSpec.describe PurchasesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/groups/1/purchases').to route_to('purchases#index', group_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/groups/1/purchases/new').to route_to('purchases#new', group_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/groups/1/purchases').to route_to('purchases#create', group_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/groups/1/purchases/1').to route_to('purchases#destroy', group_id: '1', id: '1')
    end
  end
end
