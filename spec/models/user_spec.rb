# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe '#full_name' do
    it 'returns a full name' do
      user = create(:user)
      expect(user.full_name).to eq('leah eramo')
    end
  end
end
