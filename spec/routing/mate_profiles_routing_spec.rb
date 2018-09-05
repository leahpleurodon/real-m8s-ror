# frozen_string_literal: true

RSpec.describe MateProfilesController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/mate_profiles/1').to route_to('mate_profiles#show', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/mate_profiles/1').to route_to('mate_profiles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/mate_profiles/1').to route_to('mate_profiles#update', id: '1')
    end
  end
end
