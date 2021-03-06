require 'rails_helper'

RSpec.describe Post, type: :model do 
  describe "Creation" do 
    before do 
      @post = FactoryGirl.create(:post)
    end 
    it "can be created" do 
     
      expect(@post).to be_valid
    end
    it "can not be created without date or rational" do
      @post.date = nil
      @post.rational = nil
      expect(@post).to_not be_valid
    end
  end
end