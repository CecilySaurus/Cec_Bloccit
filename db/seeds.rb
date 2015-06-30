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


 # Create Topics
 100.times do
   topic = Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all


# Create Posts
 10000.times do
   post = Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all


 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     user: users.sample,
     body: Faker::Lorem.paragraph
   )
 end

 Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  "Why Boris barks at birds!",
    body:   "Psyche! No one knows."
   )


 Comment.create!(
    post:  posts.sample,
    user:  users.sample,
    body:  "Tell me why?!!> I'll pay you!"
   )
 

# Create Admin
admin = User.new(
  name:     'Admin User',
  email:    'cecily@cruz.com',
  password: 'cecilyc92',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create Moderator
moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@email.com',
  password: 'cecilyc92',
  role:     'moderator'
  )
moderator.skip_confirmation!
moderator.save!

# Create Member
member = User.new(
  name:     'Borus',
  email:    'borus@lilpoop.com', 
  password: 'cecilyc92'
  )
member.skip_confirmation!
member.save!


puts "Seed Finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
