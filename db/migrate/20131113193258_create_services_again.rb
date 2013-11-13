class CreateServicesAgain < ActiveRecord::Migration
  def change
    create_table :services do |t|
      # t.belongs_to :user
      t.string :title
      t.text :description
      t.integer :visibility
      # t.integer :user_id
    end
    # add_index :services, [:user_id]
  end
end
