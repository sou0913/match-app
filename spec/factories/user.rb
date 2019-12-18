FactoryBot.define do
  factory :user do
    name                  {"sou"}
    email                 {"sou@gmail.com"}
    password              {"1234abcd"}
    password_confirmation {"1234abcd"}
    role                  {1}
  end
end