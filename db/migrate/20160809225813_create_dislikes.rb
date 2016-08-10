class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :snap, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
