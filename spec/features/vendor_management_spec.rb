require 'spec_helper'

feature 'Vendor management' do
	scenario 'User creates a new vendor' do
    visit new_vendor_path
    
    fill_in 'vendor_name', with: 'test'
    fill_in 'vendor_api_key', with: 'test_api_key'
    fill_in 'vendor_api_password', with: 'test_api_password'
    
    click_button 'Submit'

    page.should have_content 'test'
	end

	scenario 'User updates a vendor' do
    pending
	end
	
	scenario 'User deletes a vendor' do
    pending
	end
end
