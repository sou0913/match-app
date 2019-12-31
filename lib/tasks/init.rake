namespace :init do
  desc "delete messages"
  task messages: :environment do
    Message.all.delete_all
  end
  desc "rebuild relations"
  task relations: :environment do
    Redis.current.flushall()
    [*(1..20)].each do |i|
      Redis.current.sadd("role-0", i)
    end
    Redis.current.sadd("role-1", 21)
    [*(1..9)].each do |i|
      Redis.current.sadd("b-21", i)
      Redis.current.sadd("f-#{i}", 21)
    end
    [1,2].each do |i|
      Redis.current.sadd("f-21", i)
      Redis.current.sadd("b-#{i}", 21)
    end
  end
end
