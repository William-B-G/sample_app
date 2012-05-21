require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/static_pages/home'
      response.status.should be(200)
      visit '/static_pages/home'
      page.should have_content("Sample App")
    end
    
    it "should have the base title" do
      visit '/static_pages/home'    	
      page.should have_selector('title', 
      	:text => "Ruby on Rails Tutorial Sample App")     	
	end    
	
    it "should not have a custom page title " do
      visit '/static_pages/home'    	
      page.should_not have_selector('title', 
      	:text => "| Home")     	
	end  	
    
  end
  
  describe "Contact page" do
    it "should have h1 'Contact Me'" do
      get '/static_pages/contact'
      response.status.should be(200)
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Me')
    end
    
    it "should have the right title" do
      visit '/static_pages/contact'    	
      page.should have_selector('title', 
      	:text => "Ruby on Rails Tutorial Sample App | Contact")     	
	end    
    
  end  
  
  describe "Help page" do
    it "should have the content 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/static_pages/help'
      response.status.should be(200)
      visit '/static_pages/help'
      page.should have_content("Help")
      page.should have_selector('h1', :text => 'Help')           
    end
    
    it "should have the right title" do
      visit '/static_pages/help'    	
      page.should have_selector('title', 
      	:text => "Ruby on Rails Tutorial Sample App | Help")     	
	end
	
  end  
  
  describe "About page" do
    it "should have the content 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/static_pages/about'
      response.status.should be(200)
      visit '/static_pages/about'
      page.should have_content("About Us")
    end
  end  
    
end
