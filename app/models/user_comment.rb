# == Schema Information
#
# Table name: user_comments
#
#  id                 :integer          not null, primary key
#  body               :text             not null
#  commenting_user_id :integer          not null
#  commented_user_id  :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class UserComment < ActiveRecord::Base
  validates :body, :commented_user_id, :commented_user_id, presence: true

  belongs_to :commenting_user,
    class_name: :User,
    foreign_key: :commenting_user_id,
    primary_key: :id

  belongs_to :commented_user,
    class_name: :User,
    foreign_key: :commented_user_id,
    primary_key: :id
end
