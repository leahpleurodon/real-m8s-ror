# frozen_string_literal: true

RSpec.describe BillImagesController, type: :routing do
    describe 'routing' do
      it 'routes to #show' do
        expect(get: '/bill_images/1').to route_to('bill_images#show', id: '1')
      end
  
      it 'routes to #create' do
        expect(post: '/bill_images').to route_to('bill_images#create')
      end
  
    end
  end
  