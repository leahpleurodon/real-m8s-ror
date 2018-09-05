# frozen_string_literal: true

RSpec.describe HousesController, type: :controller do
  let(:auth_user)do
        create(:auth_user).id
  end
  let(:valid_attributes) do
    {
      type: 'apartment',
      address: '123 fake street',
      state: 'victoria',
      country: 'australia',
      rent_cycle: 'monthly',
      rent: 455.0,
      rent_start_date: '2016-09-01 20:05:36',
      join_code: 'RT45RG4',
      code_expiry_date: '2018-09-03 20:05:36',
      bio: 'Our house, in the middle of the street'
    }
  end

  let(:invalid_attributes) do
    {
      type: 8787,
      address: 9897,
      state: 989,
      country: 878,
      rent_cycle: 9797,
      rent: 'cookie',
      rent_start_date: 99_898,
      join_code: 78_787,
      code_expiry_date: 989_898,
      bio: 989_898
    }
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      house = create(:house)
      get :show, params: { auth_id: auth_user, id: house.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new house' do
        expect do
          post :create, params: { auth_id: auth_user, house: valid_attributes }, session: valid_session
        end.to change(House, :count).by(1)
      end

      it 'renders a JSON response with the new house' do
        post :create, params: { auth_id: auth_user, house: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(house_url(House.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new house' do
        post :create, params: { auth_id: auth_user, house: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested house' do
        house = create(:house)
        put :update, params: { auth_id: auth_user, id: house.to_param, house: { bio: 'this house is a nightmare...' } }, session: valid_session
        house.reload
        expect(house.bio).to eq('this house is a nightmare...')
      end

      it 'renders a JSON response with the house' do
        house = create(:house)
        put :update, params: { auth_id: auth_user, id: house.to_param, house: {
          type: 'house',
          bio: 'literally a death trap'
        } }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the house' do
        house = create(:house)
        put :update, params: { auth_id: auth_user, id: house.to_param, house: { rent: 'very expensive' } }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
