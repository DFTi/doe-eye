require 'spec_helper'

feature 'Vendor management' do
  let (:vendor_name) { 'test_vendor' }
  let (:vendor_api_key) { 'test_api_key' }
  let (:vendor_api_password) { 'test_api_password' }

  scenario 'User creates a new vendor' do
    visit new_vendor_path
    
    fill_in 'vendor_name', with: vendor_name
    fill_in 'vendor_api_key', with: vendor_api_key
    fill_in 'vendor_api_password', with: vendor_api_password
    
    click_button 'Submit'

    page.should have_content vendor_name
	end

	scenario 'User updates a vendor' do
    pending
	end
	
	scenario 'User deletes a vendor' do
    pending
	end
end
