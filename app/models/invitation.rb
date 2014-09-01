# == Schema Information
#
# Table name: invitations
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  booking_user_id :integer
#  price           :integer          not null
#  address         :string(255)      not null
#  describe        :text
#  email           :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_invitations_on_booking_user_id  (booking_user_id)
#  index_invitations_on_user_id          (user_id)
#

class Invitation < ActiveRecord::Base

  belongs_to :user
  belongs_to :booking_user, class_name: '::User'

  has_many :images,
    class_name: '::InvitationImage'

  accepts_nested_attributes_for :images,
    allow_destroy: true,
    reject_if: :all_blank

end
