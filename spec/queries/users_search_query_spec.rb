require 'rails_helper'

RSpec.describe UsersSearchQuery do
  subject(:context) { described_class }

  describe '.call' do
    let(:users)   { User.where(id: [user_1.id, user_5.id]) }
    let!(:user_1) { create(:user, name: 'James Smith') }
    let!(:user_2) { create(:user, name: 'Anthony Smith') }
    let!(:user_3) { create(:user, name: 'James Bond') }
    let!(:user_4) { create(:user, email: 'james@example.com') }
    let!(:user_5) { create(:user, name: 'Andrew') }
    let!(:user_6) { create(:user, name: 'John') }

    it { expect(context.new(User, value: 'james').call).to contain_exactly(user_1, user_3, user_4) }
    it { expect(context.new(User, value: 'smith').call).to contain_exactly(user_1, user_2) }
    it { expect(context.new(User, value: 'anthony').call).to contain_exactly(user_2) }
    it { expect(context.new(users, value: '').call).to contain_exactly(user_1, user_5) }
    it { expect(context.new(User, value: 'qwerty').call).to be_empty }
  end
end
