module FreeAgent
  def freeagent entity
    JSON.parse(HTTParty.get("https://api.sandbox.freeagent.com/v2/#{entity}", headers: {'Authorization' => "Bearer 1P2wjf44HunJDKWKXdrLmGUT-C5-EXwz3o2QnYh7d", 'User-Agent' => 'faraday'}).body)[entity]
  end

  def user name
    user = freeagent('users').find{|user_hash| user_hash['first_name'].downcase == name.downcase}
    raise "User #{name} not found" unless user
    user
  end
end

World(FreeAgent)

Given(/^I go to '(.*)'$/) do |uri|
  HTTParty.get("http://localhost:4567#{uri}")
end

Then(/^(.*) should be registered for (.*) in FreeAgent$/) do |name, date|
  timeslip = freeagent('timeslips').find{|timeslip| timeslip['user'] == user(name)['url'] && timeslip['dated_on'] == date}

  fail "timeslip #{date} not found" unless timeslip
end