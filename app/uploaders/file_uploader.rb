# encoding: utf-8
class FileUploader < CarrierWave::Uploader::Base
 storage :grid_fs

    # Override the directory where uploaded files will be stored.
 def store_dir
  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
 end
end
