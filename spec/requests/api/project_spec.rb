require "spec_helper"

describe Project do
  describe "GET /projects" do
  end

  describe "GET /projects/:id" do
  end

  describe "POST /projects" do
    it "creates the project successfully" do
      binding.pry
      post "/api/v1/projects", project: attributes_for(:project)
      response.should be_success
    end
  end

  it "gets all projects for a vendor" do
    get '/api/v1/projects'
    response.status.should == 200
    JSON.parse(response.body).should == []
  end

  describe 'POST /projects' do
    it 'creates and returns the single' do
      post '/api/v1/projects'
    end

  end
end
