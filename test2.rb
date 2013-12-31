require 'httparty'
puts HTTParty.get('https://api.sandbox.freeagent.com/v2/company', headers: {'Authorization' => "Bearer 1P2wjf44HunJDKWKXdrLmGUT-C5-EXwz3o2QnYh7d", 'User-Agent' => 'faraday'})