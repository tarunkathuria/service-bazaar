class AddTitleDescriptionVisibilityToServices < ActiveRecord::Migration
  def change
    add_column :services, :title, :string
    add_column :services, :description, :string
    add_column :services, :visibility, :integer
  end
end
