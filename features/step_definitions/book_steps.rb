Given(/^I am on the index page$/) do
  visit(root_path)
end

Given(/^I click "(.*?)"$/) do |arg1|
  click_link(arg1)
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^page should have (.+) message "(.*?)"$/) do |type, text|
  page.has_css?("p.#{type}", :text => text, :visible => true)
end

Given(/^I have (\d+) posts and a new book$/) do |arg1|
  book = create(:book)
  post1 = create(:post1)
  post2 = create(:post2)
  post3 = create(:post3)
end

Given(/^I am on the book edit page$/) do
  visit 'books/1/edit'
end

Given(/^the book index is "(.*?)"$/) do |arg1|
  book = Book.find 1
  book.update_index(arg1)
end

Then(/^page should have title "(.*?)"$/) do |arg1|
  page.has_content?(arg1)
end
