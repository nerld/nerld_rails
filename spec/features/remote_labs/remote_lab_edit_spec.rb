include Warden::Test::Helpers
Warden.test_mode!

# Feature: Remote Lab edit
#   As a user
#   I want to edit remote labs
feature 'Remote lab edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User creates new remote lab
  #   Given I am signed in
  #   And I have a remote lab created
  #   When I visit the remote lab index page
  #   And I click 'New Remote Lab'
  #   And I fill in 'Title' with 'My Remote Lab'
  #   And I fill in 'Version ' with 1
  #   And I fill in 'Author' with 'Son Goku'
  #   And I fill in 'School' with 'Master Yoshi's Beach Paradise
  scenario 'user edits remote lab' do
    user = FactoryGirl.create(:user, :admin)
    remote_lab = FactoryGirl.create(:remote_lab)
    remote_lab.user = user
    login_as(user, scope: :user)
    visit remote_labs_path
    expect(page).to have_content('My Remote Lab Test')
    expect(page).to have_content('1.5')
    expect(page).to have_content('Khanh Nguyen')
    expect(page).to have_content('University of Sydney')
    click_link 'Edit'
    fill_in 'Title', :with => 'My Remote Lab Is Awesome'
    fill_in 'Version', :with => 1337
    fill_in 'Author', :with => 'Son Goku'
    fill_in 'School', :with => "Master Yoshi's Beach Paradise"
    page.find('input.button').click
    expect(page).to have_content('Remote lab was successfully updated.')
    expect(page).to have_content('My Remote Lab')
    expect(page).to have_content('1337')
    expect(page).to have_content('Son Goku')
    expect(page).to have_content("Master Yoshi's Beach Paradise")

  end

  # Validation Test: no title
  scenario 'user edits remote lab: no title' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    remote_lab = FactoryGirl.create(:remote_lab)
    remote_lab.user = user
    visit remote_labs_path
    click_link 'Edit'
    fill_in 'Title', :with => ''
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

  # Validation Test: no version
  scenario 'user edits remote lab: no version' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    remote_lab = FactoryGirl.create(:remote_lab)
    remote_lab.user = user
    visit remote_labs_path
    click_link 'Edit'
    fill_in 'Version', :with => ''
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

  # Validation Test: no author
  scenario 'user edits remote lab: no author' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    remote_lab = FactoryGirl.create(:remote_lab)
    remote_lab.user = user
    visit remote_labs_path
    click_link 'Edit'
    fill_in 'Author', :with => ''
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

  # Validation Test: no school
  scenario 'user edits remote lab: no school' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'New Remote Lab'
    remote_lab = FactoryGirl.create(:remote_lab)
    remote_lab.user = user
    visit remote_labs_path
    click_link 'Edit'
    fill_in 'School', :with => ''
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

end