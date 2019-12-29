# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                  { 'sou' }
    email                 { Faker::Internet.email }
    password              { '1234abcd' }
    password_confirmation { '1234abcd' }
    role                  { 1 }
  end
end
