# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  visibility :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  validates :body, :visibility, :user_id, presence: true
  validates :visibility, inclusion: ["Public", "Private"]

  belongs_to :user
  has_many :goal_comments
end
