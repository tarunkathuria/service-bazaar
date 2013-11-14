class CreateLiesins < ActiveRecord::Migration
  def change
    create_table :liesins do |t|

      t.timestamps
    end
  end
end
