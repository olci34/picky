u1 = User.create(username: "user1", email: "user1@e.com", password: "123123")
u2 = User.create(username: "user2", email: "user2@e.com", password: "123123")
u3 = User.create(username: "user3", email: "user3@e.com", password: "123123")

l1 = Location.create(address: "342 Lewis Ave", neighborhood:"Bed-Stuy", zip_code: 11233)
l2 = Location.create(address: "364 7th Ave", neighborhood:"Park Slope", zip_code: 11215)
l3 = Location.create(address: "366 Clinton Ave", neighborhood:"Clinton Hill", zip_code: 11238)

p1 = Product.create(name: "Plant Pot")
p1.user_id = u1.id
p1.location_id = l1.id
p1.save

p2 = Product.create(name: "LV Shoes")
p2.user_id = u2.id
p2.location_id = l2.id
p2.save

p2 = Product.create(name: "mug")
p2.user_id = u2.id
p2.location_id = l2.id
p2.save