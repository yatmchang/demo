class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.string :picture
      t.string :title
      t.text :description
      t.string :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
