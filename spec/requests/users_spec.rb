require 'spec_helper'

describe "Users" do

	let(:base_title) {"Hacker Corral"}
  describe "Index page" do

  	it "should have the h1 'Hacker Corral'" do
  		visit '/users'
  		page.should have_selector('h1', :text => "#{base_title}")
  	end

    it "should have the title 'Home'" do
      visit '/users'
      page.should have_selector('title', :text => "#{base_title}")
    end

    it "should not have a custom page title" do
    	visit '/users'
    	page.should_not have_selector('title', :text => '| Home')
  	end
  end


end

describe "Site" do

	let(:base_title) {"Hacker Corral"}
	describe "About Me page" do

		it "should have the h1 'About Me'" do
			visit '/site/about'
			page.should have_selector('h1', :text => 'About Me')
		end

		it "should have the title 'About Me'" do
			visit '/site/about'
			page.should have_selector('title', :text => "#{base_title} | About Me")
		end
	end


end

describe "Site" do

	let(:base_title) {"Hacker Corral"}
	describe "Help Page" do

		it "should have the h1 'Help'" do
			visit '/site/help'
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the title 'Help'" do
			visit '/site/help'
			page.should have_selector('title', :text => "#{base_title} | Help")
		end
	end

end



