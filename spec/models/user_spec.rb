# frozen_string_literal: true

require 'rails_helper'
describe User do
  describe '#create' do
    it 'is invalid without a name' do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it 'is invalid without a email' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it 'is invalid without a password' do
      user = build(:user, password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:password]). to include("を入力してください")
    end
    it 'is invalid if pssword and password_confirmation are not equal' do
      user = build(:user, password_confirmation: "hoge")
      user.valid?
      expect(user.errors[:password_confirmation]). to include("とパスワードの入力が一致しません")
    end
    it 'is invalid if length of password < 6' do
      user = build(:user, password: "hoge", password_confirmation: "hoge")
      user.valid?
      expect(user.errors[:password]). to include("は6文字以上で入力してください")
    end
    it 'is invalid if length of password > 128' do
      pass = ""
      129.times do pass += "a" end 
      user = build(:user, password: pass, password_confirmation: pass)
      user.valid?
      expect(user.errors[:password]). to include("は128文字以内で入力してください")
    end

    it 'is invalid to two users have same email' do
      user = build(:user)
      user.save()
      user2 = build(:user, email: user.email)
      user2.valid?
      expect(user2.errors[:email]). to include("はすでに存在します")
    end
  end
end
