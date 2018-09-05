# frozen_string_literal: true

RSpec.describe MateReviewsController, type: :controller do
  let(:auth_user)do
        create(:auth_user).id
  end
  let(:valid_attributes) do
    {
      rating: 4.2,
      comment: 'This person goes alright',
      active: true,
      author_id: create(:user),
      user_id: create(:author)
    }
  end

  let(:invalid_attributes) do
    {
      rating: 'cookie',
      comment: 'This person goes alright',
      active: 'cookie',
      author_id: nil,
      user_id: nil
    }
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      mate_review = create(:mate_review)
      get :show, params: { auth_id: auth_user, id: mate_review.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new mate review' do
        expect do
          post :create, params: { auth_id: auth_user, mate_review: valid_attributes }, session: valid_session
        end.to change(MateReview, :count).by(1)
      end

      it 'renders a JSON response with the new mate review' do
        post :create, params: { auth_id: auth_user, mate_review: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(mate_review_url(MateReview.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new mate review' do
        post :create, params: { auth_id: auth_user, mate_review: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested user' do
        mate_review = create(:mate_review)
        put :update, params: { auth_id: mate_review.author_id, id: mate_review.to_param, mate_review: { rating: 3.7 } }, session: valid_session
        mate_review.reload
        expect(mate_review.rating).to eq(3.7)
      end

      it 'renders a JSON response with the mate_profile' do
        mate_review = create(:mate_review)
        put :update, params: { auth_id: mate_review.author_id, id: mate_review.to_param, mate_review: { rating: 3.7 } }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the mate_review' do
        mate_review = create(:mate_review)
        put :update, params: { auth_id: mate_review.author_id, id: mate_review.to_param, mate_review: { user_id: nil } }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
