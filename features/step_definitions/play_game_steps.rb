Given(/^I am on the home page$/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^I am registered as "([^"]*)"$/) do |name|
  visit '/'
  fill_in 'name', with: name
  click_on 'Submit'
end

Given(/^the computer will choose "([^"]*)"$/) do |choice|
  allow_any_instance_of(Computer).to receive(:weapon).and_return Weapon[choice]
end

Given(/^I choose "(Rock|Paper|Scissors)"$/) do |choice|
  click_on choice
end

Then(/^I should win the game$/) do
  expect(page).to have_content 'You win!'
end

Then(/^I should tie the game$/) do
  expect(page).to have_content "It's a tie!"
end

Then(/^I should lose the game$/) do
  expect(page).to have_content 'You lose!'
end

Given(/^I enter "([^"]*)" in "([^"]*)"$/) do |value, field|
  fill_in field, with: value
end

When(/^click "([^"]*)"$/) do |target|
  click_on target
end
