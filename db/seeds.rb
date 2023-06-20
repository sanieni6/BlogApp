# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1', bio: 'Teacher from Poland.')
fourth_user = User.create(name: 'Jaime', photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1', bio: 'Teacher from Mexico.')
third_user = User.create(name: 'Jonh', photo: 'https://cdna.artstation.com/p/assets/images/images/050/089/394/large/steven-lo-ji-1.jpg?1654031250&dl=1', bio: 'Teacher from Mexico.')

first_post = Post.create(author_id: second_user.id, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author_id: second_user.id, title: 'Hello', text: 'This is my second post')
third_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my fourth post')

Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Luis!' )
Comment.create(post_id: second_post.id, author_id: first_user.id, text: 'Hi Ana!' )
Comment.create(post_id: second_post.id, author_id: first_user.id, text: 'Hi Gio!' )

Like.create(post_id: first_post.id, author_id: first_user.id)
Like.create(post_id: first_post.id, author_id: first_user.id)
Like.create(post_id: second_post.id, author_id: second_user.id)
Like.create(post_id: second_post.id, author_id: second_user.id)