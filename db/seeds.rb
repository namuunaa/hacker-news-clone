require 'faker'

User.destroy_all
Comment.destroy_all
Post.destroy_all

10.times do
  User.create(username: Faker::Internet.unique.user_name, email: Faker::Internet.unique.email, password: Faker::Internet.password)
end

users = User.all

users.each do |user|
  user.posts << Post.create(title: Faker::Hacker.say_something_smart, body: Faker::Hacker.say_something_smart)
end

10.times do
  Comment.create(text: Faker::Hacker.say_something_smart, user_id: User.all.sample.id, post_id: Post.all.sample.id)
end

