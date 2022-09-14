require "application_system_test_case"

class ProgramScopesTest < ApplicationSystemTestCase
  setup do
    @program_scope = program_scopes(:one)
  end

  test "visiting the index" do
    visit program_scopes_url
    assert_selector "h1", text: "Program scopes"
  end

  test "should create program scope" do
    visit program_scopes_url
    click_on "New program scope"

    fill_in "Link", with: @program_scope.link
    fill_in "Program", with: @program_scope.program_id
    fill_in "Type", with: @program_scope.scope_type
    click_on "Create Program scope"

    assert_text "Program scope was successfully created"
    click_on "Back"
  end

  test "should update Program scope" do
    visit program_scope_url(@program_scope)
    click_on "Edit this program scope", match: :first

    fill_in "Link", with: @program_scope.link
    fill_in "Program", with: @program_scope.program_id
    fill_in "Type", with: @program_scope.scope_type
    click_on "Update Program scope"

    assert_text "Program scope was successfully updated"
    click_on "Back"
  end

  test "should destroy Program scope" do
    visit program_scope_url(@program_scope)
    click_on "Destroy this program scope", match: :first

    assert_text "Program scope was successfully destroyed"
  end
end
