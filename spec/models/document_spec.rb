require 'spec_helper'

describe Document do
  it { should validate_presence_of(:title) }
end
