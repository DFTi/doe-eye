require 'spec_helper'

feature 'Project management' do 
  before :each do 
    admin = create(:admin)

    visit new_admin_session_path
    fill_in "admin_email", with: admin.email
    fill_in "admin_password", with: "!Password"
    click_button "Sign in"
    
    @vendor = create(:vendor)
  end
  
	scenario 'admin creates a project for a vendor' do
    visit new_vendor_project_path(@vendor)

	end

	scenario 'admin deletes a project for a vendor' do
    pending
	end

	scenario 'admin views all projects for a vendor' do
    pending
	end
end
