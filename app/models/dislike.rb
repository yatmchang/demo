class Dislike < ActiveRecord::Base
  belongs_to :user
  belongs_to :snap
end
