
RSpec.describe HouseBillsController, type: :controller do
    let(:auth_user)do
        create(:auth_user).id
    end
    let(:valid_attributes) do
        {
            desc: "Electricity June 18 2018",
            due_date: "31/06/2018",
            amount: 432.2,
            active: true,
            user_id: create(:user),
            category: "Utilities",
            house_id: create(:house)
        }
    end

    let(:invalid_attributes) do
        {
            desc: 123,
            due_date: "hello",
            amount: "cookie",
            active: "hello",
            user_id: nil,
            category: 123
        }
    end
    
    let(:valid_session) { {} }

    describe 'GET #show' do
        it 'returns a success response' do
            house_bill = create(:house_bill)
            get :show, params: { auth_id: auth_user, id: house_bill.to_param }, session: valid_session
            expect(response).to be_successful
        end
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'creates a new house_bill' do
                expect do post :create, params: { auth_id: auth_user, house_bill: valid_attributes }, session: valid_session end.to change(HouseBill, :count).by(1)
            end

            it 'renders a JSON response with the new house_bill' do
                post :create, params: { auth_id: auth_user, house_bill: valid_attributes }, session: valid_session
                expect(response).to have_http_status(:created)
                expect(response.content_type).to eq('application/json')
                expect(response.location).to eq(house_bill_url(HouseBill.last))
            end
        end

        context 'with invalid params' do
            it 'renders a JSON response with errors for the new house_bill' do
                post :create, params: { auth_id: auth_user, house_bill: invalid_attributes }, session: valid_session
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq('application/json')
            end
        end
    end 
    describe 'PUT #update' do
        context 'with valid params' do
        it 'updates the requested house_bill' do
            house_bill = create(:house_bill)
            put :update, params: { auth_id: auth_user, id: house_bill.to_param, house_bill: { desc: 'internet' } }, session: valid_session
            house_bill.reload
            expect(house_bill.desc).to eq('internet')
        end
    
          it 'renders a JSON response with the house_bill' do
                house_bill = create(:house_bill)
                put :update, params: { auth_id: auth_user, id: house_bill.to_param, house_bill: {
                desc: 'internet'
                } }, session: valid_session
                expect(response).to have_http_status(:ok)
                expect(response.content_type).to eq('application/json')
          end
        end
    
        context 'with invalid params' do
            it 'renders a JSON response with errors for the house_bill' do
                house_bill = create(:house_bill)
                put :update, params: { auth_id: auth_user, id: house_bill.to_param, house_bill: { amount: 'very expensive' } }, session: valid_session
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq('application/json')
            end
        end
    end   
end
