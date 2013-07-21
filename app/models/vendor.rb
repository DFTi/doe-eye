class Vendor
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :api_key
  field :api_password
  
  has_many :authorizations
  has_many :projects

  validates_presence_of :name, :api_key, :api_password
end
