# frozen_string_literal: true

RSpec.describe HouseBillsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/house_bills/1').to route_to('house_bills#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/house_bills').to route_to('house_bills#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/house_bills/1').to route_to('house_bills#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/house_bills/1').to route_to('house_bills#update', id: '1')
    end
  end
end
