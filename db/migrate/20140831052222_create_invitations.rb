class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :booking_user, index: true

      t.integer :price
      t.string :address
      t.string :describe
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
