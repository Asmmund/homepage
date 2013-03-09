require 'spec_helper'
feature 'website functionality' do
  before do
    User.create! name: 'admin', password_digest:
    '$2a$10$vJ7Jbu3ax3dTBxUK9rJkJ./j7S7oL81879hwj03c4fosI18tLRnOq'
    @login = 'admin'
    @pass = 'admin'
  end
  scenario  "incorect user can't log in " do
    login 'elmor', 'elmor'
    expect(page).to have_content 'Invalid user/password combination'
  end
  scenario 'correct user can log in' do
    login @login, @pass
    expect(page).to have_content('Welcome, admin')
  end
  scenario 'create new user' do
    login @login, @pass
    click_link 'users'
    click_link 'new_user'
    fill_in 'Name', with: '42342342'
    fill_in 'Password', with: '42342342'
    fill_in 'Confirm', with: '42342342'
    click_button 'submit'

    expect(page).to have_content('New News')
   end
  def login(username, password)
    visit login_path
    fill_in 'Name', with: username
    fill_in 'Password', with: password
    click_button 'Login'
  end

end