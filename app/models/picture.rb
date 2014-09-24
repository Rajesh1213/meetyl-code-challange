require 'carrierwave/datamapper'
class Picture
  
  include DataMapper::Resource
  include DataMapper::Validate

  property :id, Serial
  property :title, String
  property :description, String
  
  mount_uploader :image, ImageUploader

  validates_presence_of :image

  has n, :comments

end
