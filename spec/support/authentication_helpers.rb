module AuthenticationHelpers
  def create_and_sign_in_as(*args)
    FactoryGirl.create(*args).tap do |user|
      sign_in_as user
    end
  end

  def sign_in_as(user)
    sign_in_with user.email, user.password
  end

  def sign_in_with(email, password)
    visit '/users/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end
end
