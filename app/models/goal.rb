class Goal < ActiveRecord::Base
  validates :body, :visibility, :user_id, presence: true
  validates :visibility, inclusion: ["Public", "Private"]

  belongs_to :user
end
