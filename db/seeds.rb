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
  company_name: "OCP",
  address: "2-4, Rue Al Abtal, Hay Erraha 20200, Casablanca, Maroc - BP Maârif 5196",
  phone_number: "+212522230025 ",
  logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/OCP_Group.svg/803px-OCP_Group.svg.png",
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
  logo: "data:image/png;base64,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",
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
