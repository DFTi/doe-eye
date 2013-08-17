require 'spec_helper'

describe DocumentType do
  it { should validate_presence_of(:name) }
  it { should be_timestamped_document }
end
