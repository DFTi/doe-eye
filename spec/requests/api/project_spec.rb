require "spec_helper"

describe Project do
  describe "GET /projects" do
  end

  describe "GET /projects/:id" do
  end
  
  describe "GET /api/v1/projects/:vendor_id" do
    it "gets all the projects for a vendor" do
      get '/api/v1/projects/1'
      response.status.should == 200
      JSON.parse(response.body).should == []
    end
  end

  describe "POST /projects" do
    it "creates the project successfully" do
      post "/api/v1/projects", project: attributes_for(:project)
      response.should be_success
    end
  end
end
