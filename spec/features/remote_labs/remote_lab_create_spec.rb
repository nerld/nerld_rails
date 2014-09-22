include Warden::Test::Helpers
Warden.test_mode!

# Feature: Remote Lab create
#   As a user
#   I want to create to remote labs
feature 'Remote lab create', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User creates new remote lab
  #   Given I am signed in
  #   When I visit the remote lab index page
  #   And I click 'New Remote Lab'
  #   And I fill in 'Title' with 'My Remote Lab'
  #   And I fill in 'Version ' with 1
  #   And I fill in 'Author' with 'Son Goku'
  #   And I fill in 'School' with 'Master Yoshi's Beach Paradise
  scenario 'user creates new remote lab' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'New Remote Lab'
    fill_in 'Title', :with => 'My Remote Lab'
    fill_in 'Version', :with => 1337
    fill_in 'Author', :with => 'Son Goku'
    fill_in 'School', :with => "Master Yoshi's Beach Paradise"
    page.find('input.button').click
    expect(page).to have_content('Remote lab was successfully created.')
    expect(page).to have_content('My Remote Lab')
    expect(page).to have_content('1337')
    expect(page).to have_content('Son Goku')
    expect(page).to have_content("Master Yoshi's Beach Paradise")
  end

  # Validation Test: no title
  scenario 'user creates new remote lab: no title' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'New Remote Lab'
    fill_in 'Version', :with => 1
    fill_in 'Author', :with => 'Son Goku'
    fill_in 'School', :with => "Master Yoshi's Beach Paradise"
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

  # Validation Test: no version
  scenario 'user creates new remote lab: no version' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'New Remote Lab'
    fill_in 'Title', :with => 'My Remote Lab'
    fill_in 'Author', :with => 'Son Goku'
    fill_in 'School', :with => "Master Yoshi's Beach Paradise"
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

  # Validation Test: no author
  scenario 'user creates new remote lab: no author' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'New Remote Lab'
    fill_in 'Title', :with => 'My Remote Lab'
    fill_in 'Version', :with => 1
    fill_in 'School', :with => "Master Yoshi's Beach Paradise"
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

  # Validation Test: no school
  scenario 'user creates new remote lab: no school' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit remote_labs_path
    click_link 'New Remote Lab'
    fill_in 'Title', :with => 'My Remote Lab'
    fill_in 'Version', :with => 1
    fill_in 'Author', :with => 'Son Goku'
    page.find('input.button').click
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content("can't be blank")
  end

end