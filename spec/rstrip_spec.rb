require 'spec_helper'
require 'rstrip/rstrip'

describe Rstrip::Rstrip do

  it "should remove right whitespace" do
    Rstrip::Rstrip.process("Lorem ipsum \n").should == "Lorem ipsum\n"
  end

  it "should remove right tab" do
    Rstrip::Rstrip.process("Lorem ipsum\t\n").should == "Lorem ipsum\n"
  end

  it "should remove right form" do
    Rstrip::Rstrip.process("Lorem ipsum\f\n").should == "Lorem ipsum\n"
  end

  it "should remove right carriage return" do
    Rstrip::Rstrip.process("Lorem ipsum\r\n").should == "Lorem ipsum\n"
  end

  it "should remove multiple whitespace" do
    Rstrip::Rstrip.process("Lorem ipsum \f\t \n").should == "Lorem ipsum\n"
  end

  it "should not remove right newline\n" do
    Rstrip::Rstrip.process("Lorem ipsum\n").should == "Lorem ipsum\n"
    Rstrip::Rstrip.process("Lorem ipsum\n\n").should == "Lorem ipsum\n"
    Rstrip::Rstrip.process("Lorem ipsum\r\n").should == "Lorem ipsum\n"
  end

end