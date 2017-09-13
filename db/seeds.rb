require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all


100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

25.times do
  Advertisement.create!(
  title: "This ad is a sample ad",
  body: "Here is the body text.",
  price: 9001
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
