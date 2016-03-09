class PostAttachment < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :post
end
