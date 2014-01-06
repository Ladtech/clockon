require 'spec_helper'
require 'ladtech/clockon/model/freeagent'
require 'ladtech/clockon/app/helpers'


describe Helpers::User do
  before :each do
    @object = Object.new
    @object.extend(Helpers::User)
  end

  it 'should fail' do
    @object.user('leon').should == FreeAgent::User.new
  end
end