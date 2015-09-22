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

FactoryGirl.define do
  factory :user_comment do
    body { Faker::Commerce.product_name }
    commenting_user_id { (1..15).to_a.sample }
    commented_user_id { (1..15).to_a.sample }
  end
end
