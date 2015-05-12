require 'faker'

#Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

Post.create!(
    title: "This is me!",
    body: "This is my post that Cecily created"
  )

Comment.create!(
    post: posts.sample,
    body: "This is a stupid post!"
  )

puts "Seed Finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"

