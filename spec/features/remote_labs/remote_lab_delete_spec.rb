include Warden::Test::Helpers
Warden.test_mode!

# Feature: Remote Lab delete
#   As a user
#   I want to delete my remote labs
feature 'Remote lab delete', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user deletes remote lab', :js => true do
    user = FactoryGirl.create(:user, :admin)
    remote_lab = FactoryGirl.create(:remote_lab)
    remote_lab.user = user
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'Destroy'
    expect(page.driver.browser.switch_to.alert.text).to eq 'Are you sure?'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Remote lab was successfully destroyed.')
    expect(page).not_to have_content('My Remote Lab Test')
    expect(page).not_to have_content('1.5')
    expect(page).not_to have_content('Khanh Nguyen')
    expect(page).not_to have_content('University of Sydney')
  end
end