# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def user_set_up
    email = Faker::Internet.email
    password = password_confirmation = Faker::Internet.password

    {email: email, password: password, password_confirmation: password_confirmation}
end

def entries_set_up
    id = Random.rand(5)
    content = Faker::TvShows::HowIMetYourMother.quote

    {user_id: id, content: content}
end

5.times do
    User.create(user_set_up)
    Entry.create(entries_set_up)
end
