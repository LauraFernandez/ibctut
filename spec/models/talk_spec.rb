#require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Talk do
  it{should validate_presence_of(:title,:description)}
  it{should belong_to(:event,:room)}
  it{should have_many(:speakers)}
  it{should_not have_many(:rooms)}
#  before(:each) do
#    @valid_attributes = {
#      :title => "value for name",
#      :description => "value for description",
#      :url => "value for address"}
#  end
#
#  it "should create a new instance given valid attributes" do
#    Talk.create!(@valid_attributes)
#  end
end
