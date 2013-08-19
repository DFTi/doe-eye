require 'spec_helper'

feature 'Vendor management' do
  before :each do 
    admin = create(:admin)

    visit new_admin_session_path
    fill_in "admin_email", with: admin.email
    fill_in "admin_password", with: "!Password"
    click_button "Sign in"
  end
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
    @vendor = create(:vendor)
    
    visit edit_vendor_path(@vendor)
     
    fill_in 'vendor_name', with: 'test2'
    
    click_button 'Submit'

    page.should have_content 'test2'
	end
	
	scenario 'User deletes a vendor' do
    pending
	end
end