# frozen_string_literal: true

RSpec.describe HousesController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/houses/1').to route_to('houses#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/houses').to route_to('houses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/houses/1').to route_to('houses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/houses/1').to route_to('houses#update', id: '1')
    end
  end
end
