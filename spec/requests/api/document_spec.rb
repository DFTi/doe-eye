require 'spec_helper'

describe Document do
  it 'gets all the documents for a project' do
    get '/api/v1/documents/1'
    response.status.should == 200
    JSON.parse(response.body).should == []
  end

  it 'gets a document' do
    get '/api/v1/documents/1'
    response.status.should == 200
    JSON.parse(response.body).should == []
  end
end
