require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:context) { described_class.new(user) }

  let(:user) { create(:user) }

  describe '.display_user_link' do
    let(:user_link) do
      "<a href=\"/users/#{user.id}\">#{user.name}</a>"
    end

    it { expect(context.display_user_link).to eq(user_link) }
  end

  describe '.generate_i18n' do
    let(:html) do
      '<span>Имя</span>'\
        "<span>#{user.name}</span>"
    end

    it { expect(context.generate_i18n(User, :name, user.name)).to eq(html) }
  end

  describe '.display_avatar' do
    let(:avatar) do
      src = user.avatar.thumb.file.exists? ? user.avatar.thumb.url : user.avatar.url
      h.content_tag(:img, alt: 'avatar', class: 'rounded-circle', src: src) {}
    end

    it { expect(context.display_avatar).to eq(avatar) }
  end
end
