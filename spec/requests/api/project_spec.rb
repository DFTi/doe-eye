require "spec_helper"

describe API do
  before(:each) do
    @vendor = create :vendor
    post "/api/v1/vendor/login", api_key: @vendor.api_key, api_password: @vendor.api_password
    @access_token = JSON.parse(response.body)["access_token"]
  end

  describe Project do
    before(:each) do
      @project = @vendor.projects.create(name: "My Project")
    end
    describe "GET /api/v1/projects/:id" do
      it "gets the project by id" do
        get "/api/v1/projects/#{@project.id}", access_token: @access_token 
        response.status.should == 200
        #JSON.parse(response.body)["_id"]["$oid"].should eq @project.id
        JSON.parse(response.body)["name"].should eq @project.name
      end
    end
  
    describe "GET /api/v1/projects" do
      it "gets all the projects for a vendor" do
        get "/api/v1/projects/", access_token: @access_token
        response.status.should == 200
        JSON.parse(response.body).should_not eq []
      end
    end

    describe "POST /projects" do
      it "creates the project successfully" do
        post "/api/v1/projects", access_token: @access_token, project: attributes_for(:project)
        response.should be_success
      end
    end
  end
end
