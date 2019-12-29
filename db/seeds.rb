# frozen_string_literal: true

[*(1..30)].each do |i|
  User.create(name: "test#{i}", email: "test#{i}@test.com", role: 0,
  password: "password", password_confirmation: "password")
  Redis.current.sadd("role-0", i)
end
[*(31..60)].each do |i|
  User.create(name: "test#{i}", email: "test#{i}@test.com", role: 1,
  password: "password", password_confirmation: "password")
  Redis.current.sadd("role-1", i)
  Redis.current.sadd("f-#{i}", 1)
  Redis.current.sadd("b-1", i)
end
