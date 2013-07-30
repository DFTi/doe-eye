require 'spec_helper'

describe Vendor do
	# validations
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:api_key) }
	#it { should validate_presence_of(:api_password) }

	# fields
	it { should be_timestamped_document }
end
