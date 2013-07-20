require 'spec_helper'

describe Vendor do
	it 'pings' do
		get '/api/v1/ping'
		response.body.should == { :ping => "pong" }.to_json
	end
end
