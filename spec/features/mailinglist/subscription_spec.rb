require 'spec_helper'

# Mailinglist is provided by createsend.com through
# newsletter.kabisa.nl. We only include the form and
# provide a "subscribed" page.
describe 'Mailinglist subscription' do

  it "shows the subscription form" do
    visit '/'

    within('.subscribe') do
      expect(page).to have_css('form[action="http://newsletter.kabisa.nl/t/r/s/jjuisk/"]')
      expect(page).to have_css('input#jjuisk-jjuisk');
    end
  end

  it "can show a 'subscribed' page" do
    visit '/subscribed'

    expect(page).to have_content('You’ve subscribed')
  end

end
