module Features
  module AuthHelpers
    def sign_in
      password = "password"
      user = create(:user, password: password)
      sign_in_with user.email, password
    end

    def sign_in_with(email, password)
      visit signin_path
      fill_in "session_email", with: email
      fill_in "session_password", with: password
      click_button "Signin"
    end

    def sign_out
      click_button "Signout"
    end

    def expect_user_to_be_signed_in
      expect(page).to have_link "Signout"
    end

    def expect_user_to_be_signed_out
      expect(page).to have_button "Signin"
    end
  end
end

RSpec.configure do |config|
  config.include Features::AuthHelpers, type: :feature
end
