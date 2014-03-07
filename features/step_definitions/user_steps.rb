When /I have signed in/ do
  visit root_path
  click_link 'sign up'
  fill_in 'Email', :with => 'cry_b@126.com'
  fill_in 'Password', :with => 'qjr01032'
  fill_in 'Password confirmation', :with => 'qjr01032'
  click_button 'Sign up'
  visit root_path
end

When /I sign out/ do
  visit root_path
  click_link 'sign out'
end

When /I sign up/ do
  visit root_path
  click_link 'sign up'
  fill_in 'Email', :with => 'cry_b@126.com'
  fill_in 'Password', :with => 'qjr01032'
  fill_in 'Password confirmation', :with => 'qjr01032'
  click_button 'Sign up'

end

When /I sign in/ do
  visit root_path
  click_link 'sign in'
  fill_in 'Email', :with => 'cry_b@126.com'
  fill_in 'Password', :with => 'qjr01032'
  click_button 'Sign in'
end
