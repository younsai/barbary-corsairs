# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Company.destroy_all
Expert.destroy_all


u1 = User.create(email: 'tst@tst.ma', password: '121212')
u2 = User.create(email: 'tst2@tst.ma', password: '121212')
u3 = User.create(email: 'tst@3tst.ma', password: '121212')

Company.create(
  company_name: "string",
  address: "string",
  phone_number: "12121212",
  logo: "string",
  user_id: u1.id
)

Company.create(
  company_name: "string",
  address: "string",
  phone_number: "12121212",
  logo: "string",
  user_id: u2.id
)

Expert.create(
  first_name: "string",
  last_name: "string",
  username: "string",
  github_account: "string",
  twitter: "string",
  cv: "string",
  website_portfolio: "string",
  bio: "text",
  idendity_number: "string",
  idendity_photo: "string",
  user_id: u3.id
)

5.times do
  Program.create(
    title: "Test",
    terms: Faker::String.random,
    accepted_vulnerabilities: 'Test',
    excluded_vulnerabilities: 'Test',
    vulnerability_levels: 'Test',
    bouty_range: 'Test',
    company: Company.all.sample
  )
end
