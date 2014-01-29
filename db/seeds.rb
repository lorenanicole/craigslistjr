require 'faker'

10.times do
  Category.create(name: Faker::Commerce.department)
end

100.times do
  Post.create(title: Faker::Company.bs, category_id: rand(1..10),
              description: Faker::Lorem.paragraph, price: rand(1..50),
              email: Faker::Internet.email,
              key: "#{(0...8).map { (65 + rand(26)).chr }.join}")
end



