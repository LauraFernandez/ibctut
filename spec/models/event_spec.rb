#require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
  #Remarkable para tests de validación
  it { should validate_presence_of(:name,:description,:address) }
  #Remarkable para tests de asociaciones
  it { should have_many(:talks) }
  it {should_not belong_to(:talk)}

#  before(:each) do
#    @valid_attributes = {
#      :name => "value for name",
#      :description => "value for description",
#      :address => "value for address"
#    }
#  end
#
#  it "should create a new instance given valid attributes" do
#    Event.create!(@valid_attributes)
#  end
end
