FactoryBot.define do
  factory :user do
    name             { Faker::Name.first_name }
    sequence(:email) { |n| "email_#{n}@example.com" }
    password         { '123456' }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'image.png'), 'image/png') }
  end
end
