class DocumentType
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  belongs_to :document

end
