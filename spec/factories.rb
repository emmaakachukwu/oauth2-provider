require 'factory_bot'

FactoryBot.define do
  factory :owner, :class => TestApp::User do
    sequence :name do |n|
      "User ##{n}"
    end
  end

  factory :client, :class => OAuth2::Model::Client do
    client_id     { OAuth2.random_string }
    client_secret { OAuth2.random_string }
    sequence :name do |n|
      "Client ##{n}"
    end
    redirect_uri  { 'https://client.example.com/cb' }
  end
end
