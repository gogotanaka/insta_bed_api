class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking_user, class_name: '::User'

  mount_uploader :image, ImageUploader
end
