class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  belongs_to :vendor
  has_many :documents
  validates_presence_of :name
end
