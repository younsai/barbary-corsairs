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
Program.destroy_all
Report.destroy_all


4.times do
  User.create(email: Faker::Internet.email, password: '121212')
end
  e = User.create(email: "expert@gmail.com", password: '121212')
  c = User.create(email: 'company@gmail.com', password: '121212')

users = User.all

companies_users = [users[0], users[2]]
experts_users = [users[1], users[3]]


  Company.create(
    company_name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    logo: Faker::Company.logo,
    user: c
  )

  Expert.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    github_account: "https://github.com/younsai",
    twitter: "https://twitter.com/#{Faker::Twitter.screen_name}",
    cv: Faker::Internet.url,
    website_portfolio: Faker::Internet.url,
    bio: Faker::Lorem.paragraph,
    idendity_number: Faker::IDNumber.invalid,
    idendity_photo: Faker::Avatar.image(size: "50x50"),
    user: e
  )

companies_users.each do |company_user|
  Company.create(
    company_name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    logo: Faker::Company.logo,
    user: company_user
  )
end

experts_users.each do |expert_user|
  Expert.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    github_account: "https://github.com/younsai",
    twitter: "https://twitter.com/#{Faker::Twitter.screen_name}",
    cv: Faker::Internet.url,
    website_portfolio: Faker::Internet.url,
    bio: Faker::Lorem.paragraph,
    idendity_number: Faker::IDNumber.invalid,
    idendity_photo: Faker::Avatar.image(size: "50x50"),
    user: expert_user
  )
end


companies = Company.all
expert = Expert.all

companies.each do |company|
  10.times do
    Program.create!(
      title: [Faker::Company.name,  Faker::Company.industry].join(' - '),
      terms: Faker::Lorem.paragraph,
      company: company,
      bounty_range: "#{[100,200,300].sample} -  #{[1000,2000,3000].sample}")
  end
end


# companies.each do |company|
#   5.times do
#     ReportPerimeter.create(link: Faker::Internet.url(host: "#{company.company_name.downcase.gsub(" ", "-")}.com"))
#   end
# end
