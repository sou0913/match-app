# frozen_string_literal: true

name_you = ["桂金ギター同好会","蛍印川軽音楽部","勝梓寺吹奏楽部","青山交響楽団","秋飛山ピアノ同好会","奈杏ヶ丘交響楽団","城岡ジャズ研","Algiersブラスバンド",
            "Alexandria交響楽団","益泉軽音楽部","Toulon交響楽団","Trieste交響楽団","Dover吹奏楽団","Mannheims","Lahore吹奏楽団","波戸ヶ丘軽音楽部","Bob",
            "Rambouillet", "豆樫台中学吹奏楽部","前茶町合奏団"]
address = [*(1..47)]
division = [*(1..5)]
people = [*(1..10)]

[*(1..20)].each do |i|
  User.create!(name: name_you[i - 1], email: "test#{i}@test.com", password: 'password', password_confirmation: 'password',
               image: "you-#{i}.jpg", address: address.sample, division: division.sample, people: people.sample, role: 0)
  Redis.current.sadd('role-0', i)
end
User.create(name: '北大邦楽研究会', email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest',
            division: 3, people: 10, address: 1, role: 1)
Redis.current.sadd('role-1', 21)
