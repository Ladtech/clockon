require 'spec_helper'
require 'ladtech/clockon/model/freeagent'

describe FreeAgent::Entity do
  context 'extending' do
    describe 'find' do
      before :each do
        FreeAgent.url 'http://url.for.freeagent/v2'
      end

      let :entity_class do
        Class.new do
          extend FreeAgent::Entity

          entity 'user'
        end
      end

      it 'should send the access token with the request' do
        entity_class.should_receive(:get).with(anything, headers: {'Authorization' => "Bearer #{:access_token}"})

        entity_class.find(name: 'leon')
      end

      it 'should find users' do
        entity_class.should_receive(:get).with("#{FreeAgent.url}/user", anything)

        entity_class.find(name: 'leon')
      end
    end

    describe 'all' do
      pending
    end
  end
end