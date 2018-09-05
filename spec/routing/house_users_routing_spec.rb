# frozen_string_literal: true

RSpec.describe HouseUsersController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/house_users/1').to route_to('house_users#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/house_users').to route_to('house_users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/house_users/1').to route_to('house_users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/house_users/1').to route_to('house_users#update', id: '1')
    end
  end
end
