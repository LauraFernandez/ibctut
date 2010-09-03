require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe Room do
  it {should validate_presence_of(:name,:description,:capacity)}
  it { should have_many(:talks)}
  it {should_not belong_to(:talk)}
#  describe "get_capacity" do
#    before{
#      @room = Factory(:room,:name=>"Azul",:description=>"Sala de congresos",:capacity=>"300")
#    }
#
#
#  #  it "should create a new instance given valid attributes" do
#  #    Room.create!(@valid_attributes)
#  #  end
#  it "should have capacity" do
#    @room.get_capacity.should == 300
#  end
#end
end


