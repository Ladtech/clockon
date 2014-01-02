Given(/^I go to '(.*)'$/) do |uri|
  response = HTTParty.get("http://localhost:#{app_port}#{uri}")
  fail "request failed" unless response.code == 200
end

Then(/^(.*) should be registered for (.*) in FreeAgent$/) do |name, date|
  timeslip = FreeAgent.entity('timeslips').find{|timeslip| timeslip['user'] == user(name)['url'] && timeslip['dated_on'] == date}
  fail "timeslip #{date} not found" unless timeslip
end