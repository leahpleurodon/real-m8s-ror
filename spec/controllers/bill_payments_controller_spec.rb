
RSpec.describe BillPaymentsController, type: :controller do
    let(:auth_user)do
        create(:auth_user).id
    end
    let(:valid_attributes) do
        {
            desc: "Electricity June 18 2018",
            due_date: "31/06/2018",
            amount_due: 432.2,
            active: true,
            user_id: create(:user),
            paid: false,
            house_bill_id: create(:house_bill)
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
            bill_payment = create(:bill_payment)
            get :show, params: { auth_id: auth_user, id: bill_payment.to_param }, session: valid_session
            expect(response).to be_successful
        end
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'creates a new bill_payment' do
                expect do
                    post :create, params: { auth_id: auth_user, bill_payment: valid_attributes }, session: valid_session
                end.to change(BillPayment, :count).by(1)
            end

            it 'renders a JSON response with the new bill_payment' do
                post :create, params: { auth_id: auth_user, bill_payment: valid_attributes }, session: valid_session
                expect(response).to have_http_status(:created)
                expect(response.content_type).to eq('application/json')
                expect(response.location).to eq(bill_payment_url(BillPayment.last))
            end
        end

        context 'with invalid params' do
            it 'renders a JSON response with errors for the new bill_payment' do
                post :create, params: { auth_id: auth_user, bill_payment: invalid_attributes }, session: valid_session
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq('application/json')
            end
        end
    end 
    describe 'PUT #update' do
        context 'with valid params' do
            it 'updates the requested bill_payment' do
                bp = create(:bill_payment)
                
                put :update, params: { auth_id: bp.user_id, id: bp.to_param, bill_payment: { paid: true } }, session: valid_session
                bp.reload
                expect(bp.paid).to be true
            end
        
            it 'renders a JSON response with the bill_payment' do
                bill_payment = create(:bill_payment)
                put :update, params: { auth_id: auth_user, id: bill_payment.to_param, bill_payment: {
                paid: true
                } }, session: valid_session
                expect(response).to have_http_status(:ok)
                expect(response.content_type).to eq('application/json')
            end
        end
    
        context 'with invalid params' do
            it 'renders a JSON response with errors for the bill_payment' do
                bill_payment = create(:bill_payment)
                put :update, params: { auth_id: auth_user, id: bill_payment.to_param, bill_payment: { amount_due: 'very expensive' } }, session: valid_session
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq('application/json')
            end
        end
    end  
end
