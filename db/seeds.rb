require 'uri'

url = 'https://asset.cloudinary.com/giovannasm/e30181383c52cb97d6dda5b27fec2fd5'

puts 'creating offers'

30.times do
  offer = Offer.new(number: rand(1..100),
                player_name: 'Neymar',
                team: "Brasil",
                special: false,
                description: 'Quero qualquer outro jogador',
                user_id: 2)

  file = URI.open(url)
  offer.photo.attach(io: file, filename: 'Neymar', content_type: 'image/jpg')
  offer.save!
end

puts 'offers created'
