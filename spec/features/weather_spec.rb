require "spec_helper"

feature "location", vcr: true do

  # As a user
  # I want to see the local temperature
  # So that I can dress accordingly.

  # Acceptance Criteria
  # [X] city's temperature is displayed
  # [X] User's city is displayed
  # [X] User's state is displayed

  scenario "user sees the current temperature for their location" do
    visit "/weather"
    expect(page).to have_content("Current Weather")
    expect(page).to have_content("F")
    expect(page).to have_content("Boston")
    expect(page).to have_content("MA")

  end
end
