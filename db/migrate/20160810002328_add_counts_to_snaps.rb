class AddCountsToSnaps < ActiveRecord::Migration
  def change
    add_column :snaps, :like_count, :integer
    add_column :snaps, :dislike_count, :integer
  end
end
