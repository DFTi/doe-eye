require 'spec_helper'

feature 'Document Type management' do
  before :each do 
    admin = create(:admin)

    visit new_admin_session_path
    fill_in "admin_email", with: admin.email
    fill_in "admin_password", with: "!Password"
    click_button "Sign in"
  end
  
	scenario 'admin creates a new document type' do
    visit new_document_type_path

    fill_in 'document_type[name]', with: 'test'
    click_button 'Save'
    page.should have_content 'test'
	end

	scenario 'admin deletes a document type' do
    pending
	end

	scenario 'admin views all document types' do
    pending
	end
end
