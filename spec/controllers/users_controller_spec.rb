# frozen_string_literal: true

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {
      first_name: 'leah',
      last_name: 'eramo',
      gender: 'female',
      username: 'leahpleurodon',
      dob: '13/03/1991',
      active: true,
      email: 'ohai@email.com',
      password: 'pudding'
    }
  end

  let(:invalid_attributes) do
    {
      username: nil,
      email: nil,
      password: nil
    }
  end
  let(:auth_user)do
    create(:auth_user).id
  end
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
     
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param, auth_id:auth_user}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        
        expect do
          post :create, params: { user: valid_attributes }, session: valid_session
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        
        post :create, params: { user: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(user_url(User.first))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        
        post :create, params: { user: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          first_name: 'rachel',
          last_name: 'ferretto',
          gender: 'female',
          username: 'rachy',
          dob: '12/09/1990',
          active: false,
          email: 'suppp@email.com',
          password: 'pudding'
        }
      end

      it 'updates the requested user' do
       
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes, auth_id:auth_user}, session: valid_session
        user.reload
        expect(user.first_name).to eq('rachel')
        expect(user.last_name).to eq('ferretto')
        expect(user.email).to eq('suppp@email.com')
        expect(user.active).to be false
      end

      it 'renders a JSON response with the user' do
       
        user = User.create! valid_attributes

        put :update, params: { id: user.to_param, user: valid_attributes, auth_id:auth_user}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the user' do
       
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes, auth_id:auth_user}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

end
