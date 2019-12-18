class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :relations
  mount_uploader :image, ImagesUploader
  # enum role: [
  #   :company,
  #   :club
  # ]
  enum address: [
    :noaddress, 
    :hokkaido,
    :aomori,
    :iwate,
    :miyagi,
    :akita,
    :yamagata,
    :fukushima,
    :ibaraki,
    :tochigi,
    :gunma,
    :saitama,
    :chiba,
    :tokyo,
    :kanagawa,
    :niigata,
    :toyama,
    :ishikawa,
    :fukui,
    :yamanashi,
    :nagano,
    :gifu,
    :shizuoka,
    :aichi,
    :mie,
    :shiga,
    :kyoto,
    :osaka,
    :hyogo,
    :nara,
    :wakayama,
    :tottori,
    :shimane,
    :okayama,
    :hiroshima,
    :yamaguchi,
    :tokushima,
    :kagawa,
    :ehime,
    :kochi,
    :fukuoka,
    :saga,
    :nagasaki,
    :kumamoto,
    :oita,
    :miyazaki,
    :kagoshima,
    :okinawa]
  enum genre: [
    :nogenre,
    :rock,
    :classic,
    :wa
  ]
  enum people: [
    :nopeople,
    :one,
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :overTen
  ]
end
