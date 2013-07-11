require 'spec_helper'

describe Vendor do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:api_key) }
	it { should validate_presence_of(:api_password) }
end
