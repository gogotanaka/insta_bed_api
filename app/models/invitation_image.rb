# == Schema Information
#
# Table name: invitation_images
#
#  id            :integer          not null, primary key
#  invitation_id :integer          not null
#  image         :string(255)      not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_invitation_images_on_invitation_id  (invitation_id)
#

class InvitationImage < ActiveRecord::Base

  belongs_to :invitation

  mount_uploader :image, ImageUploader

end
