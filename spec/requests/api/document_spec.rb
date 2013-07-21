require 'spec_helper'

describe API do
  before(:each) do
    @vendor = create :vendor
    post "/api/v1/vendor/login", api_key: @vendor.api_key, api_password: @vendor.api_password
    @access_token = JSON.parse(response.body)["access_token"]

    @project = @vendor.projects.create(name: "My Project")
  end

  describe Document do
    describe "GET /api/v1/projects/:project_id/documents" do
      it 'gets documents for a project' do
        get "/api/v1/projects/#{@project.id}/documents", access_token: @access_token
        response.status.should == 200
        JSON.parse(response.body).should == []
      end
    end
    
    describe "GET /api/v1/documents/:id" do
      before(:each) do
        @document = @project.documents.create(title: "My Document")
      end

      it 'gets a document' do
        get "/api/v1/documents/#{@document.id}", access_token: @access_token
        
        response.status.should == 200
        JSON.parse(response.body).should_not eq []
      end
    end
  end
end
