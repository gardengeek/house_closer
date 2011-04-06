Given /^the following leads:$/ do |leads|
  Lead.create!(leads.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) lead$/ do |pos|
  visit leads_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following leads:$/ do |expected_leads_table|
  expected_leads_table.diff!(tableish('table tr', 'td,th'))
end
