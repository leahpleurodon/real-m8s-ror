# frozen_string_literal: true

RSpec.describe MateReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/mate_reviews/1').to route_to('mate_reviews#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/mate_reviews').to route_to('mate_reviews#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/mate_reviews/1').to route_to('mate_reviews#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/mate_reviews/1').to route_to('mate_reviews#update', id: '1')
    end
  end
end
