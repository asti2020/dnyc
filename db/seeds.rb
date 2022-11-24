puts "seeding"

puts "Creating users..."

user1 = User.create!(first_name: "Admin", last_name: "User", email: "exe@exe.com", phone: "1234567890", password: "123", birth_date: "1990-01-01", address: "123 Main St")

Rental.create!(title: "Test Rental", price: 2000, address: "123 Main St", area_sqft: 1000, category: "Apartment", starting_date: " 2022-12-12", image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60", requirements: "Good Credit", user_id: user1.id, note: "Test Note", status: true, parking: "Yes", near_subway: "Yes", features: "Test Features", location: "Test Location", phone: "1234567890", email: "", utility: "Test Utility", description: "Test Description")
puts "done seeding..."
