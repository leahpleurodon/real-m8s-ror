# frozen_string_literal: true

RSpec.describe BillPaymentsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/bill_payments/1').to route_to('bill_payments#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/bill_payments').to route_to('bill_payments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bill_payments/1').to route_to('bill_payments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bill_payments/1').to route_to('bill_payments#update', id: '1')
    end
  end
end
