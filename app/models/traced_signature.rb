class TracedSignature < ActiveRecord::Base
  mount_uploader :source_image, SourceImageUploader
  validates :source_image, presence: true
end
