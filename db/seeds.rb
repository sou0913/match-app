# frozen_string_literal: true

[*(1..30)].each do |i|
  User.create(name: "test", email: "test#{i}@test.com", role: 0,
  password: "password", password_confirmation: "password")
end
[*(31..60)].each do |i|
  User.create(name: "test", email: "test#{i}@test.com", role: 1,
  password: "password", password_confirmation: "password")
end