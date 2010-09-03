require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Dog do
  describe "call by name" do
    before { @dog = Factory(:dog, :name => 'lassie') }

    it "should bark if it's its name" do
      @dog.call_by_name("lassie").should == "guau"
    end

    it "should ignore other dogs names" do
      @dog.call_by_name("pluto").should be_nil
    end



  end

  describe "crud operations  in database" do
    before { @dog = Factory(:dog, :name => 'lassie') }
    it "should create a dog" do
      Dog.find(:all).count.should == 1
      d2=Factory.create(:dog)
      Dog.find(:all).count.should == 2
      d2.name.should == "string_1"
      d2.age.should equal @dog.age
      Factory.build(:dog)
      Dog.find(:all).count.should==2
    end
  end
end

describe Dog do
  describe "validation" do
   # before { @dog = Factory(:invalid_dog) }

    before{ @dog=Factory.build(:dog, :name => nil,:age=>nil)}
     it { should validate_presence_of(:name,:age) }
    it "should be invalid" do
     
      @dog.should_not be_valid
      @dog.should be_invalid

      @dog.should have(1).error_on(:name)
      @dog.should have(1).error_on(:age)
      @dog.should have(2).errors
      @dog.errors.on(:name).should_not be_nil
      @dog.errors.on(:name).should == "can't be blank"
      @dog.name = "pluto"
      @dog.age=4
      @dog.should be_valid

    end
  end
end