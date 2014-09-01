class CreateInvitationImages < ActiveRecord::Migration
  def change
    create_table :invitation_images do |t|
      t.belongs_to :invitation, index: true, null: false
      t.string :image, null: false

      t.timestamps
    end
    add_foreign_key :invitation_images, :invitations, dependent: :delete
  end
end
