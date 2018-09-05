require 'rails_helper'

RSpec.describe UserHouseChoresController, type: :controller do
    let(:auth_user)do
        create(:auth_user).id
    end
    let(:valid_attributes) do
        {
            user_id: create(:user),
            house_id: create(:house),
            active: true,
            chore_id: create(:chore)
        }
    end

    let(:invalid_attributes) do
        {
            user_id: nil,
            house_id: nil,
            active: true,
            chore_id: nil
        }
    end

    let(:valid_session) { {} }

    describe 'GET #show' do
        it 'returns a success response' do
            user_house_chore = create(:user_house_chore)
            get :show, params: { auth_id: auth_user, id: user_house_chore.to_param }, session: valid_session
            expect(response).to be_successful
        end
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'creates a new user_house_chore' do
                expect do
                    post :create, params: { auth_id: auth_user, user_house_chore: valid_attributes }, session: valid_session
                end.to change(UserHouseChore, :count).by(1)
            end

            it 'renders a JSON response with the new user_house_chore' do
                post :create, params: { auth_id: auth_user, user_house_chore: valid_attributes }, session: valid_session
                expect(response).to have_http_status(:created)
                expect(response.content_type).to eq('application/json')
                expect(response.location).to eq(user_house_chore_url(UserHouseChore.last))
            end
        end

        context 'with invalid params' do
            it 'renders a JSON response with errors for the new user_house_chore' do
                post :create, params: { auth_id: auth_user, user_house_chore: invalid_attributes }, session: valid_session
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq('application/json')
            end
        end
    end    
end
