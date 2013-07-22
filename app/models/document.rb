class Document
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :file, FileUploader

  field :title
  field :file  
  belongs_to :project

  validates_presence_of :title
end
