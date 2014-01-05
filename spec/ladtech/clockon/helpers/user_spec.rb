require 'spec_helper'

describe Helpers::User do
  before :each do
    @object = Object.new
    @object.extend(Helpers::User)
  end

  it 'should fail' do
    @object.user('leon').should == User.new
  end
end