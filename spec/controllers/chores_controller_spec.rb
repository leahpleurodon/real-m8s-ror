
RSpec.describe ChoresController, type: :controller do
    let(:valid_session) { {} }
    let(:auth_user)do
        create(:auth_user).id
    end
    describe 'GET #show' do
        it 'returns a success response' do
            chore = create(:chore)
            get :show, params: { auth_id: auth_user, id: chore.to_param }, session: valid_session
            expect(response).to be_successful
        end
    end
end
