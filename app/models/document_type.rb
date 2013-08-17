class DocumentType
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  belongs_to :document
  
  validates_presence_of :name
end
