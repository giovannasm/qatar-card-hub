require 'open-uri'

Offer.destroy_all
User.destroy_all

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

url_neymar = 'https://res.cloudinary.com/giovannasm/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1661274467/zz76qvx2zvhey20m6svu.jpg'
url_cr7 = 'https://res.cloudinary.com/giovannasm/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1661282610/cr7_f9fjl5.jpg'
url_vinijr = 'https://res.cloudinary.com/giovannasm/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1661282610/vinijr_aonnql.jpg'
url_messi = 'https://res.cloudinary.com/giovannasm/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1661282610/messi_xs2qjb.jpg'

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Neymar',
                    team: "Brasil",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user: User.all.sample)

  file = URI.open(url_neymar)
  offer.photo.attach(io: file, filename: 'Neymar.jpg', content_type: 'image/jpg')
  offer.save!
end

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Cristiano Ronaldo',
                    team: "Portugal",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user: User.all.sample)

  file = URI.open(url_cr7)
  offer.photo.attach(io: file, filename: 'CRonaldo.jpg', content_type: 'image/jpg')
  offer.save!
end

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Vinicius Jr',
                    team: "Brasil",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user: User.all.sample)

  file = URI.open(url_vinijr)
  offer.photo.attach(io: file, filename: 'ViniJr.jpg', content_type: 'image/jpg')
  offer.save!
end

10.times do
  offer = Offer.new(number: rand(1..100),
                    player_name: 'Messi',
                    team: "Argentina",
                    special: false,
                    description: 'Quero qualquer outro jogador',
                    user: User.all.sample)

  file = URI.open(url_messi)
  offer.photo.attach(io: file, filename: 'Messi.jpg', content_type: 'image/jpg')
  offer.save!
end

puts 'offers created'
