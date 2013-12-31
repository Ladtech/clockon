Given(/^I go to '(.*)'$/) do |uri|
  HTTParty.get("http://localhost:9292#{uri}")
end

Then(/^(.*) should be registered for (.*) in FreeAgent$/) do |name, date|
  timeslip = FreeAgent.entity('timeslips').find{|timeslip| timeslip['user'] == user(name)['url'] && timeslip['dated_on'] == date}
  fail "timeslip #{date} not found" unless timeslip
end