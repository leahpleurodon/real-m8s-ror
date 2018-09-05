# frozen_string_literal: true

RSpec.describe MateProfilesController, type: :controller do
  let(:valid_session) { {} }
  let(:auth_user)do
        create(:auth_user).id
  end
  describe 'GET #show' do
    it 'returns a success response' do
      mate_profile = create(:mate_profile)
      get :show, params: { auth_id: auth_user, id: mate_profile.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested mate profile' do
        mate_profile = create(:mate_profile)
        
        put :update, params: { auth_id: mate_profile.user_id, id: mate_profile.to_param, mate_profile: { job: 'Web Developer' } }, session: valid_session
        mate_profile.reload
        expect(mate_profile.job).to eq('Web Developer')
      end

      it 'renders a JSON response with the mate_profile' do
        mate_profile = create(:mate_profile)
        put :update, params: { auth_id: mate_profile.user_id, id: mate_profile.to_param, mate_profile: {
          marital_status: 'widowed',
          job: 'Web Developer'
        } }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the mate_profile' do
        mate_profile = create(:mate_profile)
        put :update, params: { auth_id: mate_profile.user_id, id: mate_profile.to_param, mate_profile: { user_id: nil } }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
