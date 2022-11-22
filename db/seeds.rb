puts "seeding"

puts "Creating users..."

User.create!(first_name: "Admin", last_name: "User", email: "exe@exe.com", phone: "1234567890", password: "123", birth_date: "1990-01-01", address: "123 Main St")
puts "done seeding..."
