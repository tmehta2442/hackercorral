require 'spec_helper'

describe "Users" do
  
  describe "Index page" do
    it "should have the content 'Hacker Corral'" do
      visit '/users'
      page.should have_content('Hacker Corral')
    end
  end


end

describe "About Me" do

  describe "About page" do
  	it "should have the content 'About Me'" do
  		visit '/site'
  		page.should have_content('About Me')
  	end
  end

end
