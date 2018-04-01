require "random_data"

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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.find_or_create_by!(
	title: "My favorite foods",
	body: "Sushi, Frog legs, Tacos, Pasta"
)

puts "#{Post.count} total posts"

Post.find_or_create_by!(title: "My favorite foods") do |comment|
	Comment.body = "That sounds delicious right now!!"
end

puts "#{Comment.count} total comments"