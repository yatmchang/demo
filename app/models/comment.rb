class Comment < ActiveRecord::Base
  belongs_to :snap
  belongs_to :user
  validates :body, presence: true
end
