# frozen_string_literal: true

RSpec.describe UserPetsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/user_pets/1').to route_to('user_pets#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/user_pets').to route_to('user_pets#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/user_pets/1').to route_to('user_pets#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/user_pets/1').to route_to('user_pets#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/user_pets/1').to route_to('user_pets#destroy', id: '1')
    end
  end
end
