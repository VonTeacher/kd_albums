# spec/factories/albums.rb

FactoryBot.define do
  factory :album do
    title { Faker::Music.album }
    artist
  end
end
