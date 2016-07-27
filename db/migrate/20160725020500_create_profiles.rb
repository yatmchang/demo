class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :avatar
      t.text :description

      t.timestamps null: false
    end
  end
end
