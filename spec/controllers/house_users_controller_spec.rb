# frozen_string_literal: true

RSpec.describe HouseUsersController, type: :controller do
  let(:auth_user)do
    create(:auth_user).id
  end
  let(:valid_attributes) do
    {
      user_id: create(:user),
      is_admin: true,
      active: true,
      house_id: create(:house)
    }
  end

  let(:invalid_attributes) do
    {
      user: nil,
      is_admin: true,
      active: 'cookie',
      house: nil
    }
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      house_user = create(:house_user)
      get :show, params: { auth_id: auth_user, id: house_user.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new house_user' do
        expect do
          post :create, params: { auth_id: auth_user, house_user: valid_attributes }, session: valid_session
        end.to change(HouseUser, :count).by(1)
      end

      it 'renders a JSON response with the new house_user' do
        post :create, params: { auth_id: auth_user, house_user: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(house_user_url(HouseUser.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new house_user' do
        post :create, params: { auth_id: auth_user, house_user: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
