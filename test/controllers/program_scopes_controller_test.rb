require "test_helper"

class ProgramScopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_scope = program_scopes(:one)
  end

  test "should get index" do
    get program_scopes_url
    assert_response :success
  end

  test "should get new" do
    get new_program_scope_url
    assert_response :success
  end

  test "should create program_scope" do
    assert_difference("ProgramScope.count") do
      post program_scopes_url, params: { program_scope: { link: @program_scope.link, program_id: @program_scope.program_id, scope_type: @program_scope.scope_type } }
    end

    assert_redirected_to program_scope_url(ProgramScope.last)
  end

  test "should show program_scope" do
    get program_scope_url(@program_scope)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_scope_url(@program_scope)
    assert_response :success
  end

  test "should update program_scope" do
    patch program_scope_url(@program_scope), params: { program_scope: { link: @program_scope.link, program_id: @program_scope.program_id, scope_type: @program_scope.scope_type } }
    assert_redirected_to program_scope_url(@program_scope)
  end

  test "should destroy program_scope" do
    assert_difference("ProgramScope.count", -1) do
      delete program_scope_url(@program_scope)
    end

    assert_redirected_to program_scopes_url
  end
end
