require 'rails_helper'

describe 'navigate' do
  
  describe 'index' do
    before do 
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
    it 'has a tittle of Posts' do
      expect(page).to have_content(/Posts/)
    end
  end
  describe 'creation' do
    before do 
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "ALireza", last_name: "Mansoor" )
      login_as(user, :scope => :user)
      visit new_post_path
    end 

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end
    
    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rational]', with: "Star Wars"
      click_on "Save"
      expect(page).to have_content("Star Wars")
    end
    
    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rational]', with: "User Association"
      click_on "Save"
      
      expect(User.last.posts.last.rational).to eq("User Association")
    end
  end 
end