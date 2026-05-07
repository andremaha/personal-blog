Site.current
puts "Site info ready."

user = User.find_or_initialize_by(email: "admin@example.com")
user.update!(
  name: "Andrey Esaulov",
  password: "password",
  password_confirmation: "password"
)
puts "Admin user created: #{user.email}"

if Post.count == 0
  Post.create!(
    title: "Hello World",
    body: "Welcome to my blog. This is the first post.\n\nI'll be writing about software engineering, technology, and ideas that interest me. Stay tuned for more.",
    excerpt: "Welcome to my blog. The beginning of something new.",
    published_at: Time.current
  )
  puts "Sample post created."
end
