class Snap < ActiveRecord::Base
  belongs_to :user
  # validates :picture, presence: true
  mount_base64_uploader :picture, PictureUploader
  crop_uploaded :picture
  has_many :comments, dependent: :destroy
end
