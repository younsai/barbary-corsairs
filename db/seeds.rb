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
e = User.create(email: "rachid@gmail.com", password: '121212')
c = User.create(email: 'contact@ev212.ma', password: '121212')

users = User.all

companies_users = [users[0], users[2]]
experts_users = [users[1], users[3]]

Company.create(
  company_name: "EV 212",
  address: "380 Bd Brahim Roudani, Casablanca",
  phone_number: "+212522230025 ",
  logo: "https://res.cloudinary.com/younsai/image/upload/v1663319156/development/ev212_n6o5fx.png",
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

Company.create(
  company_name: "Le Wagon",
  address: "380 Bd Brahim Roudani, Casablanca",
  phone_number: " +212662293983",
  logo: "https://d92mrp7hetgfk.cloudfront.net/images/sites/misc/lewagon/original.png?1568416131",
  user: companies_users[0]
)

Company.create(
  company_name: "inwi",
  address: "Siège inwi, Lot La Colline 2, Sidi Maarouf, Casablanca",
  phone_number: "+212529000000",
  logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Logo_inwi.svg/2560px-Logo_inwi.svg.png",
  user: companies_users[1]
)

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
# expert = Expert.all

companies.each do |company|
  10.times do
    Program.create!(
      title: "#{company.company_name} #{Faker::Company.industry}",
      terms: "By participating in the program, you agree that you are bound by and subject to this policy. By submitting
      a vulnerability or other report to us, you grant to us, our subsidiaries and its affiliates, a perpetual,
      irrevocable, royalty free license to all intellectual property rights licensable by you in or related to the use
      of this material. You agree that no third party rights are involved in your report and you have all rights to
      submit such a report. We may modify the terms of this policy or terminate the policy at any time.
      If you do not comply with this policy or if we determine that your participation in the program is not in good
      faith or could adversely impact us, our affiliates, or our business partners (or any of our or their users,
      employees, or contractors), we, in our sole discretion, may remove you from the program and disqualify you from
      receiving any reward under the program.",
      accepted_vulnerabilities: "Remote Code Execution, Command injection, shell upload, unsafe deserialization, exploitable memory corruption
      SQL Injection, XML External Entity Injection (XXE), Command injection
      Leaked Credential, Cryptographic flaw
      Cross-Site Scripting (XSS)
      Server-Side Request Forgery
      Directory Traversal
      Authentication/Authorization Bypass (Broken Access Control)
      File Inclusion
      Insecure Direct Object Reference
      Misconfiguration/ Open Redirect
      CRLF Injection
      Cross Site Request Forgery
      Information Disclosure
      Subdomain takeover
      HTML injections (w/o XSS), XSS on harmless subdomains, attacks requiring unlikely user interaction",
      excluded_vulnerabilities: "Clickjacking on pages with no sensitive actions
      Cross-Site Request Forgery (CSRF) on unauthenticated forms or forms with no sensitive actions
      Attacks requiring MITM or physical access to a user's device
      Previously known vulnerable libraries without a working Proof of Concept
      Comma Separated Values (CSV) injection without demonstrating a vulnerability
      Missing best practices in SSL/TLS configuration
      Any activity that could lead to the disruption of our service (DoS) or a violation of the privacy of any user, employee or contractor of TikTok or any of its affiliates or business partners
      Content spoofing and text injection issues without showing an attack vector/without being able to modify HTML/CSS
      Rate limiting or bruteforce issues on non-authentication endpoints
      Missing best practices in Content Security Policy
      Missing Referrer Policy
      Missing Subresource Integrity directives
      Missing anti-clickjacking mechanisms
      Missing HttpOnly, Secure, SameSite cookie attributes
      Missing email best practices (Invalid, incomplete or missing SPF/DKIM/DMARC records, etc.)
      Vulnerabilities only affecting users of outdated or unpatched browsers (more than 2 stable versions behind the latest released stable version)
      Software version disclosure / Banner identification issues / Descriptive error messages or headers (e.g. stack traces, application or server errors).
      Public Zero-day vulnerabilities that have had an official disclosure less than 1 month before are on a case by case basis.
      Tabnabbing
      Open redirect - unless an additional security impact can be demonstrated
      Issues that require unlikely user interaction
      Vulnerabilities that are already known (e.g. discovered and reported by other researchers or by an internal team)
      CSRF issues on seller-id.tiktok.com domain will be temporarily out of scope (Starting Nov 23, 2021) as the team is working on the fix.
      Self-XSS, which includes any payload entered by the victim",
      company: company,
      bounty_range: "#{[100, 200, 300].sample} - #{[1000, 2000, 3000].sample}")
  end
end

# companies.each do |company|
#   5.times do
#     ReportPerimeter.create(link: Faker::Internet.url(host: "#{company.company_name.downcase.gsub(" ", "-")}.com"))
#   end
# end

Program.all.each do |program|
  Scope.create(
    link: "www.#{program.company.company_name.downcase.gsub(" ", "-")}.ma",
    scope_type: "Website",
    program: program)

  Scope.create(
    link: "www.#{program.company.company_name.downcase.gsub(" ", "-")}.ma/contact",
    scope_type: "Mail App",
    program: program)

    Scope.create(
      link: "app.#{program.company.company_name.downcase.gsub(" ", "-")}.ma",
      scope_type: "Web App",
      program: program)
end
