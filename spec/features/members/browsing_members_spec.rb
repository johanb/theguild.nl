require 'spec_helper'

describe 'Browsing the list of members' do

  def have_users(n)
    have_css('table.users tr.user', count: n)
  end

  def have_flash_alert(msg)
    have_css('.alert-box.alert', text: msg)
  end

  context 'when not logged in' do
    it 'requires logging in as an admin user' do
      visit '/users'
      expect(current_path).to eql('/users/sign_in')
    end
  end

  context 'when logged in' do
    context 'as a regular user' do
      it 'raises an error' do
        create_and_sign_in_as :user
        visit '/users'
        expect(page).to have_flash_alert('You are not authorized')
      end
    end

    context 'as an administrator' do
      before(:all) { @current_user = create :user, :admin }
      after(:all)  { @current_user.destroy }
      before       { sign_in_as @current_user }

      context 'when there are no pending invitiations' do
        it 'hides the number of pending invitations'
      end

      context 'when there is a pending invitation' do
        it 'shows the number of pending invitations'
      end

      context 'when there are some users' do
        let!(:users) { create_list :user, 2 }

        it 'shows the number of users' do
          visit '/users'
          expect(page).to have_css('.user_count', text: '3 users')
        end

        it 'lists each user' do
          visit '/users'
          expect(page).to have_users(3)
        end
      end

      context 'when there are lots of users' do
        before(:all) { @users = create_list :user, 25 }
        after(:all)  { @users.each(&:destroy) }

        it 'shows the user count for all users' do
          visit '/users'
          expect(page).to have_css('.user_count', text: '26 users')
        end

        it 'lists only the first 25 users' do
          visit '/users'
          expect(page).to have_users(25)
        end

        it 'links to the next page of users' do
          visit '/users'
          within '.pagination' do
            click_link '2'
          end
          expect(page).to have_users(1)
        end
      end
    end
  end
end
