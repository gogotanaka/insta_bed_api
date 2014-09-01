class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :booking_user, index: true

      t.integer :price, null: false
      t.string :address, null: false
      t.text :describe
      t.string :email, null: false

      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :user_id, dependent: :delete
    add_foreign_key :invitations, :users, column: :booking_user_id, dependent: :delete
  end
end
