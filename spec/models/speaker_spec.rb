#require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Speaker do
  it {should validate_presence_of(:name,:description)}
  it {should have_many(:talks)}
  it {should_not belong_to(:talk)}
#  before(:each) do
#    @valid_attributes = {
#      :name => "value for name",
#      :description => "value for description"
#    }
#  end
#
#  it "should create a new instance given valid attributes" do
#    Speaker.create!(@valid_attributes)
#  end
end
