require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all
 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.


50.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Number.digit
    )
end
advertisements = Advertisement.all

#Create Posts
50.times do
  Post.create!(
    user:   users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
      post: posts.sample,
      body: Faker::Lorem.paragraph
    )
end

50.times do
  Question.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    )
end
questions = Question.all

Post.create!(
    title: "This is me!",
    body: "This is my post that Cecily created"
  )

Comment.create!(
    post: posts.sample,
    body: "This is a stupid post!"
  )

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
    email: 'its.cecilyy@gmail.com',
    password: 'cecilyc92'
  )

puts "Seed Finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
