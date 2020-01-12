require 'rails_helper'

RSpec.describe Users::Update do
  describe '.call' do
    subject(:context) { described_class.call(params) }

    let(:user)                  { create(:user) }
    let(:name)                  { 'Имя' }
    let(:password)              { '123123' }
    let(:password_confirmation) { '123123' }

    let(:params) do
      {
        user: UserForm.new(user),
        params: {
          name: name,
          password: password,
          password_confirmation: password_confirmation
        }
      }
    end

    context 'when valid' do
      context 'with password' do
        it { expect(context).to be_success }
        it { expect(context.user.model.reload.name).to eq(name) }
      end

      context 'without password' do
        let(:password) { '' }

        it { expect(context).to be_success }
        it { expect(context.user.model.reload.name).to eq(name) }
      end
    end

    context 'when invalid' do
      context 'without password_confirmation' do
        let(:password)              { '123123' }
        let(:password_confirmation) { '' }

        it { expect(context).not_to be_success }
        it { expect(context.user.model.reload.name).not_to eq(name) }
      end

      context 'without name' do
        let(:name)                  { '' }
        let(:password)              { '123123' }
        let(:password_confirmation) { '123123' }

        it { expect(context).not_to be_success }
        it { expect(context.user.model.reload.name).not_to eq(name) }
      end
    end
  end
end
