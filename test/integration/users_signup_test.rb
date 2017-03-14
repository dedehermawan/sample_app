require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post users_path, params: {user: {name: "",email:"dede@email.com", password:"foo",password_confirmation:"bar"}}
		end
		assert_template 'users/new'
		assert_select 'div#error_explanation'
		assert_select 'div.field_with_errors'
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post users_path, params: {user: {name: "dede hermawan",email:"dede@email.com", password:"neglasari",password_confirmation:"neglasari"}}
		end
		follow_redirect!
		assert_template 'users/show'
	end
end
