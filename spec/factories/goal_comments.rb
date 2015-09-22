# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  goal_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :goal_comment do
    body { Faker::Company.catch_phrase }
    goal_id { (1..50).to_a.sample }
    user_id { (1..15).to_a.sample }
  end

end
