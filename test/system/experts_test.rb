require "application_system_test_case"

class ExpertsTest < ApplicationSystemTestCase
  setup do
    @expert = experts(:one)
  end

  test "visiting the index" do
    visit experts_url
    assert_selector "h1", text: "Experts"
  end

  test "should create expert" do
    visit experts_url
    click_on "New expert"

    fill_in "Bio", with: @expert.bio
    fill_in "Cv", with: @expert.cv
    fill_in "First name", with: @expert.first_name
    fill_in "Github account", with: @expert.github_account
    fill_in "Idendity number", with: @expert.idendity_number
    fill_in "Idendity photo", with: @expert.idendity_photo
    fill_in "Last name", with: @expert.last_name
    fill_in "Twitter", with: @expert.twitter
    fill_in "Username", with: @expert.username
    fill_in "Website portfolio", with: @expert.website_portfolio
    click_on "Create Expert"

    assert_text "Expert was successfully created"
    click_on "Back"
  end

  test "should update Expert" do
    visit expert_url(@expert)
    click_on "Edit this expert", match: :first

    fill_in "Bio", with: @expert.bio
    fill_in "Cv", with: @expert.cv
    fill_in "First name", with: @expert.first_name
    fill_in "Github account", with: @expert.github_account
    fill_in "Idendity number", with: @expert.idendity_number
    fill_in "Idendity photo", with: @expert.idendity_photo
    fill_in "Last name", with: @expert.last_name
    fill_in "Twitter", with: @expert.twitter
    fill_in "Username", with: @expert.username
    fill_in "Website portfolio", with: @expert.website_portfolio
    click_on "Update Expert"

    assert_text "Expert was successfully updated"
    click_on "Back"
  end

  test "should destroy Expert" do
    visit expert_url(@expert)
    click_on "Destroy this expert", match: :first

    assert_text "Expert was successfully destroyed"
  end
end
