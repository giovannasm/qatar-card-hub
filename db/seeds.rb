require 'uri'

puts 'creating users'

10.times do
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.username,
               email: Faker::Internet.email,
               password: '*******')
end

puts 'users created'

puts 'creating offers'

url_neymar = 'https://asset.cloudinary.com/giovannasm/e30181383c52cb97d6dda5b27fec2fd5'
url_cr7 = 'https://asset.cloudinary.com/giovannasm/30097744cac7074d9cef557d84fcc467'
url_vinijr = 'https://asset.cloudinary.com/giovannasm/e63b228a52a71d19301f1d6e66944a44'
url_messi = 'https://asset.cloudinary.com/giovannasm/06717f5edbb6f456f4bdea1775e31b02'

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Neymar',
                    team: "Brasil",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user_id: rand(1..10))

  file = URI.open(url_neymar)
  offer.photo.attach(io: file, filename: 'Neymar', content_type: 'image/jpg')
  offer.save!
end

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Cristiano Ronaldo',
                    team: "Portugal",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user_id: 2)

  file = URI.open(url_cr7)
  offer.photo.attach(io: file, filename: 'Neymar', content_type: 'image/jpg')
  offer.save!
end

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Vinicius Jr',
                    team: "Brasil",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user_id: 2)

  file = URI.open(url_vinijr)
  offer.photo.attach(io: file, filename: 'Neymar', content_type: 'image/jpg')
  offer.save!
end

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Messi',
                    team: "Argentina",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user_id: 2)

  file = URI.open(url_messi)
  offer.photo.attach(io: file, filename: 'Neymar', content_type: 'image/jpg')
  offer.save!
end

puts 'offers created'
