user1 = User.create(first_name: "Tom", last_name: "Jones", username: "TJ12", password: "123", password_confirmation: "123")
user2 = User.create(first_name: "Cindy", last_name: "Smith", username: "CS123", password: "321", password_confirmation: "321")

Song.create(title: "Baby Don't Cry", artist: "Tupac", user_id: user1.id)
Song.create(title: "Thriller", artist: "Michael Jackson", user_id: user1.id)
Song.create(title: "Billy Jean", artist: "Michael Jackson", user_id: user1.id)
Song.create(title: "Whip It", artist: "Dazz Band", user_id: user2.id)
Song.create(title: "Fancy", artist: "Iggy Azalea", user_id: user2.id)
Song.create(title: "Problem", artist: "Ariana Grande", user_id: user2.id)

puts "Created #{Song.count} songs"