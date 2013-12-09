require 'spec_helper'

describe "Users" do
  describe "Index page" do

  	it "should have the h1 'Hacker Corral'" do
  		visit '/users'
  		page.should have_selector('h1', :text => 'Hacker Corral')
  	end

    it "should have the title 'Home'" do
      visit '/users'
      page.should have_selector('title', :text => "Hacker Corral | Home")
    end
  end


end

describe "Site" do
	describe "About Me page" do

		it "should have the h1 'About Me'" do
			visit '/site/about'
			page.should have_selector('h1', :text => 'About Me')
		end

		it "should have the title 'About Me'" do
			visit '/site/about'
			page.should have_selector('title', :text => "Hacker Corral | About Me")
		end
	end


end

describe "Site" do
	describe "Help Page" do

		it "should have the h1 'Help'" do
			visit '/site/help'
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the title 'Help'" do
			visit '/site/help'
			page.should have_selector('title', :text => "Hacker Corral | Help")
		end
	end

end



