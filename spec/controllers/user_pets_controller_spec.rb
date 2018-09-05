# frozen_string_literal: true

RSpec.describe UserPetsController, type: :controller do
  let(:auth_user)do
    create(:auth_user).id
  end
  let(:user)do
    create(:user)
  end
  let(:valid_attributes) do
    {
      name: 'Murphay',
      species: 'Dog',
      size: 'Large',
      people_friendly: true,
      child_friendly: true,
      pet_friendly: false,
      active: true,
      bio: 'Murphy might maul your small dog or cat, other than that he is fine.',
      user_id: user.id
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      species: nil,
      size: 'Large',
      people_friendly: true,
      child_friendly: true,
      pet_friendly: false,
      active: true,
      bio: 'Murphy might maul your small dog or cat, other than that he is fine.',
      user_id: user.id
    }
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      user_pet = create(:user_pet)
      get :show, params: { auth_id: auth_user, id: user_pet.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user pet' do
        
        expect do
          post :create, params: { auth_id: user.id, user_pet: valid_attributes }, session: valid_session
        end.to change(UserPet, :count).by(1)
      end

      it 'renders a JSON response with the new user pet' do
        post :create, params: { auth_id: user.id, user_pet: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(user_pet_url(UserPet.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user pet' do
        post :create, params: { auth_id: user.id, user_pet: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested user pet' do
        user_pet = create(:user_pet)
        put :update, params: { auth_id: user_pet.user_id, id: user_pet.to_param, user_pet: { name: 'Arnie' } }, session: valid_session
        user_pet.reload
        expect(user_pet.name).to eq('Arnie')
      end

      it 'renders a JSON response with the user pet' do
        user_pet = create(:user_pet)
        put :update, params: { auth_id: user_pet.user_id, id: user_pet.to_param, user_pet: {
          species: 'cat',
          bio: 'grumpy old man dog'
        } }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the user_pet' do
        user_pet = create(:user_pet)
        put :update, params: { auth_id: user_pet.user_id, id: user_pet.to_param, user_pet: { user_id: nil } }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
